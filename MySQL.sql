create database GreenBasket_Eshop;
use GreenBasket_Eshop;
create table MasterTable(AisleNo int(2) primary key, AisleName varchar(20));
insert into MasterTable values(1, "Vegetables and Fruits");
insert into MasterTable values(2, "Dairy, Poultry and Meat");
insert into MasterTable values(3, "Baked Goods and Snacks");
insert into MasterTable values(4, "Stationery");
insert into MasterTable values(5, "Self Care");
create table VegFruit(ItemCode int(3) primary key, ItemName varchar(20), Price/kg float , AisleNo int(2));
insert into VegFruit values(1, Apple, 12.5, 1);
insert into VegFruit values(2, Potato, 5, 1);
insert into VegFruit values(3, Tomato, 6, 1);
insert into VegFruit values(4, Banana, 8.5, 1);
insert into VegFruit values(5, Onion, 5.5, 1);
alter table VegFruit add foreign key(AisleNo) references MasterTable(AisleNo);