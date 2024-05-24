/*
  Warnings:

  - You are about to drop the column `age` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `couleurs` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `eleveur` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `famille_id` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `naissance` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `reservebyId` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `taille` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `vendue` on the `product` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `product` DROP FOREIGN KEY `Product_famille_id_fkey`;

-- AlterTable
ALTER TABLE `product` DROP COLUMN `age`,
    DROP COLUMN `couleurs`,
    DROP COLUMN `eleveur`,
    DROP COLUMN `famille_id`,
    DROP COLUMN `naissance`,
    DROP COLUMN `reservebyId`,
    DROP COLUMN `taille`,
    DROP COLUMN `vendue`,
    ADD COLUMN `familleId` INTEGER NULL,
    ADD COLUMN `vendu` BOOLEAN NOT NULL DEFAULT false;

-- CreateTable
CREATE TABLE `Fish` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `reference` VARCHAR(191) NULL,
    `famille_id` INTEGER NULL,
    `category_id` INTEGER NOT NULL DEFAULT 1,
    `prix` DOUBLE NULL,
    `description` VARCHAR(191) NULL,
    `data_arrivee_stock` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `naissance` DATETIME(3) NULL,
    `age` INTEGER NULL,
    `taille` INTEGER NULL,
    `couleurs` JSON NULL,
    `eleveur` INTEGER NULL,
    `reservebyId` INTEGER NOT NULL DEFAULT 0,
    `vendue` BOOLEAN NOT NULL DEFAULT false,
    `image1` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Fish` ADD CONSTRAINT `Fish_famille_id_fkey` FOREIGN KEY (`famille_id`) REFERENCES `Famille`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Fish` ADD CONSTRAINT `Fish_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `Categorie`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_familleId_fkey` FOREIGN KEY (`familleId`) REFERENCES `Famille`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
