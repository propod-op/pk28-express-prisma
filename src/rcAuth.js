const express = require("express");
const bcrypt = require("bcryptjs");
const { PrismaClient } = require("@prisma/client");
const dotenv = require("dotenv");
const jwt = require("jsonwebtoken");

dotenv.config();
const prisma = new PrismaClient();
const router = express.Router();

// Route d'enregistrement d'un utilisateur
router.post("/register", async (req, res) => {
	const { email, name, password } = req.body;
	const hashedPassword = await bcrypt.hash(password, 10);
	const user = await prisma.user.create({
		data: {
			email,
			name,
			password: hashedPassword,
		},
	});
	res.json(user);
});

// Route de login + jwt
router.post("/login", async (req, res) => {
	const { email, password } = req.body;
	const user = await prisma.user.findUnique({ where: { email } });

	console.log(user.isAdmin);
	if (!user || !(await bcrypt.compare(password, user.password))) {
		return res.status(401).send("Invalid credentials");
	}

	const token = jwt.sign({ userId: user.id }, process.env.JWT_SECRET, { expiresIn: "1h" });

	const post = await prisma.user.update({
		where: { id: user.id },
		data: { jwt: token },
	});
	console.log(post);
	res.json({ token });
});

module.exports = router;
