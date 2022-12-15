CREATE TRIGGER `limit_stars`
BEFORE INSERT ON `review_product` FOR EACH ROW
BEGIN
	IF NEW.stars > 5 OR NEW.stars < 1 THEN SIGNAL SQLSTATE '45001' SET message_text = 'stars must be in 1 - 5';
	END IF;
END;

CREATE TRIGGER `limit_stars_update`
BEFORE UPDATE ON `review_product` FOR EACH ROW
BEGIN
	IF NEW.stars > 5 OR NEW.stars < 1 THEN SIGNAL SQLSTATE '45001' SET message_text = 'stars must be in 1 - 5';
	END IF;
END;
