/*
  Warnings:

  - You are about to drop the `fish` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `fish`;

-- CreateTable
CREATE TABLE `Product` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `reference` VARCHAR(191) NULL,
    `category_id` VARCHAR(191) NOT NULL DEFAULT 'carpe',
    `famille_id` INTEGER NULL,
    `type` VARCHAR(191) NOT NULL DEFAULT 'carpe koi',
    `prix` DOUBLE NULL,
    `naissance` DATETIME(3) NULL,
    `age` INTEGER NULL,
    `taille` INTEGER NULL,
    `couleurs` JSON NULL,
    `eleveur` INTEGER NULL,
    `reserve_by_user_id` INTEGER NOT NULL DEFAULT 0,
    `vendue` BOOLEAN NOT NULL DEFAULT false,
    `image1` VARCHAR(191) NULL,
    `description` VARCHAR(191) NULL,
    `data_arrivee_stock` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Panier` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_user` INTEGER NULL,
    `id_product` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Wishlist` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_user` INTEGER NULL,
    `id_product` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Familles` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
