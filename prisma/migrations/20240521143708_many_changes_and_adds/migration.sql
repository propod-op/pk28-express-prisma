/*
  Warnings:

  - You are about to alter the column `category_id` on the `product` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - You are about to drop the `familles` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterTable
ALTER TABLE `product` MODIFY `category_id` INTEGER NULL;

-- DropTable
DROP TABLE `familles`;

-- CreateTable
CREATE TABLE `categorie` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Famille` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NULL,
    `category_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
