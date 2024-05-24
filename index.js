const { PrismaClient } = require("@prisma/client");
const express = require("express");

const app = express();
app.use(express.json());

// Importer les routes
const rcAuth = require("./src/rcAuth");
const rcUser = require("./src/rcUser");
const rcPost = require("./src/rcPost");
const rcProduct = require("./src/rcProduct");
app.use(rcAuth);
app.use(rcUser);
app.use(rcPost);
app.use(rcProduct);

app.listen(3000, () => console.log("REST API server ready at: http://localhost:3000"));
