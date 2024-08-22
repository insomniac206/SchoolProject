CREATE DATABASE IF NOT EXISTS GreenBasket_Eshop;
USE GreenBasket_Eshop;

CREATE TABLE IF NOT EXISTS MasterTable(AisleNo int(2) primary key, AisleName varchar(100));
CREATE TABLE IF NOT EXISTS VegFruit(ItemCode int(3) primary key, ItemName varchar(20), Price_per_kg float , AisleNo int(2));

ALTER TABLE VegFruit ADD FOREIGN KEY(AisleNo) REFERENCES MasterTable(AisleNo);

INSERT INTO MasterTable VALUES(1, "Vegetables and Fruits");
INSERT INTO MasterTable VALUES(2, "Dairy, Poultry and Meat");
INSERT INTO MasterTable VALUES(3, "Baked Goods and Snacks");
INSERT INTO MasterTable VALUES(4, "Stationery");
INSERT INTO MasterTable VALUES(5, "Self Care");

INSERT INTO VegFruit VALUES(1, "Apple", 12.5, 1);
INSERT INTO VegFruit VALUES(2, "Potato", 5, 1);
INSERT INTO VegFruit VALUES(3, "Tomato", 6, 1);
INSERT INTO VegFruit VALUES(4, "Banana", 8.5, 1);
INSERT INTO VegFruit VALUES(5, "Onion", 5.5, 1);
