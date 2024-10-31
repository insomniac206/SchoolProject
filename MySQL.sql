-- create database GreenBasket_Eshop;
-- use GreenBasket_Eshop;
-- Creation of MasterTable
CREATE TABLE MasterTable(AisleNo INT(2) PRIMARY KEY, AisleName VARCHAR(100));
INSERT INTO MasterTable VALUES(1, "Vegetables and Fruits");
INSERT INTO MasterTable VALUES(2, "Dairy, Poultry and Meat");
INSERT INTO MasterTable VALUES(3, "Baked Goods and Snacks");
INSERT INTO MasterTable VALUES(4, "Stationery");
INSERT INTO MasterTable VALUES(5, "Self Care");
-- Creation of table of items
CREATE TABLE VegFruit(ItemCode INT(3) PRIMARY KEY, ItemName VARCHAR(20), Price_per_kg FLOAT , AisleNo INT(2));
INSERT INTO VegFruit VALUES(1, "Apple", 12.5, 1);
INSERT INTO VegFruit VALUES(2, "Potato", 5, 1);
INSERT INTO VegFruit VALUES(3, "Tomato", 6, 1);
INSERT INTO VegFruit VALUES(4, "Banana", 8.5, 1);
INSERT INTO VegFruit VALUES(5, "Onion", 5.5, 1);
ALTER TABLE VegFruit ADD FOREIGN KEY(AisleNo) REFERENCES MasterTable(AisleNo);
-- Creation of Dairy, Poultry and Meat table
CREATE TABLE DPM(Itemcode INT(3) PRIMARY KEY, Itemname VARCHAR(20), Price_per_kg FLOAT, AisleNo INT(2));
INSERT INTO DPM VALUES(1, "Milk", 3, 2);
INSERT INTO DPM VALUES(2, "Eggs", 9, 2);
INSERT INTO DPM VALUES(3, "Sardines", 20, 2);
INSERT INTO DPM VALUES(4, "Chicken", 40, 2);
INSERT INTO DPM VALUES(5, "Cheese", 50, 2);
ALTER TABLE DPM ADD FOREIGN KEY(AisleNo) REFERENCES MasterTable(AisleNo);
-- Creation of Baked Goods and Snacks table
CREATE TABLE Bakery(Itemcode INT(3) PRIMARY KEY, Itemname VARCHAR(20), Price_per_kg FLOAT, AisleNo INT(2));
INSERT INTO Bakery VALUES(1, "Bread", 40, 3);
INSERT INTO Bakery VALUES(2, "Potato Chips", 20, 3);
INSERT INTO Bakery VALUES(3, "Cookies", 35, 3);
INSERT INTO Bakery VALUES(4, "Peanut Candy", 20, 3);
INSERT INTO Bakery VALUES(5, "Assorted Sweets", 150, 3);
ALTER TABLE Bakery ADD FOREIGN KEY(AisleNo) REFERENCES MasterTable(AisleNo);
-- Creation of Stationery table
CREATE TABLE Stationery(Itemcode INT(3) PRIMARY KEY, Itemname VARCHAR(20), Price_per_kg FLOAT, AisleNo INT(2));
INSERT INTO Stationery VALUES(1, "Pen", 5, 4);
INSERT INTO Stationery VALUES(2, "Pencil", 2, 4);
INSERT INTO Stationery VALUES(3, "Eraser", 2, 4);
INSERT INTO Stationery VALUES(4, "Sharpener", 3, 4);
INSERT INTO Stationery VALUES(5, "Ruler", 8, 4);
ALTER TABLE Stationery ADD FOREIGN KEY(AisleNo) REFERENCES MasterTable(AisleNo);
-- Creation of Self Care table
CREATE TABLE SelfCare(Itemcode INT(3) PRIMARY KEY, Itemname VARCHAR(20), Price_per_kg FLOAT, AisleNo INT(2));
INSERT INTO SelfCare VALUES(1, "Soap", 10, 5);
INSERT INTO SelfCare VALUES(2, "Shampoo", 50, 5);
INSERT INTO SelfCare VALUES(3, "Shaving Cream", 30, 5);
INSERT INTO SelfCare VALUES(4, "Facewash", 20, 5);
INSERT INTO SelfCare VALUES(5, "Deodorant", 180, 5);
ALTER TABLE SelfCare ADD FOREIGN KEY(AisleNo) REFERENCES MasterTable(AisleNo);
