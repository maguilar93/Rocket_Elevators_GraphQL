CREATE TABLE `Leads` (
	`lead_ID` INT NOT NULL AUTO_INCREMENT,
	`full_name` VARCHAR(255) NOT NULL,
	`company_name` varchar(20) NOT NULL,
	`email` VARCHAR(255) NOT NULL,
	`phone` varchar(10) NOT NULL,
	`project_name` VARCHAR(15) NOT NULL,
	`department` VARCHAR(10) NOT NULL,
	`message` TEXT NOT NULL,
	`attached_file` blob NOT NULL,
	`date_of_contact` DATE NOT NULL,
	PRIMARY KEY (`lead_ID`)
);

CREATE TABLE `Address` (
	`address_ID` INT NOT NULL AUTO_INCREMENT,
	`type_of_address` TEXT NOT NULL,
	`status` TEXT NOT NULL,
	`entity` TEXT NOT NULL,
	`number_n_street` VARCHAR(255) NOT NULL,
	`suite_or_apt` varchar(5) NOT NULL,
	`city` varchar(20) NOT NULL,
	`postal_code` varchar(7) NOT NULL,
	`country` varchar(20) NOT NULL,
	`notes` TEXT NOT NULL,
	PRIMARY KEY (`address_ID`)
);

CREATE TABLE `Buildings` (
	`building_ID` INT NOT NULL AUTO_INCREMENT,
	`address_ID` INT NOT NULL,
	`customer_ID` INT NOT NULL,
	`full_name_building_admin` VARCHAR(255) NOT NULL,
	`admin_email` VARCHAR(255) NOT NULL,
	`admin_phone` varchar(10) NOT NULL,
	`full_name_tech_contact` VARCHAR(255) NOT NULL,
	`tech_email` VARCHAR(255) NOT NULL,
	`tech_phone` varchar(10) NOT NULL,
	PRIMARY KEY (`building_ID`)
);

CREATE TABLE `Customers` (
	`customer_ID` INT NOT NULL AUTO_INCREMENT,
	`customer_create_date` TIMESTAMP NOT NULL AUTO_INCREMENT,
	`company_name` varchar(255) NOT NULL UNIQUE,
	`company_hq_addr_ID` varchar(255) NOT NULL,
	`name_company_contact` VARCHAR(255) NOT NULL,
	`company_phone` varchar(11) NOT NULL,
	`contact_email` VARCHAR(255) NOT NULL,
	`company_desc` TEXT NOT NULL,
	`full_name_STA` VARCHAR(255) NOT NULL,
	`tech_authority_phone` varchar(11) NOT NULL,
	`tech_manager_email` varchar(255) NOT NULL,
	PRIMARY KEY (`customer_ID`)
);

CREATE TABLE `BuildingDetails` (
	`buildingdetail_ID` INT NOT NULL AUTO_INCREMENT,
	`building_ID` INT NOT NULL,
	`info_key` blob NOT NULL,
	`value` blob NOT NULL,
	PRIMARY KEY (`buildingdetail_ID`)
);

CREATE TABLE `Columns` (
	`column_ID` INT NOT NULL AUTO_INCREMENT,
	`battery_ID` INT NOT NULL,
	`column_type` varchar(50) NOT NULL,
	`number_floors` INT NOT NULL,
	`status` VARCHAR(255) NOT NULL,
	`info` TEXT NOT NULL,
	`notes` TEXT NOT NULL,
	PRIMARY KEY (`column_ID`)
);

CREATE TABLE `Batteries` (
	`battery_ID` INT NOT NULL,
	`building_ID` INT NOT NULL,
	`battery_type` varchar(50) NOT NULL,
	`status` TEXT NOT NULL,
	`employee_ID` INT NOT NULL,
	`date_commision` DATE NOT NULL,
	`date_last_inspect` DATE NOT NULL,
	`certificate_operations` blob NOT NULL,
	`info` TEXT NOT NULL,
	`notes` TEXT NOT NULL
);

CREATE TABLE `Quotes` (
	`quote_ID` INT NOT NULL AUTO_INCREMENT,
	`type` VARCHAR(255) NOT NULL,
	`product_grade` VARCHAR(255) NOT NULL,
	`nb_apartments` INT NOT NULL,
	`nb_businesses` INT NOT NULL,
	`nb_companies` INT NOT NULL,
	`nb_floors` INT NOT NULL,
	`nb_basements` INT NOT NULL,
	`nb_cages` INT NOT NULL,
	`nb_parkings` INT NOT NULL,
	`nb_occupantsPerFloor` INT NOT NULL,
	`nb_operatingHours` INT NOT NULL,
	`nb_elevSuggested` INT NOT NULL,
	`pricePerElev` DECIMAL NOT NULL,
	`subtotal` DECIMAL NOT NULL,
	`installFee` DECIMAL NOT NULL,
	`finalPrice` DECIMAL NOT NULL,
	PRIMARY KEY (`quote_ID`)
);

CREATE TABLE `Elevators` (
	`elevator_ID` INT NOT NULL AUTO_INCREMENT,
	`column_ID` INT NOT NULL,
	`serial_number` varchar(30) NOT NULL UNIQUE,
	`model` varchar(30) NOT NULL,
	`type` varchar(11) NOT NULL,
	`status` VARCHAR(255) NOT NULL,
	`date_commision` DATE NOT NULL,
	`date_last_inspect` DATE NOT NULL,
	`certificate_inspect` blob NOT NULL,
	`info` TEXT NOT NULL,
	`notes` TEXT NOT NULL,
	PRIMARY KEY (`elevator_ID`)
);

CREATE TABLE `Users` (
	`user_ID` INT NOT NULL AUTO_INCREMENT,
	`email` VARCHAR(255) NOT NULL UNIQUE,
	`password` VARCHAR(255) NOT NULL,
	`employee_ID` INT,
	`customer_ID` INT,
	PRIMARY KEY (`user_ID`)
);

CREATE TABLE `Employee` (
	`employee_ID` INT NOT NULL AUTO_INCREMENT,
	`user_ID` INT NOT NULL,
	`last_name` VARCHAR(255) NOT NULL,
	`first_name` VARCHAR(255) NOT NULL,
	`title` VARCHAR(255) NOT NULL,
	`email` VARCHAR(255) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`employee_ID`)
);

ALTER TABLE `Buildings` ADD CONSTRAINT `Buildings_fk0` FOREIGN KEY (`address_ID`) REFERENCES `Address`(`address_ID`);

ALTER TABLE `Buildings` ADD CONSTRAINT `Buildings_fk1` FOREIGN KEY (`customer_ID`) REFERENCES `Customers`(`customer_ID`);

ALTER TABLE `Customers` ADD CONSTRAINT `Customers_fk0` FOREIGN KEY (`company_hq_addr_ID`) REFERENCES `Address`(`address_ID`);

ALTER TABLE `BuildingDetails` ADD CONSTRAINT `BuildingDetails_fk0` FOREIGN KEY (`building_ID`) REFERENCES `Buildings`(`building_ID`);

ALTER TABLE `Columns` ADD CONSTRAINT `Columns_fk0` FOREIGN KEY (`battery_ID`) REFERENCES `Batteries`(`battery_ID`);

ALTER TABLE `Batteries` ADD CONSTRAINT `Batteries_fk0` FOREIGN KEY (`building_ID`) REFERENCES `Buildings`(`building_ID`);

ALTER TABLE `Batteries` ADD CONSTRAINT `Batteries_fk1` FOREIGN KEY (`employee_ID`) REFERENCES `Employee`(`employee_ID`);

ALTER TABLE `Elevators` ADD CONSTRAINT `Elevators_fk0` FOREIGN KEY (`column_ID`) REFERENCES `Columns`(`column_ID`);

ALTER TABLE `Users` ADD CONSTRAINT `Users_fk0` FOREIGN KEY (`employee_ID`) REFERENCES `Employee`(`employee_ID`);

ALTER TABLE `Users` ADD CONSTRAINT `Users_fk1` FOREIGN KEY (`customer_ID`) REFERENCES `Customers`(`customer_ID`);

ALTER TABLE `Employee` ADD CONSTRAINT `Employee_fk0` FOREIGN KEY (`user_ID`) REFERENCES `Users`(`user_ID`);
