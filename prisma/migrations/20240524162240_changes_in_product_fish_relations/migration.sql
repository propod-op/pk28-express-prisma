/*
  Warnings:

  - You are about to drop the column `category_id` on the `fish` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `fish` DROP FOREIGN KEY `Fish_category_id_fkey`;

-- AlterTable
ALTER TABLE `fish` DROP COLUMN `category_id`;
