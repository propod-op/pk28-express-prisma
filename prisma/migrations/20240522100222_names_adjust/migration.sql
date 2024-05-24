/*
  Warnings:

  - You are about to drop the column `reserve_by_user_id` on the `product` table. All the data in the column will be lost.
  - You are about to drop the column `id_product` on the `wishlist` table. All the data in the column will be lost.
  - You are about to drop the column `id_user` on the `wishlist` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `product` DROP COLUMN `reserve_by_user_id`,
    ADD COLUMN `reservebyId` INTEGER NOT NULL DEFAULT 0;

-- AlterTable
ALTER TABLE `wishlist` DROP COLUMN `id_product`,
    DROP COLUMN `id_user`,
    ADD COLUMN `productId` INTEGER NULL,
    ADD COLUMN `userId` INTEGER NULL;
