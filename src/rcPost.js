const express = require("express");
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const router = express.Router();
const { authenticateToken, isAdmin } = require("./authToken");

// Obtenir tout les Post
router.get("/posts", authenticateToken, isAdmin, async (req, res) => {
	try {
		const result = await prisma.post.findMany();
		if (result.length > 0) {
			res.json(result);
		} else {
			res.status(404).send("Aucun post trouvé"); // Lancer une erreur si aucun résultat n'est trouvé
		}
	} catch (error) {
		console.error(error); // Enregistrer l'erreur dans la console
		res.status(404).send("Erreur post (voir log)"); // Renvoyer un code d'état 404 et un message d'erreur
	}
});

// Obtenir un post par :id
router.get("/post/:id", authenticateToken, async (req, res) => {
	try {
		const { id } = req.params;
		const post = await prisma.post.findFirst({
			where: { id: Number(id) },
		});

		if (result.length > 0) {
			res.json(post);
		} else {
			res.status(404).send("Aucun post trouvé"); // Lancer une erreur si aucun résultat n'est trouvé
		}
	} catch (error) {
		console.error(error); // Enregistrer l'erreur dans la console
		res.status(404).send("Erreur post (voir log)"); // Renvoyer un code d'état 404 et un message d'erreur
	}
});

// Ajouter un Post
router.post("/post", authenticateToken, async (req, res) => {
	const { title, content, authorEmail } = req.body;
	const result = await prisma.post.create({
		data: {
			title,
			content,
			published: false,
			author: { connect: { email: authorEmail } },
		},
	});
	res.json(result);
});

// Mettre à jour un Post à l'état « Published:true »
router.put("/post/:id", authenticateToken, async (req, res) => {
	const { id } = req.params;
	const post = await prisma.post.update({
		where: { id: Number(id) },
		data: { published: true },
	});
	res.json(post);
});

// Mettre à jour un Post à l'état « Published:true »
router.put("/post/publish/:id", authenticateToken, async (req, res) => {
	const { id } = req.params;
	const post = await prisma.post.update({
		where: { id: Number(id) },
		data: { published: true },
	});
	res.json(post);
});

// Supprimer un post
router.delete("/post/:id", authenticateToken, async (req, res) => {
	const { id } = req.params;
	const post = await prisma.post.delete({
		where: { id: Number(id) },
	});
	res.json(post);
});

// Obtenir la liste des auteurs publiés (published:true)
router.get("/feed", authenticateToken, async (req, res) => {
	const posts = await prisma.post.findMany({
		where: { published: true },
		include: { author: true },
	});
	res.json(posts);
});

module.exports = router;
