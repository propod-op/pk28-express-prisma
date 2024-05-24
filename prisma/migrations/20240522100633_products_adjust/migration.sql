/*
  Warnings:

  - Made the column `category_id` on table `product` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE `product` DROP FOREIGN KEY `Product_category_id_fkey`;

-- AlterTable
ALTER TABLE `product` MODIFY `category_id` INTEGER NOT NULL DEFAULT 1;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `Categorie`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
