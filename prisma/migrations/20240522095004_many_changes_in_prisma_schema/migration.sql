/*
  Warnings:

  - You are about to drop the column `category_id` on the `famille` table. All the data in the column will be lost.
  - You are about to drop the column `id_product` on the `panier` table. All the data in the column will be lost.
  - You are about to drop the column `id_user` on the `panier` table. All the data in the column will be lost.
  - You are about to drop the column `authorId` on the `post` table. All the data in the column will be lost.
  - You are about to drop the column `type` on the `product` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `post` DROP FOREIGN KEY `Post_authorId_fkey`;

-- AlterTable
ALTER TABLE `famille` DROP COLUMN `category_id`,
    ADD COLUMN `description` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `panier` DROP COLUMN `id_product`,
    DROP COLUMN `id_user`,
    ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `productId` INTEGER NULL,
    ADD COLUMN `userId` INTEGER NULL;

-- AlterTable
ALTER TABLE `post` DROP COLUMN `authorId`;

-- AlterTable
ALTER TABLE `product` DROP COLUMN `type`;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_famille_id_fkey` FOREIGN KEY (`famille_id`) REFERENCES `Famille`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `Categorie`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
