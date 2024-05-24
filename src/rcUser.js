const { PrismaClient } = require("@prisma/client");
const express = require("express");

const router = express.Router();
const prisma = new PrismaClient();
const app = express();
app.use(express.json());

const { authenticateToken, isAdmin } = require("./authToken");

// Obtenir la liste des utilisateurs et de toutes leurs informations
router.get("/users", authenticateToken, isAdmin, async (req, res) => {
	const users = await prisma.user.findMany();
	res.json(users);
});

// Obtenir les informations d'un utilisateur
router.post("/user/:id", authenticateToken, async (req, res) => {
	const { id } = req.params;
	const result = await prisma.user.findFirst({
		where: { id: Number(id) },
		select: { email: true, jwt: true, name: true },
	});
	res.json(result);
});

module.exports = router;
