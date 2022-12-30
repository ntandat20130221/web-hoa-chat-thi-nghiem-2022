-- ACCOUNT_ADMIN
ALTER TABLE account_admin ADD COLUMN fullname VARCHAR(255);
			
-- PRODUCTS
ALTER TABLE products DROP COLUMN country;
ALTER TABLE products ADD COLUMN nameAdmin VARCHAR(50);
ALTER TABLE products ADD COLUMN views INT DEFAULT 0;
SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE products CHANGE id_type_product id_subtype INT NOT NULL;
ALTER TABLE products ADD CONSTRAINT `fk_id_type_product` FOREIGN KEY (`id_subtype`) REFERENCES type_product (`id_type_product`) ON UPDATE RESTRICT ON DELETE RESTRICT;
SET FOREIGN_KEY_CHECKS = 1;

-- SOLD_PRODUCT
ALTER TABLE sold_product MODIFY COLUMN datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- PRICE_PRODUCT
ALTER TABLE price_product MODIFY COLUMN date TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE price_product ADD COLUMN nameAdmin VARCHAR(50);

-- SUBTYPE PRODUCT
ALTER TABLE subtype_product ADD COLUMN sign VARCHAR(50);

-- SUBTYPE PRODUCT
ALTER TABLE bills MODIFY COLUMN bill_price DOUBLE NOT NULL;
ALTER TABLE bills MODIFY COLUMN total_price DOUBLE NOT NULL;

-- NEWS
ALTER	TABLE news
			MODIFY COLUMN content_news LONGTEXT NOT NULL;
			
ALTER TABLE news
			ADD COLUMN nameAdmin VARCHAR(255);
