const express = require("express");
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const router = express.Router();
const { authenticateToken, isAdmin } = require("./authToken");

// Obtenir tout les Products
router.get("/products", async (req, res) => {
	try {
		const products = await prisma.product.findMany();
		if (products.length > 0) {
			res.json(products);
		} else {
			res.status(404).send("Aucun produit trouvé"); // Lancer une erreur si aucun résultat n'est trouvé
		}
	} catch (error) {
		console.error(error); // Enregistrer l'erreur dans la console
		res.status(404).send("Erreur produit (voir log)"); // Renvoyer un code d'état 404 et un message d'erreur
	}
});

// Obtenir un Product
router.get("/product/:id", authenticateToken, async (req, res) => {
	try {
		const { id } = req.params;
		const product = await prisma.product.findFirst({
			where: { id: Number(id) },
		});

		if (product.length > 0) {
			res.json(product);
		} else {
			res.status(404).send("Aucun produit trouvé"); // Lancer une erreur si aucun résultat n'est trouvé
		}
	} catch (error) {
		console.error(error); // Enregistrer l'erreur dans la console
		res.status(404).send("Erreur produit (voir log)"); // Renvoyer un code d'état 404 et un message d'erreur
	}
});

// Ajouter un Product
router.post("/product", authenticateToken, async (req, res) => {
	const { title, content, authorEmail } = req.body;
	try {
		const product = await prisma.product.create({
			data: {
				author: { connect: { email: authorEmail } },
			},
		});
		res.json(product);
	} catch (error) {
		console.error(error); // Enregistrer l'erreur dans la console
		res.status(404).send("Erreur produit (voir log)"); // Renvoyer un code d'état 404 et un message d'erreur
	}
});

router.post("/product/add", authenticateToken, isAdmin, async (req, res) => {
	const { reference, prix, description, data_arrivee_stock, vendu, image1, category_id } = req.body;

	try {
		const newProduct = await prisma.product.create({
			data: {
				reference,
				prix,
				description,
				data_arrivee_stock: data_arrivee_stock ? new Date(data_arrivee_stock) : undefined,
				vendu,
				image1,
				category_id,
			},
		});
		res.status(201).json(newProduct);
	} catch (error) {
		res.status(400).json({ error: error.message });
	}
});

/*router.post("/fish/add", authenticateToken, isAdmin, async (req, res) => {
	const { reference, prix, description, data_arrivee_stock, vendu, image1, category_id } = req.body;

	try {
		const newProduct = await prisma..create({
			data: {
				reference,
				prix,
				description,
				data_arrivee_stock: data_arrivee_stock ? new Date(data_arrivee_stock) : undefined,
				vendu,
				image1,
				category_id,
			},
		});
		res.status(201).json(newProduct);
	} catch (error) {
		res.status(400).json({ error: error.message });
	}
});
*/
module.exports = router;
