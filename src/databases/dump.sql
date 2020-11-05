-- purchases

CREATE TABLE IF NOT EXISTS `shippings` (
  `shipping_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`shipping_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `consumers` (
  `consumer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(255) NULL,
  `number` VARCHAR(45) NULL,
  `complement` VARCHAR(80) NULL,
  `neighborhood` VARCHAR(80) NULL,
  `zipcode` VARCHAR(45) NOT NULL,
  `estate` VARCHAR(2) NULL,
  `country` VARCHAR(80) NOT NULL,
  `document` VARCHAR(45) NULL,
  `active` TINYINT(1) NULL DEFAULT 1,
  `created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`consumer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `purchases` (
  `purchase_id` INT(11) NOT NULL AUTO_INCREMENT,
  `consumer_id` INT(11) NOT NULL,
  `open` ENUM('yes', 'no') NOT NULL DEFAULT 'yes',
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`purchase_id`, `consumer_id`),
  INDEX `fk_purchases_consumers1_idx` (`consumer_id` ASC),
  CONSTRAINT `fk_purchases_consumers1`
    FOREIGN KEY (`consumer_id`)
    REFERENCES `heartwood`.`consumers` (`consumer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `assets` (
  `asset_id` INT(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  `shipping_id` INT(11) NOT NULL,
  `shipping_value` DECIMAL(10,2) NULL DEFAULT 0,
  `quantity` INT(11) NOT NULL,
  `value` DECIMAL(12,2) NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`asset_id`, `purchase_id`, `product_id`, `shipping_id`),
  INDEX `fk_assets_purchases1_idx` (`purchase_id` ASC),
  INDEX `fk_assets_shippings1_idx` (`shipping_id` ASC),
  CONSTRAINT `fk_assets_purchases1`
    FOREIGN KEY (`purchase_id`)
    REFERENCES `heartwood`.`purchases` (`purchase_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_assets_shippings1`
    FOREIGN KEY (`shipping_id`)
    REFERENCES `heartwood`.`shippings` (`shipping_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;