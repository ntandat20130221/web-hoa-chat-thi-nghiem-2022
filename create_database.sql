CREATE DATABASE hoa_chat_thi_nghiem;
USE hoa_chat_thi_nghiem;

CREATE TABLE `account_admin` (
	`username` 			VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`id_role_admin` 	INT NOT NULL,
	`id_status_acc` 	INT NOT NULL,
	`passwordAD` 		VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`time_created` 		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`time_change_pass`	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`username`) USING BTREE,
	INDEX `id_status_acc`(`id_status_acc` ASC) USING BTREE,
	INDEX `id_role_admin`(`id_role_admin` ASC) USING BTREE
) 	ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `account_customer`	(
	`id_user_customer` 	INT NOT NULL AUTO_INCREMENT,
	`username` 			VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`pass` 				VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`id_status_acc` 	INT NOT NULL,
	`id_city` 			INT NOT NULL,
	`fullname` 			VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
	`sex` 				VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
	`email_customer` 	VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
	`phone_customer` 	VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
	`address` 			VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
	`time_created` 		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`time_change_pass`	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id_user_customer`) USING BTREE,
	INDEX `id_status_acc`(`id_status_acc` ASC) USING BTREE,
	INDEX `id_city`(`id_city` ASC) USING BTREE,
	UNIQUE INDEX `username`(`username` ASC) USING BTREE
) 	ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `bill_detail` (
	`id_bill` 		INT NOT NULL,
	`id_product` 	INT NOT NULL,
	`quantity` 		INT NOT NULL,
	`listed_price` 	BIGINT NOT NULL,
	`current_price`	BIGINT NOT NULL,
	PRIMARY KEY (`id_bill`, `id_product`) USING BTREE,
	INDEX `id_product`(`id_product` ASC) USING BTREE
) 	ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `bills` (
	`id_bill` 			INT NOT NULL AUTO_INCREMENT,
	`id_user` 			INT NOT NULL,
	`id_status_bill` 	INT NOT NULL,
	`id_city` 			INT NOT NULL,
	`fullname_customer`	VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`phone_customer` 	VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`email_customer` 	VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`address_customer` 	VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`bill_price` 		BIGINT NOT NULL,
	`total_price` 		BIGINT NOT NULL,
	`time_order` 		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id_bill`) USING BTREE,
	INDEX `id_user`(`id_user` ASC) USING BTREE,
	INDEX `id_status_bill`(`id_status_bill` ASC) USING BTREE,
	INDEX `id_city`(`id_city` ASC) USING BTREE
) 	ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `city` (
	`id_city` 	INT NOT NULL AUTO_INCREMENT,
	`name_city` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`transport` BIGINT NOT NULL,
	PRIMARY KEY (`id_city`) USING BTREE
) 	ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `comment_news` (
	`id_comment` 		INT NOT NULL AUTO_INCREMENT,
	`id_news` 			INT NOT NULL,
	`id_user_customer` 	INT NOT NULL,
	`time_comment` 		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`content_comment` 	TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	PRIMARY KEY (`id_comment`) USING BTREE,
	INDEX `id_news`(`id_news` ASC) USING BTREE,
	INDEX `id_user_customer`(`id_user_customer` ASC) USING BTREE
) 	ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `contact` (
	`id_contact` 		INT NOT NULL AUTO_INCREMENT,
	`full_name` 		VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`phone_contact` 	VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`email_contact` 	VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`problem_name` 		VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`content_problem`	TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`time_insert` 		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id_contact`) USING BTREE
) 	ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `infor_web` (
	`id_infor` 		INT NOT NULL AUTO_INCREMENT,
	`phone_web` 	VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`email_web` 	VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`address_web`	VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	PRIMARY KEY (`id_infor`) USING BTREE
) 	ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `news` (
	`id_news` 			INT NOT NULL AUTO_INCREMENT,
	`title_news` 		TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`content_news` 		TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`url_img_news` 		TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
	`date_posted` 		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`quantity_comment`	INT NOT NULL,
	PRIMARY KEY (`id_news`) USING BTREE
) 	ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `price_product` (
	`id_product` 		INT NOT NULL,
	`date` 				TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`listed_price` 		BIGINT NOT NULL,
	`current_price`		BIGINT NOT NULL,
	PRIMARY KEY (`id_product`, `date`) USING BTREE
) 	ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `products` (
	`id_product` 			INT NOT NULL AUTO_INCREMENT,
	`id_type_product` 		INT NOT NULL,
	`id_status_product` 	INT NOT NULL,
	`id_supplier` 			INT NOT NULL,
	`name_product` 			VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`description_product`	TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
	`url_img_product` 		TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
	`quantity_product` 		INT NOT NULL,
	`country` 				VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
	`date_inserted` 		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`star_review` 			TINYINT NULL DEFAULT NULL,
	PRIMARY KEY (`id_product`) USING BTREE,
	INDEX `id_type_product`(`id_type_product` ASC) USING BTREE,
	INDEX `id_status_product`(`id_status_product` ASC) USING BTREE,
	INDEX `id_supplier`(`id_supplier` ASC) USING BTREE
) 	ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `role_admin` (
	`id_role_admin`	INT NOT NULL,
	`name_role` 	VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	PRIMARY KEY (`id_role_admin`) USING BTREE
) 	ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `sold_product` (
	`id_product` 		INT NOT NULL,
	`datetime` 			TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`quantity_sold` 	INT NOT NULL,
	PRIMARY KEY (`id_product`, `datetime`) USING BTREE
) 	ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `status_acc` (
	`id_status_acc` 	INT NOT NULL,
	`name_status_acc`	VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
	PRIMARY KEY (`id_status_acc`) USING BTREE
) 			ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `status_bill` (
	`id_status_bill` 	INT NOT NULL,
	`name_status_bill`	VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	PRIMARY KEY (`id_status_bill`) USING BTREE
)	ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `status_product` (
	`id_status_product` 	INT NOT NULL,
	`name_status_product`	VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	PRIMARY KEY (`id_status_product`) USING BTREE
) 	ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `suppliers` (
	`id_supplier` 	INT NOT NULL AUTO_INCREMENT,
	`name_supplier`	VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	PRIMARY KEY (`id_supplier`) USING BTREE
) 	ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `type_product` (
	`id_type_product` 	INT NOT NULL AUTO_INCREMENT,
	`name_type_product`	VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	PRIMARY KEY (`id_type_product`) USING BTREE
) 	ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

DROP TABLE iF EXISTS `subtype_product`;
CREATE TABLE `subtype_product` (
	`id_subtype` 		INT NOT NULL,
	`name_subtype` 		VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	`id_type_product` 	INT NOT NULL,
	PRIMARY KEY (`id_subtype`) USING BTREE,
	FOREIGN KEY (`id_type_product`) REFERENCES type_product(`id_type_product`)
) 	ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

ALTER TABLE `account_admin` ADD CONSTRAINT `account_admin_ibfk_1` FOREIGN KEY (`id_status_acc`) REFERENCES `status_acc` (`id_status_acc`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `account_admin` ADD CONSTRAINT `account_admin_ibfk_2` FOREIGN KEY (`id_role_admin`) REFERENCES `role_admin` (`id_role_admin`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `account_customer` ADD CONSTRAINT `account_customer_ibfk_1` FOREIGN KEY (`id_status_acc`) REFERENCES `status_acc` (`id_status_acc`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `account_customer` ADD CONSTRAINT `account_customer_ibfk_2` FOREIGN KEY (`id_city`) REFERENCES `city` (`id_city`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `bill_detail` ADD CONSTRAINT `bill_detail_ibfk_1` FOREIGN KEY (`id_bill`) REFERENCES `bills` (`id_bill`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `bill_detail` ADD CONSTRAINT `bill_detail_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `bills` ADD CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`id_status_bill`) REFERENCES `status_bill` (`id_status_bill`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `bills` ADD CONSTRAINT `bills_ibfk_3` FOREIGN KEY (`id_city`) REFERENCES `city` (`id_city`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `bills` ADD CONSTRAINT `bills_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `account_customer` (`id_user_customer`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `comment_news` ADD CONSTRAINT `comment_news_ibfk_1` FOREIGN KEY (`id_news`) REFERENCES `news` (`id_news`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `comment_news` ADD CONSTRAINT `comment_news_ibfk_2` FOREIGN KEY (`id_user_customer`) REFERENCES `account_customer` (`id_user_customer`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `price_product` ADD CONSTRAINT `price_product_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `products` ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_type_product`) REFERENCES `type_product` (`id_type_product`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `products` ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`id_status_product`) REFERENCES `status_product` (`id_status_product`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `products` ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`id_supplier`) REFERENCES `suppliers` (`id_supplier`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `sold_product` ADD CONSTRAINT `sold_product_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT;
