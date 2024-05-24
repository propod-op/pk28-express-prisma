// Middleware pour vérifier le jeton JWT
const dotenv = require("dotenv");
const jwt = require("jsonwebtoken");
dotenv.config();

const authenticateToken = (req, res, next) => {
	const token = req.headers["authorization"];
	if (!token) return res.sendStatus(401);

	jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
		if (err) return res.sendStatus(403);
		req.user = user;
		next();
	});
};

const express = require("express");
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

const isAdmin = async (req, res, next) => {
	try {
		const jwtAdmin = req.headers.authorization;
		const result = await prisma.user.findFirst({
			where: { jwt: jwtAdmin },
			select: { isAdmin: true, jwt: true, name: true },
		});
		console.log(result);

		if (result?.isAdmin) {
			next();
		} else {
			return res.status(403).json({ message: "Unauthorized: Admin access required" });
		}
	} catch (error) {
		console.error(error); // Handle errors appropriately (e.g., log or return error response)
		return res.status(500).json({ message: "Internal Server Error" });
	}
};
module.exports = {
	authenticateToken,
	isAdmin,
};
