/*
  Warnings:

  - You are about to drop the column `productId` on the `panier` table. All the data in the column will be lost.
  - You are about to drop the column `familleId` on the `product` table. All the data in the column will be lost.
  - You are about to drop the `wishlist` table. If the table is not empty, all the data it contains will be lost.
  - Made the column `userId` on table `panier` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE `product` DROP FOREIGN KEY `Product_familleId_fkey`;

-- AlterTable
ALTER TABLE `panier` DROP COLUMN `productId`,
    MODIFY `userId` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `product` DROP COLUMN `familleId`;

-- DropTable
DROP TABLE `wishlist`;

-- CreateTable
CREATE TABLE `PanierProduct` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `panierId` INTEGER NOT NULL,
    `productId` INTEGER NOT NULL,

    UNIQUE INDEX `PanierProduct_panierId_productId_key`(`panierId`, `productId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Panier` ADD CONSTRAINT `Panier_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PanierProduct` ADD CONSTRAINT `PanierProduct_panierId_fkey` FOREIGN KEY (`panierId`) REFERENCES `Panier`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PanierProduct` ADD CONSTRAINT `PanierProduct_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
