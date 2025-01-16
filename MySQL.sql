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
CREATE TABLE VegFruit(ItemCode INT(3) PRIMARY KEY, ItemName VARCHAR(20), Price_per_kg FLOAT , AisleNo INT(2), Image varchar(400));
INSERT INTO VegFruit VALUES(1, "Apple", 12.5, 1, 'https://www.farmersalmanac.com/wp-content/uploads/2020/11/Adocortland_apples-as225320764.jpeg');
INSERT INTO VegFruit VALUES(2, "Potato", 5, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRk0G9NbQgEKEbLYsoqItuzKoOdHRv41wYSXS_wjaWpTOeFlcsx1fv1udPnEPZFbDlNLWU&usqp=CAU');
INSERT INTO VegFruit VALUES(3, "Tomato", 6, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8Da6sduPCtZTFk0ZkO8LbL637SA0KKJSgNA&s');
INSERT INTO VegFruit VALUES(4, "Banana", 8.5, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLWh-E-5rCitwZiTaKzesMB6kupUh0TRu1FQ&s');
INSERT INTO VegFruit VALUES(5, "Onion", 5.5, 1, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.b04Q2GBN5Djx8vXf5XD17QHaHa%26pid%3DApi%26h%3D160&f=1&ipt=7ad33b256227785d2a296a54d3237daf126ed9706a9f8851adffa7251222d83d&ipo=images');
ALTER TABLE VegFruit ADD FOREIGN KEY(AisleNo) REFERENCES MasterTable(AisleNo);
-- Creation of Dairy, Poultry and Meat table
CREATE TABLE DPM(Itemcode INT(3) PRIMARY KEY, Itemname VARCHAR(20), Price_per_kg FLOAT, AisleNo INT(2), Image varchar(400));
INSERT INTO DPM VALUES(1, "Milk", 3, 2, 'https://duckduckgo.com/i/159c08ad6dc6d107.jpg');
INSERT INTO DPM VALUES(2, "Eggs", 9, 2, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.HSpU38tfSo0rDG92sN6BGQHaFB%26pid%3DApi&f=1&ipt=cec3c414dad9e20f91bdc25a3169ce3379c50fed2d71f3a4c4d2c241ec56aa6a&ipo=images');
INSERT INTO DPM VALUES(3, "Sardines", 20, 2, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.sticklebackfish.co.uk%2Fapp%2Fuploads%2F2020%2F11%2Fsardines-kg-2983-p.png&f=1&nofb=1&ipt=24b829aa36ec36f0f28140c2b2e54303ab725fc67b28463b99cadb47246869a9&ipo=images');
INSERT INTO DPM VALUES(4, "Chicken", 40, 2, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ffeelgoodfoodie.net%2Fwp-content%2Fuploads%2F2022%2F08%2FHow-to-Cut-a-Whole-Chicken-09.jpg&f=1&nofb=1&ipt=a06d207777a1cb00c52c4a3e429d145d8309c599f40f55f4ddd1bad2423c37f5&ipo=images');
INSERT INTO DPM VALUES(5, "Cheese", 50, 2, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.zGbDLikdVpjNzJCp_8M2ZwAAAA%26pid%3DApi&f=1&ipt=f841994ce73ba22477543634481af23089fa8ba0f85d6b7b9bafe8b8d8b5a0e6&ipo=images');
ALTER TABLE DPM ADD FOREIGN KEY(AisleNo) REFERENCES MasterTable(AisleNo);
-- Creation of Baked Goods and Snacks table
CREATE TABLE Bakery(Itemcode INT(3) PRIMARY KEY, Itemname VARCHAR(20), Price_per_kg FLOAT, AisleNo INT(2), Image varchar(400));
INSERT INTO Bakery VALUES(1, "Bread", 40, 3, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Flilluna.com%2Fwp-content%2Fuploads%2F2021%2F06%2Fwheat-bread-resize-10.jpg&f=1&nofb=1&ipt=fb0e6b90aeb27fda56ddcbe62e25f54a8d23b3d178eabcf46e11c6ae6891abe3&ipo=images');
INSERT INTO Bakery VALUES(2, "Potato Chips", 20, 3, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.cyGYjdXZsyQHt8j_ZrGzuwHaHa%26pid%3DApi&f=1&ipt=c06feba01d052f147b13f4423670635d818fd167984a2f2864aff1ebfe46c941&ipo=images');
INSERT INTO Bakery VALUES(3, "Cookies", 35, 3, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.OYkJoeAx4fjwKO8NtVRz5wHaHa%26pid%3DApi&f=1&ipt=f01d5ce3a3ac6d86d8278f0ef08051087e3b5c5b184c5c5aa3537e0eaaa843b1&ipo=images');
INSERT INTO Bakery VALUES(4, "Peanut Candy", 20, 3, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.64qH1xf9isCqcuTdCULDOAHaLO%26pid%3DApi&f=1&ipt=c4a9965d9a11efe4d5a58fdf0078377c80190f38221cca190cdf039ee7644831&ipo=images');
INSERT INTO Bakery VALUES(5, "Assorted Sweets", 150, 3, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.Q6t0kDpVc8cpDcabrYZQQwHaHM%26pid%3DApi&f=1&ipt=88607bd19fcb38840b28e83500e2e006105dda1412514f734b9aef0d760f27eb&ipo=images');
ALTER TABLE Bakery ADD FOREIGN KEY(AisleNo) REFERENCES MasterTable(AisleNo);
-- Creation of Stationery table
CREATE TABLE Stationery(Itemcode INT(3) PRIMARY KEY, Itemname VARCHAR(20), Price_per_kg FLOAT, AisleNo INT(2), Image varchar(400));
INSERT INTO Stationery VALUES(1, "Pen", 5, 4, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.rdGM6nwGMuId8yJWABv8gAHaGe%26pid%3DApi&f=1&ipt=5ec6f411820511ac8dddccff592daaa26564d3e0ec0b2afc7bb94918d8341fb7&ipo=images');
INSERT INTO Stationery VALUES(2, "Pencil", 2, 4, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.DxkF9kZq5-5h3C_NAGgLegHaE8%26pid%3DApi&f=1&ipt=9b7494d12ef9b12902c02abbf34e154e3f41e516e2942b32c96068dc5f1463e8&ipo=images');
INSERT INTO Stationery VALUES(3, "Eraser", 2, 4, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.LvfkgrLYASEaYJ3mPAPUSwAAAA%26pid%3DApi&f=1&ipt=4482168f7f0fdd56c3bfdeac08a639d962b9903ff7baf56631495515ca0aaad8&ipo=images');
INSERT INTO Stationery VALUES(4, "Sharpener", 3, 4, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.WvHyutIVHEg_uw7bYojDDwHaE8%26pid%3DApi&f=1&ipt=6421083532e7578fa911ef85bee55d966b484b2ac4ff80b396934e9fa67bedd9&ipo=images');
INSERT INTO Stationery VALUES(5, "Ruler", 8, 4, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcontent.etilize.com%2F2000%2F1011915350.jpg&f=1&nofb=1&ipt=fcb2e150c2bae9c32c856a043e6f496f4716d42e8b5f27e6ad33e792a7d1656c&ipo=images');
ALTER TABLE Stationery ADD FOREIGN KEY(AisleNo) REFERENCES MasterTable(AisleNo);
-- Creation of Self Care table
CREATE TABLE SelfCare(Itemcode INT(3) PRIMARY KEY, Itemname VARCHAR(20), Price_per_kg FLOAT, AisleNo INT(2), Image varchar(400));
INSERT INTO SelfCare VALUES(1, "Soap", 10, 5, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.gEwxHsRRyOFgbadmrVQxBwHaFj%26pid%3DApi&f=1&ipt=3c16682192bedc52740389a4698a94a0f831ef97d0ea370f61281e004810902a&ipo=images');
INSERT INTO SelfCare VALUES(2, "Shampoo", 50, 5, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.x_iry1GCGjKBSAhxiRPePwHaHa%26pid%3DApi&f=1&ipt=478b8d0c7d30dc40e697b3a3ab987ae1e641623779c39e330d92a8d92b1c3162&ipo=images');
INSERT INTO SelfCare VALUES(3, "Shaving Cream", 30, 5, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.h6Pk3kwY2RYLpZl2uZzlEwHaHa%26pid%3DApi&f=1&ipt=9611bd616cc07683dc7ff011c7145bef4edc777e9bdc6e2d9aa8f435f934e491&ipo=images');
INSERT INTO SelfCare VALUES(4, "Facewash", 20, 5, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.u9Y_ZcromPB18KU1kJMoQwHaJ4%26pid%3DApi&f=1&ipt=e315093d3bbc66bf4f4f2caf1dea8875bb37d0a7da4dbfd76f6bccfa9d3e55c0&ipo=images');
INSERT INTO SelfCare VALUES(5, "Deodorant", 180, 5, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.ybuFbFwJq0QrVrvxi3LoZwHaHa%26pid%3DApi&f=1&ipt=797377123a058e47ceaaf82e987498dceaaf5a505b8590da96e53192c4c6454d&ipo=images');
ALTER TABLE SelfCare ADD FOREIGN KEY(AisleNo) REFERENCES MasterTable(AisleNo);

CREATE TABLE PendingOrders(UserID int PRIMARY KEY, BillNo int);
