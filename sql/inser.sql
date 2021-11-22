--auction_house: Comment: list of all auction houses in system --https://www.invaluable.com/

INSERT INTO auction_house VALUES 
(1,6500,'admin1','YWRtaW4=','CHRISTIE''S'),
(2,7500,'admin2','YWRtaW4y','Sotheby''s'),
(3,9500,'admin3','YWRtaW4z','Bellevue Auction Services'),
(4,16500,'admin4','YWRtaW40','Cairo Auction House'),
(5,63500,'admin5','YWRtaW41','Davis Corners Auction Service'),
(6,654500,'admin6','YWRtaW42','Est Art Space'),
(7,6123500,'admin7','YWRtaW43','Estate Collection LLC'),
(8,63976500,'admin8','YWRtaW44','Fox Auctions'),
(9,6764500,'admin9','YWRtaW45','Gianguan Auctions'),
(10,237400,'admin10','YWRtaW4xMA==','H Evans & Sons'),
(11,7634528,'admin11','YWRtaW4xMQ==','Integrity Auction');
 
 --auction_house_transaction: COMMENT: all the trnsaction done by the auction house
 
 INSERT INTO auction_house_transaction VALUES 
 (10001,2,'USAePay','2021-10-11 18:13:06','1','USD',1),
 (10002,3,'USAePay','2021-10-01 18:13:29','1','USD',2),
 (10003,4,'SecureNet','2021-08-31 18:18:11','1','USD',3),
 (10004,5,'USAePay','2021-07-31 18:18:11','1','USD',4),
 (10005,5,'SecureNet','2021-05-31 18:18:11','1','USD',5),
 (10006,2,'USAePay','2021-05-01 18:18:11','1','USD',1),
 (10007,3,'SecureNet','2021-07-01 18:18:11','1','USD',2),
 (10008,4,'USAePay','2021-09-17 18:18:11','1','USD',3),
 (10009,5,'SecureNet','2021-09-30 18:18:11','1','USD',4),
 (10010,5,'USAePay','2021-09-23 18:18:11','1','USD',5),
 (10011,2,'SecureNet','2021-08-22 18:18:11','1','USD',1),
 (10012,3,'USAePay','2021-08-12 18:18:11','1','USD',2),
 (10013,4,'USAePay','2021-08-02 18:18:11','1','USD',3),
 (10014,5,'USAePay','2021-08-25 18:18:11','1','USD',4),
 (10015,5,'SecureNet','2021-08-14 18:18:11','1','USD',5),
 (10016,2,'SecureNet','2021-08-05 18:18:11','1','USD',1),
 (10017,3,'USAePay','2021-07-29 18:18:11','1','USD',2),
 (10018,4,'SecureNet','2021-09-20 18:18:11','1','USD',3),
 (10019,5,'USAePay','2021-07-21 18:18:11','1','USD',4),
 (10020,5,'SecureNet','2021-09-05 18:18:11','1','USD',5),
 (10021,2,'USAePay','2021-09-03 18:18:11','1','USD',1),
 (10022,3,'SecureNet','2021-07-25 18:18:11','1','USD',2),
 (10023,4,'USAePay','2021-09-08 18:18:11','1','USD',3),
 (10024,5,'SecureNet','2021-10-10 18:18:11','1','USD',4),
 (10025,5,'USAePay','2021-10-06 18:18:11','1','USD',5),
 (10026,2,'SecureNet','2021-09-05 18:18:12','1','USD',1),
 (10027,3,'USAePay','2021-08-23 18:18:12','1','USD',2),
 (10028,4,'SecureNet','2021-08-28 18:18:12','1','USD',3),
 (10029,5,'USAePay','2021-08-04 18:18:12','1','USD',4),
 (10030,5,'SecureNet','2021-07-24 18:18:12','1','USD',5);


--app_user : COMMENT: list of all users in system -- https://www.mockaroo.com/

insert into app_user (user_id, name, password, address, phone,balance) values (1, 'Corrianne Winchcomb', '12345678', '3451 Bluejay Avenue', '550-132-2175',500);
insert into app_user (user_id, name, password, address, phone,balance) values (2, 'Audy Klageman', '12345678', '2 Springs Terrace', '657-999-9069',500);
insert into app_user (user_id, name, password, address, phone,balance) values (3, 'Brendis Oglethorpe', '12345678', '09367 Garrison Trail', '376-212-5545',500);
insert into app_user (user_id, name, password, address, phone,balance) values (4, 'Edlin Baison', '12345678', '19 Waywood Plaza', '825-848-9560',500);
insert into app_user (user_id, name, password, address, phone,balance) values (5, 'Robbie Darko', '12345678', '02 Grasskamp Circle', '911-990-3825',500);
insert into app_user (user_id, name, password, address, phone,balance) values (6, 'Dahlia Ortas', '12345678', '89 Sage Drive', '574-166-3893',500);
insert into app_user (user_id, name, password, address, phone,balance) values (7, 'Roseline Mauro', '12345678', '22924 Arizona Way', '922-668-6200',500);
insert into app_user (user_id, name, password, address, phone,balance) values (8, 'Alleen Davydkov', '12345678', '5 Crowley Pass', '443-954-7883',500);
insert into app_user (user_id, name, password, address, phone,balance) values (9, 'Emylee Sleith', '12345678', '979 Novick Alley', '209-504-7538',500);
insert into app_user (user_id, name, password, address, phone,balance) values (10, 'Eugine Somerbell', '12345678', '699 Elmside Way', '728-539-3405',500);
insert into app_user (user_id, name, password, address, phone,balance) values (11, 'Illa Wysome', '12345678', '976 Cardinal Drive', '309-423-3569',500);
insert into app_user (user_id, name, password, address, phone,balance) values (12, 'Eunice Guihen', '12345678', '338 Heffernan Drive', '124-799-4507',500);
insert into app_user (user_id, name, password, address, phone,balance) values (13, 'Hendrika Sarjent', '12345678', '65 3rd Lane', '821-999-8931',500);
insert into app_user (user_id, name, password, address, phone,balance) values (14, 'Langston Carlile', '12345678', '7 Vernon Park', '898-768-1579',500);
insert into app_user (user_id, name, password, address, phone,balance) values (15, 'Michele Annott', '12345678', '4219 Scott Pass', '350-452-7862',500);
insert into app_user (user_id, name, password, address, phone,balance) values (16, 'Conn Brickett', '12345678', '4990 Maple Wood Alley', '755-110-7823',500);
insert into app_user (user_id, name, password, address, phone,balance) values (17, 'Bonnie Stallwood', '12345678', '92 Kedzie Junction', '642-237-7275',1923);
insert into app_user (user_id, name, password, address, phone,balance) values (18, 'Rurik Piner', '12345678', '1378 Lakewood Gardens Center', '176-930-4346',2139);
insert into app_user (user_id, name, password, address, phone,balance) values (19, 'Aube Dur', '12345678', '200 Sullivan Pass', '256-464-6118',3012);
insert into app_user (user_id, name, password, address, phone,balance) values (20, 'David Muffen', '12345678', '0008 Division Place', '663-978-9424',1023);
insert into app_user (user_id, name, password, address, phone,balance) values (21, 'Starla Scotland', '12345678', '1 Nancy Court', '259-917-6943',4021);
insert into app_user (user_id, name, password, address, phone,balance) values (22, 'Janina Sparkwill', '12345678', '8 Stoughton Court', '358-952-6936',2013);
insert into app_user (user_id, name, password, address, phone,balance) values (23, 'Petrina Maypes', '12345678', '94 7th Way', '953-479-7698',1283);
insert into app_user (user_id, name, password, address, phone,balance) values (24, 'Jaime Topping', '12345678', '1184 Kings Hill', '477-585-1218',2831);
insert into app_user (user_id, name, password, address, phone,balance) values (25, 'Dolly Perelli', '12345678', '5 Spenser Street', '385-539-5745',1293);
insert into app_user (user_id, name, password, address, phone,balance) values (26, 'Adamo Basindale', '12345678', '6 Darwin Road', '300-449-3075',3912);
insert into app_user (user_id, name, password, address, phone,balance) values (27, 'Glenda Kield', '12345678', '032 Sherman Hill', '346-675-7540',2391);
insert into app_user (user_id, name, password, address, phone,balance) values (28, 'Ruthann Marjoribanks', '12345678', '1 Randy Place', '724-702-7557',1293);
insert into app_user (user_id, name, password, address, phone,balance) values (29, 'Atlanta Linstead', '12345678', '26403 Amoth Road', '990-798-1521',3102);
insert into app_user (user_id, name, password, address, phone,balance) values (30, 'Doralia Krzysztofiak', '12345678', '19 Saint Paul Road', '511-524-7696',1293);
insert into app_user (user_id, name, password, address, phone,balance) values (31, 'Marti Roskilly', '12345678', '19 Sachs Pass', '225-817-0787',4129);
insert into app_user (user_id, name, password, address, phone,balance) values (32, 'Jedd Grenkov', '12345678', '5583 Gulseth Crossing', '610-483-1034',1924);
insert into app_user (user_id, name, password, address, phone,balance) values (33, 'Worthington Fazackerley', '12345678', '86 Springview Avenue', '847-204-7521',2931);
insert into app_user (user_id, name, password, address, phone,balance) values (34, 'Dalis Leyman', '12345678', '37 Sundown Alley', '599-453-7854',1592);
insert into app_user (user_id, name, password, address, phone,balance) values (35, 'Conni Bour', '12345678', '695 Fisk Junction', '202-368-5807',2391);
insert into app_user (user_id, name, password, address, phone,balance) values (36, 'Eleonore Serris', '12345678', '6 Arkansas Alley', '855-125-7287',3102);
insert into app_user (user_id, name, password, address, phone,balance) values (37, 'Guenevere Frankham', '12345678', '44 Chive Center', '986-138-4662',4120);
insert into app_user (user_id, name, password, address, phone,balance) values (38, 'Cleavland Blincko', '12345678', '6 Fordem Pass', '831-862-8826',1202);
insert into app_user (user_id, name, password, address, phone,balance) values (39, 'Waneta Voisey', '12345678', '5717 Lawn Street', '858-617-1737',4102);
insert into app_user (user_id, name, password, address, phone,balance) values (40, 'Christen Cornillot', '12345678', '6717 Commercial Hill', '310-369-3864',1294);
insert into app_user (user_id, name, password, address, phone,balance) values (41, 'Wendie Hatrey', '12345678', '5221 Ridgeway Parkway', '416-609-4651',2104);
insert into app_user (user_id, name, password, address, phone,balance) values (42, 'Ky Vaud', '12345678', '9 Dapin Junction', '347-307-6943',4012);
insert into app_user (user_id, name, password, address, phone,balance) values (43, 'Leelah Hillatt', '12345678', '22828 Melby Center', '833-801-7455',1204);
insert into app_user (user_id, name, password, address, phone,balance) values (44, 'Chryste Tanswell', '12345678', '89401 Lerdahl Circle', '259-684-0623',3102);
insert into app_user (user_id, name, password, address, phone,balance) values (45, 'Janeczka Kleinlerer', '12345678', '35 Waubesa Alley', '120-835-2739',1203);
insert into app_user (user_id, name, password, address, phone,balance) values (46, 'Penn Pullar', '12345678', '6793 Debs Alley', '397-585-9038',1239);
insert into app_user (user_id, name, password, address, phone,balance) values (47, 'Alessandro Arson', '12345678', '7 Aberg Court', '577-326-2805',1290);
insert into app_user (user_id, name, password, address, phone,balance) values (48, 'Pam Whittles', '12345678', '5 5th Road', '686-855-5913',4012);
insert into app_user (user_id, name, password, address, phone,balance) values (49, 'Gregoire Crookston', '12345678', '3098 Bayside Hill', '984-955-7641',3102);
insert into app_user (user_id, name, password, address, phone,balance) values (50, 'Wiley Keiley', '12345678', '4 Pennsylvania Place', '817-330-8345',1240);
insert into app_user (user_id, name, password, address, phone,balance) values (51, 'Ottilie O'' Faherty', '12345678', '49409 Rieder Parkway', '678-352-2122',3012);
insert into app_user (user_id, name, password, address, phone,balance) values (52, 'Brad Madgett', '12345678', '85963 Esker Drive', '646-643-5903',1045);
insert into app_user (user_id, name, password, address, phone,balance) values (53, 'Oriana Dany', '12345678', '7134 Kim Circle', '694-243-4527',3021);
insert into app_user (user_id, name, password, address, phone,balance) values (54, 'Hedvig Maker', '12345678', '6012 Duke Pass', '881-463-6098',2304);
insert into app_user (user_id, name, password, address, phone,balance) values (55, 'Clay Syvret', '12345678', '02857 Oak Valley Center', '564-562-9857',2310);
insert into app_user (user_id, name, password, address, phone,balance) values (56, 'Jule Celle', '12345678', '69 Fairfield Way', '305-804-9013',1035);
insert into app_user (user_id, name, password, address, phone,balance) values (57, 'Maxy Mauger', '12345678', '71 Hudson Circle', '804-486-0163',2305);
insert into app_user (user_id, name, password, address, phone,balance) values (58, 'Dorisa Whitrod', '12345678', '1687 1st Street', '557-490-1117',2014);
insert into app_user (user_id, name, password, address, phone,balance) values (59, 'Hermie Bessant', '12345678', '346 Gulseth Circle', '363-206-2782',3250);
insert into app_user (user_id, name, password, address, phone,balance) values (60, 'Dasya Janicijevic', '12345678', '28 Cody Court', '690-777-2217',2304);
insert into app_user (user_id, name, password, address, phone,balance) values (61, 'Gaultiero Dugget', '12345678', '62686 Mcguire Circle', '570-745-1948',1204);
insert into app_user (user_id, name, password, address, phone,balance) values (62, 'Jackqueline Falco', '12345678', '42269 Sloan Crossing', '877-382-3364',1234);
insert into app_user (user_id, name, password, address, phone,balance) values (63, 'Cooper Tollow', '12345678', '78 Green Ridge Center', '480-414-9147',2031);
insert into app_user (user_id, name, password, address, phone,balance) values (64, 'Miner Dunley', '12345678', '3923 Maywood Lane', '277-964-9612',5201);
insert into app_user (user_id, name, password, address, phone,balance) values (65, 'Kerrin Insko', '12345678', '0100 Autumn Leaf Center', '444-975-0745',1240);
insert into app_user (user_id, name, password, address, phone,balance) values (66, 'Haroun Lockery', '12345678', '3843 Florence Place', '386-179-9970',2934);
insert into app_user (user_id, name, password, address, phone,balance) values (67, 'Shea Filpo', '12345678', '14103 Kropf Point', '853-570-9436',2304);
insert into app_user (user_id, name, password, address, phone,balance) values (68, 'Tommi Berzen', '12345678', '4230 Dixon Plaza', '306-599-1522',1204);
insert into app_user (user_id, name, password, address, phone,balance) values (69, 'Rafael Yvens', '12345678', '295 Eggendart Road', '992-229-0909',2340);
insert into app_user (user_id, name, password, address, phone,balance) values (70, 'Donielle McReath', '12345678', '26 Jana Park', '568-440-4854',1204);
insert into app_user (user_id, name, password, address, phone,balance) values (71, 'Jillayne Jerram', '12345678', '43 Anzinger Park', '243-116-7422',2350);
insert into app_user (user_id, name, password, address, phone,balance) values (72, 'Hewet Haberfield', '12345678', '52337 Browning Plaza', '342-283-2710',1204);
insert into app_user (user_id, name, password, address, phone,balance) values (73, 'Kingsley Hizir', '12345678', '06 New Castle Avenue', '348-720-9076',2130);
insert into app_user (user_id, name, password, address, phone,balance) values (74, 'Phyllida Brodway', '12345678', '98596 Esch Road', '461-930-1794',2305);
insert into app_user (user_id, name, password, address, phone,balance) values (75, 'Kerrin O''Kielt', '12345678', '85 Hanover Pass', '505-518-0804',1234);
insert into app_user (user_id, name, password, address, phone,balance) values (76, 'Flor Espinola', '12345678', '456 Stephen Hill', '565-672-2194',2394);
insert into app_user (user_id, name, password, address, phone,balance) values (77, 'Lars Watling', '12345678', '4 Schmedeman Park', '669-571-6244',4051);
insert into app_user (user_id, name, password, address, phone,balance) values (78, 'Eldon Texton', '12345678', '6 Lunder Trail', '258-450-4301',2349);
insert into app_user (user_id, name, password, address, phone,balance) values (79, 'Hew Benoix', '12345678', '9 Talmadge Lane', '427-300-4979',2349);
insert into app_user (user_id, name, password, address, phone,balance) values (80, 'Kimmie Antonelli', '12345678', '0 Lukken Place', '249-833-2911',1202);
insert into app_user (user_id, name, password, address, phone,balance) values (81, 'Abran Calender', '12345678', '13 Dixon Hill', '883-719-5090',2012);
insert into app_user (user_id, name, password, address, phone,balance) values (82, 'Kendra Snoding', '12345678', '9 Stuart Crossing', '325-436-9198',3012);
insert into app_user (user_id, name, password, address, phone,balance) values (83, 'Ollie La Padula', '12345678', '1549 Oakridge Point', '722-208-9266',2031);
insert into app_user (user_id, name, password, address, phone,balance) values (84, 'Celesta Puddan', '12345678', '3 Mifflin Park', '211-409-5882',3012);
insert into app_user (user_id, name, password, address, phone,balance) values (85, 'Iseabal Jeyness', '12345678', '5842 Ridgeway Way', '884-828-4555',2949);
insert into app_user (user_id, name, password, address, phone,balance) values (86, 'Karalynn Kelf', '12345678', '238 Dixon Center', '341-406-5635',3012);
insert into app_user (user_id, name, password, address, phone,balance) values (87, 'Reba Schoffler', '12345678', '2 Bartillon Point', '134-772-3894',2301);
insert into app_user (user_id, name, password, address, phone,balance) values (88, 'Pren Sydney', '12345678', '47262 Little Fleur Road', '578-242-3825',2340);
insert into app_user (user_id, name, password, address, phone,balance) values (89, 'Allan Wescott', '12345678', '8253 Del Mar Point', '202-942-8876',4012);
insert into app_user (user_id, name, password, address, phone,balance) values (90, 'Guss Goady', '12345678', '02 Iowa Park', '892-837-6370',1924);
insert into app_user (user_id, name, password, address, phone,balance) values (91, 'Anastasie Reicherz', '12345678', '73682 Morrow Alley', '315-838-9603',1240);
insert into app_user (user_id, name, password, address, phone,balance) values (92, 'Godfree Giovannetti', '12345678', '65 Glacier Hill Point', '166-927-3099',3842);
insert into app_user (user_id, name, password, address, phone,balance) values (93, 'Kearney Hakonsen', '12345678', '438 Arkansas Court', '154-532-6918',4192);
insert into app_user (user_id, name, password, address, phone,balance) values (94, 'Janela Nisuis', '12345678', '140 Mallory Street', '577-470-3855',3912);
insert into app_user (user_id, name, password, address, phone,balance) values (95, 'Gwenny Lorryman', '12345678', '6 Rusk Place', '367-532-3798',1023);
insert into app_user (user_id, name, password, address, phone,balance) values (96, 'Antonietta Boissier', '12345678', '21600 Superior Circle', '275-408-5176',2013);
insert into app_user (user_id, name, password, address, phone,balance) values (97, 'Bond Arington', '12345678', '11 Kropf Drive', '836-413-3787',1230);
insert into app_user (user_id, name, password, address, phone,balance) values (98, 'Bruno D''Onise', '12345678', '03468 Mcguire Park', '577-683-1604',3021);
insert into app_user (user_id, name, password, address, phone,balance) values (99, 'Rhetta Sherrott', '12345678', '00713 Manitowish Road', '694-333-1051',2340);
insert into app_user (user_id, name, password, address, phone,balance) values (100, 'Maury Scotland', '12345678', '7 Thompson Road', '577-740-8363',1203);


--Facilitates : COMMENT: list of all users that are linked to auction_house

INSERT INTO facilitates VALUES 
(2,71),(6,72),(5,73),(3,74),(7,75),(4,76),(8,77),(9,78),(10,79),(1,80),(11,81),(11,82),(1,83),(1,84),(10,85),(2,86),(9,87),
(3,88),(8,89),(2,90),(4,91),(7,92),(3,93),(6,94),(4,95),(5,96),(5,97),(1,98),(2,99);

--buyer : COMMENT: list of all users that are buyers in the system

insert into buyer values
(12,1,'0'),
(13,1,'1'),
(14,1,'0'),
(15,2,'1'),
(16,2,'0'),
(17,2,'1'),
(18,2,'0'),
(19,3,'1'),
(20,3,'0'),
(21,3,'1'),
(22,1,'0'),
(23,4,'1'),
(24,5,'0'),
(25,3,'1'),
(26,3,'0'),
(27,2,'1'),
(28,6,'0'),
(29,6,'1'),
(30,6,'0'),
(31,6,'1'),
(32,6,'0'),
(33,7,'1'),
(34,5,'0'),
(35,5,'1'),
(36,5,'0'),
(37,5,'1'),
(38,9,'0'),
(39,9,'1'),
(40,9,'0'),
(41,9,'1'),
(42,9,'0'),
(43,7,'1'),
(44,7,'0'),
(45,7,'1'),
(46,5,'0'),
(47,4,'1'),
(48,9,'0'),
(49,9,'1'),
(50,9,'0'),
(51,11,'1'),
(52,11,'0'),
(53,11,'1'),
(54,14,'0'),
(55,23,'1'),
(56,12,'0'),
(57,12,'1'),
(58,11,'0'),
(59,10,'1'),
(60,4,'0'),
(61,2,'1');


--seller : COMMENT: list of all users which are seller with active listing. total of active listing matched with product_listed_by_seller table

INSERT INTO seller VALUES
(62,1,3),
(63,1,6),
(64,2,5),
(65,2,8),
(66,3,5),
(67,3,4),
(68,3,5),
(69,2,3),
(70,1,1); 

--Product_listed_by_seller COMMENT: list of all products linked to sellers --https://www.invaluable.com/

INSERT INTO product_listed_by_seller VALUES 
(1,66,'FINELY CARVED JADEITE & ROSEWOOD TABLE SCREEN',1200,NULL,1100,'1',1500,'2021-10-04 18:13:06','2021-10-07 18:13:06','2021-10-10 18:13:06'),
(2,63,'FINE WHITE JADE EIGHT IMMORTALS PLAQUE ON STAND',1000,NULL,900,'1',1300,'2021-09-24 18:13:29','2021-09-27 18:13:29','2021-09-30 18:13:29'),
(3,67,'CARVED WHITE JADE LINGZHI FORM BRUSH WASHER ON STAND',1000,NULL,900,'1',1300,'2021-08-24 18:18:11','2021-08-27 18:18:11','2021-08-30 18:18:11'),
(4,67,'POEM-INSCRIBED HETIAN JADE SNUFF BOTTLE',250,NULL,150,'1',550,'2021-07-24 18:18:11','2021-07-27 18:18:11','2021-07-30 18:18:11'),
(5,68,'ORANGE-GROUND EMBROIDERED CRANE SILK PANEL',400,NULL,300,'1',700,'2021-05-24 18:18:11','2021-05-27 18:18:11','2021-05-30 18:18:11'),
(6,65,'YELLOW-GROUND SILK EMBROIDERED DRAGON ROBE',1500,NULL,1400,'1',1800,'2021-04-24 18:18:11','2021-04-27 18:18:11','2021-04-30 18:18:11'),
(7,64,'CARVED CORAL FIGURE OF A MAIDEN',250,NULL,150,'1',550,'2021-06-24 18:18:11','2021-06-27 18:18:11','2021-06-30 18:18:11'),
(8,69,'CHINESE LINGBI SCHOLARS ROCK',250,NULL,150,'1',550,'2021-09-10 18:18:11','2021-09-13 18:18:11','2021-09-16 18:18:11'),
(9,63,'TURQUOISE-GROUND FAMILLEROSE PORCELAIN VASE WITH MARK',300,NULL,200,'1',600,'2021-09-23 18:18:11','2021-09-26 18:18:11','2021-09-29 18:18:11'),
(10,66,'A HUANGHUALI CABINET',500,NULL,400,'1',800,'2021-09-16 18:18:11','2021-09-19 18:18:11','2021-09-22 18:18:11'),
(11,65,'TIANHUANG SOAPSTONE SEAL',800,NULL,700,'1',1100,'2021-08-15 18:18:11','2021-08-18 18:18:11','2021-08-21 18:18:11'),
(12,63,'PURPLE GOLD GLAZED PORCELAIN TRIPOD INCENSE BURNER',200,NULL,100,'1',500,'2021-08-05 18:18:11','2021-08-08 18:18:11','2021-08-11 18:18:11'),
(13,63,'FAMILLE ROSE DRAGON & PHEONIX PORCELAIN PLATE',250,NULL,150,'1',550,'2021-07-26 18:18:11','2021-07-29 18:18:11','2021-08-01 18:18:11'),
(14,64,'ENAMELED PORCELAIN FLOWER TWIN VASE WITH MARK',200,NULL,100,'1',500,'2021-08-18 18:18:11','2021-08-21 18:18:11','2021-08-24 18:18:11'),
(15,65,'BLUE AND WHITE PORCELAIN WATER VESSEL',200,NULL,100,'1',500,'2021-08-07 18:18:11','2021-08-10 18:18:11','2021-08-13 18:18:11'),
(16,70,'IRON-RED DECORATED POCELAIN VASE WITH MARK',200,NULL,100,'1',500,'2021-07-29 18:18:11','2021-08-01 18:18:11','2021-08-04 18:18:11'),
(17,68,'PAIR OF GILT BRONZE GUARDS WITH XUANDE MARK',15000,NULL,14900,'1',15300,'2021-07-22 18:18:11','2021-07-25 18:18:11','2021-07-28 18:18:11'),
(18,64,'GEMSTONE-INLAID GILT BRONZE FIGURE OF AMITAYUS ON STAND',8500,NULL,8400,'1',8800,'2021-09-13 18:18:11','2021-09-16 18:18:11','2021-09-19 18:18:11'),
(19,69,'CARVED & PIERCED HUANGHUALI HANDLE BOX',800,NULL,700,'1',1100,'2021-07-14 18:18:11','2021-07-17 18:18:11','2021-07-20 18:18:11'),
(20,65,'HUANGHUALI RATTAN-INSET LIDDED BOX',800,NULL,700,'1',1100,'2021-08-29 18:18:11','2021-09-01 18:18:11','2021-09-04 18:18:11'),
(21,64,'CARVED TRIDACNIDAE CLAM RUYI SCEPTER',300,NULL,200,'1',600,'2021-08-27 18:18:11','2021-08-30 18:18:11','2021-09-02 18:18:11'),
(22,68,'CARVED BOXWOOD FIGURAL BRUSH POT',200,NULL,100,'1',500,'2021-07-18 18:18:11','2021-07-21 18:18:11','2021-07-24 18:18:11'),
(23,68,'INTRICATELY CARVED JADE & ROSEWOOD TABLE SCREEN',3000,NULL,2900,'1',3300,'2021-09-01 18:18:11','2021-09-04 18:18:11','2021-09-07 18:18:11'),
(24,67,'SET OF THREE CARVED JADE DRAGON SEALS WITH BOX',1500,NULL,1400,'1',1800,'2021-10-03 18:18:11','2021-10-06 18:18:11','2021-10-09 18:18:11'),
(25,62,'ENAMELED PORCELAIN FLOWER VASE WITH MARK',800,NULL,700,'1',1100,'2021-09-29 18:18:11','2021-10-02 18:18:11','2021-10-05 18:18:11'),
(26,65,'BLUE AND WHITE PORCELAIN VASE WITH MARK',600,NULL,500,'1',900,'2021-08-29 18:18:12','2021-09-01 18:18:12','2021-09-04 18:18:12'),
(27,65,'ENAMEL PAINTED BRONZE WESTERN CHARACTER WINEPOT, MARKED',1200,NULL,1100,'1',1500,'2021-08-16 18:18:12','2021-08-19 18:18:12','2021-08-22 18:18:12'),
(28,68,'BOXWOOD INLAID AGARWOOD SWORD',400,NULL,300,'1',700,'2021-08-21 18:18:12','2021-08-24 18:18:12','2021-08-27 18:18:12'),
(29,66,'CARVED & INSCRIBED SPINACH JADE MYTHICAL BEAST SEAL',1500,NULL,1400,'1',1800,'2021-07-28 18:18:12','2021-07-31 18:18:12','2021-08-03 18:18:12'),
(30,66,'CARVED HETIAN JADE BEAST ORNAMENT',300,NULL,200,'1',600,'2021-07-17 18:18:12','2021-07-20 18:18:12','2021-07-23 18:18:12'),
(31,65,'Natural Tanzanite And Diamond Necklace In 14K White Gold',200,'',100,'1',500,'2021-06-07 02:12:43','2021-06-17 02:12:43','2021-06-20 02:12:43'),
(32,66,'Tanzanite 14K Yellow Gold Ring',250,'',150,'1',550,'2021-05-28 02:12:43','2021-06-07 02:12:43','2021-06-10 02:12:43'),
(33,62,'Natural Blue Tanzanite And Diamond Ring 18K Solid Yellow Gold',300,'',200,'1',600,'2021-05-08 02:12:43','2021-05-18 02:12:43','2021-05-21 02:12:43'),
(34,65,'Natural Sapphire 14K Solid White Gold Diamond Ring',700,'',600,'1',1000,'2021-06-27 02:12:43','2021-07-07 02:12:43','2021-07-10 02:12:43'),
(35,63,'Natural London Blue Topaz And Diamond Ring In14k Solid White Gold',450,'',350,'1',750,'2021-08-06 02:12:43','2021-08-16 02:12:43','2021-08-19 02:12:43'),
(36,67,'Natural Blue Tanzanite And Diamond Ring In 18K Yellow Gold',860,'',760,'1',1160,'2021-07-27 02:12:43','2021-08-06 02:12:43','2021-08-09 02:12:43'),
(37,69,'Natural Citrine And Diamond Ring 18K Solid Yellow Gold',700,'',600,'1',1000,'2021-08-26 02:12:43','2021-09-05 02:12:43','2021-09-08 02:12:43'),
(38,63,'Rubelite 18K White Gold Diamond Ring',340,'',240,'1',640,'2021-09-05 02:12:43','2021-09-15 02:12:43','2021-09-18 02:12:43'),
(39,62,'Pre-owned Rolex Datejust 36mm Jubilee',180,'',80,'1',480,'2021-09-25 02:12:43','2021-10-05 02:12:43','2021-10-08 02:12:43'),
(40,64,'Natural Tanzanite 14K Solid White Gold Diamond Necklace',290,'',190,'1',590,'2021-08-29 02:12:43','2021-09-08 02:12:43','2021-09-11 02:12:43');

--bid_regarding_product COMMENT: all the bids for products with final and previous bids

INSERT INTO bid_regarding_product VALUES
 (1,1300,1),(2,1100,2),(3,1100,3),
 (4,350,4),(5,500,5),(6,1600,6),(7,350,7),
 (8,350,8),(9,400,9),(10,600,10),(11,900,11),
 (12,300,12),(13,350,13),(14,300,14),(15,300,15),
 (16,300,16),(17,15100,17),(18,8600,18),(19,900,19),
 (20,900,20),(21,400,21),(22,300,22),(23,3100,23),(24,1600,24),
 (25,900,25),(26,700,26),(27,1300,27),(28,500,28),(29,1600,29),(30,400,30),
 (31,1400,1),(32,1200,2),(33,1200,3),(34,450,4),(35,600,5),(36,1700,6),(37,450,7),
 (38,450,8),(39,500,9),(40,700,10),(41,1000,11),(42,400,12),(43,450,13),(44,400,14),
 (45,400,15),(46,400,16),(47,15200,17),(48,8700,18),(49,1000,19),(50,1000,20),(51,500,21),
 (52,400,22),(53,3200,23),(54,1700,24),(55,1000,25),(56,800,26),(57,1400,27),(58,600,28),(59,1700,29),
 (60,500,30),(61,1500,1),(62,1300,2),(63,1300,3),(64,550,4),(65,700,5),(66,1800,6),(67,550,7),(68,550,8),
 (69,600,9),(70,800,10),(71,1100,11),(72,500,12),(73,550,13),(74,500,14),(75,500,15),(76,500,16),(77,15300,17),
 (78,8800,18),(79,1100,19),(80,1100,20),(81,600,21),(82,500,22),(83,3300,23),(84,1800,24),(85,1100,25),(86,900,26),
 (87,1500,27),(88,700,28),(89,1800,29),(90,600,30),(91,1600,1),(92,1400,2),(93,1400,3),(94,650,4),(95,800,5),
 (96,1900,6),(97,650,7),(98,650,8),(99,700,9),(100,900,10),(101,1200,11),(102,600,12),(103,650,13),(104,600,14),
 (105,600,15),(106,600,16),(107,15400,17),(108,8900,18),(109,1200,19),(110,1200,20),(111,700,21),(112,600,22),
 (113,3400,23),(114,1900,24),(115,1200,25),(116,1000,26),(117,1600,27),(118,800,28),(119,1900,29),(120,700,30),
 (121,1700,1),(122,1500,2),(123,1500,3),(124,750,4),(125,900,5),(126,2000,6),(127,750,7),(128,750,8),(129,800,9),
 (130,1000,10),(131,1300,11),(132,700,12),(133,750,13),(134,700,14),(135,700,15),(136,700,16),(137,15500,17),
 (138,9000,18),(139,1300,19),(140,1300,20),(141,800,21),(142,700,22),(143,3500,23),(144,2000,24),(145,1300,25),
 (146,1100,26),(147,1700,27),(148,900,28),(149,2000,29),(150,800,30),(151,1800,1),(152,1600,2),(153,1600,3),
 (154,850,4),(155,1000,5),(156,2100,6),(157,850,7),(158,850,8),(159,900,9),(160,1100,10),(161,1400,11),(162,800,12),
 (163,850,13),(164,800,14),(165,800,15),(166,800,16),(167,15600,17),(168,9100,18),(169,1400,19),(170,1400,20),
 (171,900,21),(172,800,22),(173,3600,23),(174,2100,24),(175,1400,25),(176,1200,26),(177,1800,27),(178,1000,28),
 (179,2100,29),(180,900,30),(181,1900,1),(182,1700,2),(183,1700,3),(184,950,4),(185,1100,5),(186,2200,6),(187,950,7),
 (188,950,8),(189,1000,9),(190,1200,10),(191,1500,11),(192,900,12),(193,950,13),(194,900,14),(195,900,15),(196,900,16),
 (197,15700,17),(198,9200,18),(199,1500,19),(200,1500,20),(201,1000,21),(202,900,22),(203,3700,23),(204,2200,24),
 (205,1500,25),(206,1300,26),(207,1900,27),(208,1100,28),(209,2200,29),(210,1000,30),(211,2000,1),(212,1800,2),(213,1800,3),
 (214,1050,4),(215,1200,5),(216,2300,6),(217,1050,7),(218,1050,8),(219,1100,9),(220,1300,10),(221,1600,11),
 (222,1000,12),(223,1050,13),(224,1000,14),(225,1000,15),(226,1000,16),(227,15800,17),(228,9300,18),(229,1600,19),
 (230,1600,20),(231,1100,21),(232,1000,22),(233,3800,23),(234,2300,24),(235,1600,25),(236,1400,26),(237,2000,27),
 (238,1200,28),(239,2300,29),(240,1100,30),(241,2100,1),(242,1900,2),(243,1900,3),(244,1150,4),(245,1300,5),
 (246,2400,6),(247,1150,7),(248,1150,8),(249,1200,9),(250,1400,10),(251,1700,11),(252,1100,12),(253,1150,13),
 (254,1100,14),(255,1100,15),(256,1100,16),(257,15900,17),(258,9400,18),(259,1700,19),(260,1700,20),(261,1200,21),
 (262,1100,22),(263,3900,23),(264,2400,24),(265,1700,25),(266,1500,26),(267,2100,27),(268,1300,28),(269,2400,29),
 (270,1200,30),(271,2200,1),(272,2000,2),(273,2000,3),(274,1250,4),(275,1400,5),(276,2500,6),(277,1250,7),
 (278,1250,8),(279,1300,9),(280,1500,10),(281,1800,11),(282,1200,12),(283,1250,13),(284,1200,14),(285,1200,15),
 (286,1200,16),(287,16000,17),(288,9500,18),(289,1800,19),(290,1800,20),(291,1300,21),(292,1200,22),(293,4000,23),
 (294,2500,24),(295,1800,25),(296,1600,26),(297,2200,27),(298,1400,28),(299,2500,29),(300,1300,30);
 
 --offers :COMMENT: table stores link between bids and buyers
 
 INSERT INTO offers VALUES 
(12,1),(12,2),(12,3),(12,4),(12,5),(12,6),(12,7),(12,8),(12,9),(12,10),(12,11),(12,12),(12,13),(12,14),(12,15),(12,16),(12,17),(12,18),(12,19),
(12,20),(12,21),(12,22),(12,23),(12,24),(12,25),(12,26),(12,27),(12,28),(12,29),(12,30),(13,31),(13,32),(13,33),(13,34),(13,35),(13,36),(13,37),
(13,38),(13,39),(13,40),(13,41),(13,42),(13,43),(13,44),(13,45),(13,46),(13,47),(13,48),(13,49),(13,50),(13,51),(13,52),(13,53),(13,54),(13,55),
(13,56),(13,57),(13,58),(13,59),(13,60),(14,61),(14,62),(14,63),(14,64),(14,65),(14,66),(14,67),(14,68),(14,69),(14,70),(14,71),(14,72),(14,73),
(14,74),(14,75),(14,76),(14,77),(14,78),(14,79),(14,80),(14,81),(14,82),(14,83),(14,84),(14,85),(14,86),(14,87),(14,88),(14,89),(14,90),(15,91),
(15,92),(15,93),(15,94),(15,95),(15,96),(15,97),(15,98),(15,99),(15,100),(15,101),(15,102),(15,103),(15,104),(15,105),(15,106),(15,107),(15,108),
(15,109),(15,110),(15,111),(15,112),(15,113),(15,114),(15,115),(15,116),(15,117),(15,118),(15,119),(15,120),(16,121),(16,122),(16,123),(16,124),
(16,125),(16,126),(16,127),(16,128),(16,129),(16,130),(16,131),(16,132),(16,133),(16,134),(16,135),(16,136),(16,137),(16,138),(16,139),(16,140),
(16,141),(16,142),(16,143),(16,144),(16,145),(16,146),(16,147),(16,148),(16,149),(16,150),(17,151),(17,152),(17,153),(17,154),(17,155),(17,156),
(17,157),(17,158),(17,159),(17,160),(17,161),(17,162),(17,163),(17,164),(17,165),(17,166),(17,167),(17,168),(17,169),(17,170),(17,171),(17,172),
(17,173),(17,174),(17,175),(17,176),(17,177),(17,178),(17,179),(17,180),(18,181),(18,182),(18,183),(18,184),(18,185),(18,186),(18,187),(18,188),
(18,189),(18,190),(18,191),(18,192),(18,193),(18,194),(18,195),(18,196),(18,197),(18,198),(18,199),(18,200),(18,201),(18,202),(18,203),(18,204),
(18,205),(18,206),(18,207),(18,208),(18,209),(18,210),(19,211),(19,212),(19,213),(19,214),(19,215),(19,216),(19,217),(19,218),(19,219),(19,220),
(19,221),(19,222),(19,223),(19,224),(19,225),(19,226),(19,227),(19,228),(19,229),(19,230),(19,231),(19,232),(19,233),(19,234),(19,235),(19,236),
(19,237),(19,238),(19,239),(19,240),(20,241),(20,242),(20,243),(20,244),(20,245),(20,246),(20,247),(20,248),(20,249),(20,250),(20,251),(20,252),
(20,253),(20,254),(20,255),(20,256),(20,257),(20,258),(20,259),(20,260),(20,261),(20,262),(20,263),(20,264),(20,265),(20,266),(20,267),(20,268),
(20,269),(20,270),(12,271),(12,272),(12,273),(12,274),(12,275),(13,276),(13,277),(13,278),(14,279),(14,280),(21,281),(21,282),(21,283),(21,284),
(21,285),(21,286),(21,287),(21,288),(21,289),(21,290),(21,291),(21,292),(21,293),(21,294),(21,295),(21,296),(21,297),(21,298),(21,299),(21,300);
 
 --Invokes_tx :COMMENT: table stores link between final bids and TRANSACTION id in auction_house_transaction table
 
 INSERT INTO invokes_tx VALUES 
 (10001,271),(10002,272),(10003,273),(10004,274),(10005,275),(10006,276),(10007,277),(10008,278),(10009,279),(10010,280),(10011,281),
 (10012,282),(10013,283),(10014,284),(10015,285),(10016,286),(10017,287),(10018,288),(10019,289),(10020,290),(10021,291),(10022,292),
 (10023,293),(10024,294),(10025,295),(10026,296),(10027,297),(10028,298),(10029,299),(10030,300);
 
 --manages_bid :COMMENT: table stores link between bids and the auction house.
 
 INSERT INTO manages_bid VALUES 
 (1,1),(12,1),(23,1),(31,1),(42,1),(53,1),(61,1),(72,1),(83,1),(91,1),(102,1),(113,1),(121,1),(132,1),(143,1),(151,1),(162,1),(173,1),
 (181,1),(192,1),(203,1),(211,1),(222,1),(233,1),(241,1),(252,1),(263,1),(271,1),(276,1),(281,1),(286,1),(291,1),(296,1),(2,2),(13,2),
 (24,2),(32,2),(43,2),(54,2),(62,2),(73,2),(84,2),(92,2),(103,2),(114,2),(122,2),(133,2),(144,2),(152,2),(163,2),(174,2),(182,2),(193,2),
 (204,2),(212,2),(223,2),(234,2),(242,2),(253,2),(264,2),(272,2),(277,2),(282,2),(287,2),(292,2),(297,2),(3,3),(14,3),(25,3),(33,3),(44,3),
 (55,3),(63,3),(74,3),(85,3),(93,3),(104,3),(115,3),(123,3),(134,3),(145,3),(153,3),(164,3),(175,3),(183,3),(194,3),(205,3),(213,3),(224,3),
 (235,3),(243,3),(254,3),(265,3),(273,3),(278,3),(283,3),(288,3),(293,3),(298,3),(4,4),(15,4),(26,4),(34,4),(45,4),(56,4),(64,4),(75,4),
 (86,4),(94,4),(105,4),(116,4),(124,4),(135,4),(146,4),(154,4),(165,4),(176,4),(184,4),(195,4),(206,4),(214,4),(225,4),(236,4),(244,4),
 (255,4),(266,4),(274,4),(279,4),(284,4),(289,4),(294,4),(299,4),(5,5),(16,5),(27,5),(35,5),(46,5),(57,5),(65,5),(76,5),(87,5),(95,5),(106,5),
 (117,5),(125,5),(136,5),(147,5),(155,5),(166,5),(177,5),(185,5),(196,5),(207,5),(215,5),(226,5),(237,5),(245,5),(256,5),(267,5),(275,5),
 (280,5),(285,5),(290,5),(295,5),(300,5),(6,6),(17,6),(28,6),(36,6),(47,6),(58,6),(66,6),(77,6),(88,6),(96,6),(107,6),(118,6),(126,6),
 (137,6),(148,6),(156,6),(167,6),(178,6),(186,6),(197,6),(208,6),(216,6),(227,6),(238,6),(246,6),(257,6),(268,6),(7,7),(18,7),(29,7),(37,7),
 (48,7),(59,7),(67,7),(78,7),(89,7),(97,7),(108,7),(119,7),(127,7),(138,7),(149,7),(157,7),(168,7),(179,7),(187,7),(198,7),(209,7),(217,7),
 (228,7),(239,7),(247,7),(258,7),(269,7),(8,8),(19,8),(30,8),(38,8),(49,8),(60,8),(68,8),(79,8),(90,8),(98,8),(109,8),(120,8),(128,8),(139,8),
 (150,8),(158,8),(169,8),(180,8),(188,8),(199,8),(210,8),(218,8),(229,8),(240,8),(248,8),(259,8),(270,8),(9,9),(20,9),(39,9),(50,9),(69,9),
 (80,9),(99,9),(110,9),(129,9),(140,9),(159,9),(170,9),(189,9),(200,9),(219,9),(230,9),(249,9),(260,9),(10,10),(21,10),(40,10),(51,10),
 (70,10),(81,10),(100,10),(111,10),(130,10),(141,10),(160,10),(171,10),(190,10),(201,10),(220,10),(231,10),(250,10),(261,10),(11,11),(22,11),
 (41,11),(52,11),(71,11),(82,11),(101,11),(112,11),(131,11),(142,11),(161,11),(172,11),(191,11),(202,11),(221,11),(232,11),(251,11),(262,11);
 
 
