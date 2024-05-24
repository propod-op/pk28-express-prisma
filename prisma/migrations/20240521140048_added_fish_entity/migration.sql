-- CreateTable
CREATE TABLE `Fish` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `reference` VARCHAR(191) NULL,
    `prix` DOUBLE NULL,
    `naissance` DATETIME(3) NULL,
    `age` INTEGER NULL,
    `famille` VARCHAR(191) NULL,
    `taille` INTEGER NULL,
    `couleurs` JSON NULL,
    `eleveur` INTEGER NULL,
    `reserve_by_user_id` INTEGER NOT NULL DEFAULT 0,
    `vendue` BOOLEAN NOT NULL DEFAULT false,
    `image1` VARCHAR(191) NULL,
    `type` VARCHAR(191) NOT NULL DEFAULT 'carpe koi',
    `description` VARCHAR(191) NULL,
    `data_arrivee_stock` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
