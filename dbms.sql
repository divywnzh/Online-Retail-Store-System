CREATE SCHEMA IF NOT EXISTS `dbms`; 
use `dbms`;
# 
# TABLE STRUCTURE FOR: Admin 
# 
CREATE TABLE IF NOT EXISTS `Admin`(
`admin_id` int(9) unsigned NOT NULL AUTO_INCREMENT, 
`Name` varchar(100) NOT NULL, 
`Email` varchar(100) NOT NULL, 
`Password` varchar(100) NOT NULL, 
`PhoneNumber` int(13) NOT NULL, 
PRIMARY KEY (`admin_id`), 
UNIQUE KEY `Email` (`Email`), 
UNIQUE KEY `PhoneNumber` (`PhoneNumber`) 
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8; 

# 
# TABLE STRUCTURE FOR: Customer 
# 
CREATE TABLE IF NOT EXISTS `Customer`( 
`customer_id` varchar(28) NOT NULL, 
`Address` varchar(255) NOT NULL, 
`Name` varchar(100) NOT NULL, 
`Email` varchar(255) NOT NULL, 
`Password` varchar(255) NOT NULL, 
`PhoneNumber` int(13) NOT NULL, 
PRIMARY KEY (`customer_id`), 
UNIQUE KEY `Email` (`Email`), 
UNIQUE KEY `PhoneNumber` (`PhoneNumber`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

# 
# TABLE STRUCTURE FOR: Supplier 
# 
CREATE TABLE IF NOT EXISTS `Supplier`( 
`supplier_id` int(10) unsigned NOT NULL AUTO_INCREMENT, 
`Name` varchar(100) NOT NULL, 
`PhoneNumber` int(13) unsigned NOT NULL, 
`Email` varchar(255) NOT NULL, 
PRIMARY KEY (`supplier_id`), 
UNIQUE KEY `PhoneNumber` (`PhoneNumber`), 
UNIQUE KEY `Email` (`Email`) 
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8; 

# 
# TABLE STRUCTURE FOR: Product 
# 
CREATE TABLE IF NOT EXISTS `Product`( 
`product_id` int(9) unsigned NOT NULL AUTO_INCREMENT, 
`admin_id` int(9) unsigned , 
`supplier_id` int(9) unsigned, 
`ProductName` varchar(100) NOT NULL, 
`MRP` int(11) NOT NULL, 
`Quantity` int(11) NOT NULL, 
`ProductCategory` varchar(255) NOT NULL,
`ProductDescription` varchar(255) NOT NULL, 
FOREIGN KEY (admin_id) REFERENCES Admin(admin_id), 
FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id), 
PRIMARY KEY (`product_id`) 
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8; 

# 
# TABLE STRUCTURE FOR: Cart 
# 
CREATE TABLE IF NOT EXISTS `Cart`( 
`customer_id` varchar(28), 
`product_id` int(9) unsigned, 
`quantity` int(3) NOT NULL, 
FOREIGN KEY (customer_id) REFERENCES Customer(customer_id), FOREIGN KEY (product_id) REFERENCES Product(product_id), 
PRIMARY KEY (`customer_id`,`product_id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

# 
# TABLE STRUCTURE FOR: Delivery 
# 
CREATE TABLE IF NOT EXISTS `Delivery`( 
`delivery_id` int(9) unsigned NOT NULL AUTO_INCREMENT, 
`Name` varchar(100) NOT NULL, 
`PhoneNumber` int(13) unsigned NOT NULL, 
PRIMARY KEY (`delivery_id`), 
UNIQUE KEY `PhoneNumber` (`PhoneNumber`) 
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8; 

# 
# TABLE STRUCTURE FOR: Discount 
# 
CREATE TABLE IF NOT EXISTS `Discount`( 
`discount_id` char(20) NOT NULL, 
`percentageOff` int(3) unsigned NOT NULL check(`percentageOff`<100), 
`minPrice` int(3) unsigned NOT NULL default 200 , 
PRIMARY KEY (`discount_id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

# 
# TABLE STRUCTURE FOR: Orders 
# 
CREATE TABLE IF NOT EXISTS `Orders`( 
`orders_id` int(9) unsigned NOT NULL AUTO_INCREMENT, 
`customer_id` varchar(28), 
`timestamp` timestamp NOT NULL DEFAULT current_timestamp(), `status` enum('Delivered','NotDelivered','Returned') NOT NULL, 
`modeOfPayment` enum('CreditCard','DebitCard','Cash') NOT NULL, 
`discount_id` char(20), 
`delivery_id` int(9) unsigned, 
FOREIGN KEY (customer_id) REFERENCES Customer(customer_id), FOREIGN KEY (discount_id) REFERENCES Discount(discount_id), FOREIGN KEY (delivery_id) REFERENCES Delivery(delivery_id), PRIMARY KEY (`orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8; 

# 
# TABLE STRUCTURE FOR: OrdersContent 
# 
CREATE TABLE IF NOT EXISTS `OrdersContent`( 
`orders_id` int(9) unsigned, 
`product_id` int(9) unsigned, 
`quantity` int(11) NOT NULL, 
FOREIGN KEY (orders_id) REFERENCES Orders(orders_id), 
FOREIGN KEY (product_id) REFERENCES Product(product_id), 
PRIMARY KEY (`orders_id`,`product_id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

INSERT INTO `Admin` (`admin_id`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES (11, 'Adella Jacobson', 'xweissnat@example.org', 
'4b7fa5efc7796ba005db6e1d5e7ff158833b4021', 5); 
INSERT INTO `Admin` (`admin_id`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES (12, 'Prof. Karen Keebler', 'thea.kunze@example.net', 
'814cf929687f2f562b5613fd580eff0de5ae5479', 771991); 
INSERT INTO `Admin` (`admin_id`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES (13, 'Mr. Hazel Cummings', 'kub.barrett@example.com', 
'4d6db6c0f5ab36c520342b30d00e69ab3eb4f347', 0); 
INSERT INTO `Admin` (`admin_id`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES (14, 'Mr. Shaun Herman DDS', 'hoppe.lou@example.com', 
'9a3286221c3f7a6e8d37668ed957468503f5f272', 184849); 
INSERT INTO `Admin` (`admin_id`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES (15, 'Lea Purdy DDS', 'whickle@example.org', 
'02c1b6de3ddf4f486e1bb90b1096b5fea1bb8d87', 4); 
INSERT INTO `Admin` (`admin_id`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES (16, 'Floy Herzog', 'dejah.casper@example.net', 
'149874d573f81b64159b8ec2b92b709e6e1fecd3', 1);
INSERT INTO `Admin` (`admin_id`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES (17, 'Dr. Kasandra Yost III', 'pparker@example.org', 
'47264d7926fb5d8179c769ed221809b7c91bba1d', 74); 
INSERT INTO `Admin` (`admin_id`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES (18, 'Omari Gleichner III', 'jbosco@example.net', 
'eb5018037233d7809edb489fc872b9acc9e4483f', 154); 
INSERT INTO `Admin` (`admin_id`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES (19, 'Hildegard Hoeger', 'soberbrunner@example.com', 
'da9fcb16ad01b2905491e44cb5e7e8364d776fb8', 89627); 

INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('aletha87', '91492 Mya Mountains\nShaniamouth, VA 91552', 'Mr.
Khalcustomer_id Kertzmann', 'vquigley@example.net', 
'b792efc58181b343a50bd6c10b728e3caecde3bc', 1); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('alvera03', '452 Daisha Shore\nNorth Marie, NH 68824', 'Dr. Amy Hermiston', 'stroman.dulce@example.org', '71c22ebe081bbef0c28547a5ef725e69c058e632', 19); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('arowe', '58012 Macejkovic Village\nWest Jeanhaven, GA 07233', 'Angie Kerluke', 'schmitt.erwin@example.net', '35ba99835ef7db104fe8db57c08513f70dcd7ce1', 64); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('batz.saige', '338 Shawna Flat\nEast Marvin, MT 95937-7678', 'Darby Rempel III', 'qbruen@example.com', '71185165bfa0762b596d09601b48c8db187079a8', 80); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('berenice.upton', '1012 Imogene Park\nSouth Austen, IL 24979', 'Prof. Blair Goodwin DVM', 'vhalvorson@example.net', 
'f5b07e80333b575563ace5795dfe98a44fe60832', 260017); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('block.lenore', '2955 Halvorson Plaza Suite 561\nLemkeland, LA 46084-1877', 'Hal Lemke', 'evangeline28@example.org', 
'956e50ca993afc13c208d746f69981d15c27718d', 256474); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('botsford.nicklaus', '4540 Clementine Inlet\nMonserratehaven, HI 56118-0397', 'Destany Morar', 'keira.stanton@example.com', 
'a547780e0643ee36957410444b06e8ed3d3cde24', 16); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('brad74', '337 Hintz Glen Apt. 072\nAlessandraburgh, RI 92780-8687', 'Remington Bahringer', 'daniella69@example.com', 
'f54c891d6e9423ef53805f3b905129c182a0e90e', 959); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('christop.schaden', '01298 Rosalyn Pike Apt. 051\nYostton, OK 70876-3666', 'Ayla Hudson', 'abdul87@example.net', 
'ffe2219fad41b372c7ce08d747373673bfd7cb15', 155943); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('cremin.mikel', '89929 Leannon Cove Apt. 898\nErdmanbury, MN 98594', 'Miss Meghan Mueller', 'kaitlin80@example.com', 
'af9739a950fef58506d50164cfd54fa0172951a0', 155194); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('dameon27', '7870 Elisha Spring\nLake Terrance, NV 62525-0454', 'Dr. Selena West V', 'frieda.leannon@example.org', 
'e5757c861e19dd3ed541aa3463c3c0013df478e5', 507752); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('delphia.mertz', '444 Lindgren Mews Apt. 104\nWatersburgh, VA
98573-5116', 'Prof. Jackeline Boyle MD', 'qbayer@example.com', 
'09e7ddbc297abd274ffa8a5e9c6c8ce360a6960c', 329); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('demario.blanda', '322 Hahn Flat\nPort Ashleymouth, CO 58387', 'Prof. Ryley Frami', 'jazlyn89@example.com', '27c527106bfbbc85d56d61636aa224383f8c4b8e', 658); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('devyn02', '0896 Merlin Ports\nBoganville, WY 41545-1687', 'Leone Wiza', 'cecilia.prohaska@example.net', 'c6e5bb0418ba9d690a623480d661a31501f46360', 416643); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('dlowe', '13023 Lillie Wall\nBarrettborough, UT 99297-1284', 'Mr. Dean Jacobson', 'justine84@example.org', 'de46d10c445cfbf2b30139a0143f4b71677d788c', 543); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('emmett.mcdermott', '647 Hayden Lodge\nDareborough, DE 29495-4144', 'Jonathan Auer', 'eleanore.armstrong@example.net', 
'21a16bd3818db944143ca2671a15e2c5406d393a', 5837); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('ezequiel70', '586 Donavon Shoals\nLuettgenstad, NE 11058-7593', 'Dr. Albin Mayer PhD', 'clair.grant@example.org', 
'509597501f37700cbba98d5aeac563a1ad3b40ab', 583); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('ezra.goyette', '724 Johnson Locks\nBonnieberg, CT 52164-9111', 'Tremayne Leuschke', 'koelpin.carrie@example.org', 
'a9286b9c52f65669217ce9f83fa8ed7b52d8b4a3', 742562); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('fiona.berge', '65566 Schuster Plaza\nEast Wilma, MD 75820-2452', 'Dr. Cassandra Schmeler MD', 'scotty.gaylord@example.com', 
'b87a14ccfd0ac6f96b81cad030eaaeff939fba5e', 75); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('gaylord.francesca', '113 Raynor Keys\nPort Harrison, NH 88497-6142', 'Ms. Stella Walker', 'kasandra.tillman@example.net', 
'6dc0709622fb7921157c74433b11db145155c895', 11463); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('haylee.grimes', '9227 Domenick Stream\nCarolynebury, DC 44181', 'Dorris Conscustomer_idine V', 'hritchie@example.org', 
'2f5e105f29cee8ea174fdf1c7fa2d5e6368264ad', 169440); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('herminia.jacobson', '1418 Jacobson Mountains\nMorrisland, OR 99789-1077', 'Tremayne Schmeler', 'wkertzmann@example.net', 
'd965478c08d6e70010777f7a1abbd67b092a9352', 106588); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('hodkiewicz.corene', '90028 Darren Ramp\nDouglasbury, MN
88932', 'Prof. Joanny Beier', 'buck.legros@example.org', 
'b18320316bc26b3359e1cddaa2c315eed34a7390', 706); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('istracke', '9789 Era Plaza Apt. 814\nStokesport, DC 99393-8738', 'Delbert Windler', 'ashtyn32@example.net', '52e264f9df7433815f5ae84d81074fd62f7815ef', 408); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('javonte73', '999 Alize Rcustomer_idge\nSchnecustomer_idertown, WV 31152', 'Mrs. Chaya Anderson I', 'maximo.prosacco@example.net', 
'71e72dfaf8774a7736d989f2470adac4231a7bb3', 236); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('justina52', '1444 Jacquelyn Shores\nWest Granville, OR 00956', 'Deshawn Labadie', 'amara91@example.org', 'f40415c6d4abeda3154ecd751b5e8f2f1c85449c', 2147483647); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('kari40', '2350 Henriette Junction\nCatalinamouth, WY 64316-6516', 'Meagan Schowalter MD', 'rhauck@example.com', 
'35fd56f88a4207de4764c21a596c66a7ffa60b5a', 286); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('khomenick', '6304 Lilian Garden Apt. 145\nProsaccoborough, OR 42555', 'Hollis Volkman Sr.', 'annabelle06@example.com', 
'de4e6a8d3b55a48551d7e764c838b7ec7ffc824a', 551344); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('kiley54', '27176 Vickie Motorway\nWest Ricoborough, KS 47764', 'Rachelle Mante', 'jeffry.fay@example.net', '8aace396db636eabe2eb04979a90f0a3503ad850', 802077); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('lpagac', '9849 Wolf Alley\nWest Mariloumouth, MT 27058-5152', 'Franco Kunze Jr.', 'qjakubowski@example.net', 
'f294898f64fb410ab98d86e66685a01b20699a34', 907029); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('macie26', '838 Rowe Mission Apt. 242\nHaagburgh, WI 20485', 'Prof. Oscar Hegmann', 'cara32@example.org', 
'd9a03dc12765963b2507e68e8e702864371972dc', 404); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('maritza.walker', '6189 Connelly Loaf\nDeondreburgh, NC 02379', 'Orin Blanda', 'icie.schroeder@example.org', '8fa1607b7042807b46f2e06f390fab9b031625c6', 650310); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('maybell.mante', '16483 Kovacek Greens Suite 475\nWest Owen, WY 33897', 'Dr. Lucienne Moen PhD', 'adurgan@example.org', 
'07f288023edafe8fb7ec3d1a4a800cbe77dd9006', 659); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('modesto47', '917 Pagac Gateway\nNorth Marge, KS 32827-0163',
'Estell Effertz', 'theodora03@example.com', 'c1dd615e1879d28fe92935bc688aaae30d4ba681', 786014); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('montana54', '9840 Becker Plain Suite 289\nJoanniebury, NE 79201', 'Dr. Amara Labadie', 'camylle.stiedemann@example.net', 
'32d5fe4f618c24af80d2323af2d5fac9dd40b6cf', 0); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('morn', '071 Neal Groves\nAnniemouth, MD 12893', 'Toby Mraz I', 'eli83@example.net', '43f85ae6d0481dc0feceaf251d67ac7cbdcb581c', 840649); INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('myrl.sawayn', '0695 Hauck Wells\nAliachester, OK 74906-5650', 'Mrs. Jessika Erdman V', 'della.runte@example.net', 
'ecedc34174e6b7a4f19bd638466cda071339b00f', 278); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('pearl.von', '50949 Acustomer_iden Mills\nPort Stacyshire, DC 72147', 'Arnulfo Harris', 'dexter.blick@example.com', 
'41d844e4355a81f01a5c36e4a122cf9b33628a9c', 849); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('ptillman', '19862 Kattie Station\nNew Sophiefurt, IL 95241', 'Wade Schumm', 'sandy.will@example.com', 'ab30204d461e9c44bb5bf3c76bdf96cd85344775', 859); INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('raleigh55', '932 Parisian Tunnel Suite 807\nOranfurt, KS 79496-8425', 'Lelah Kerluke', 'bailey.keenan@example.net', 
'e81ff03a9901c9275d656476e27298ad44c6b92e', 511479); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('rhartmann', '11379 Keyshawn Forest\nWyattfort, IN 92166', 'Jadyn Leannon', 'beatty.bertram@example.net', 'deeaa9242e32c4097f0464ceff613affab5ea061', 48); INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('rkihn', '714 Hoeger Trail Suite 444\nCarterscustomer_ide, MD 84999', 'Estel Bailey', 'albin.fritsch@example.com', 
'2f7c1268fc616c31e47961bac13a745a2a022291', 179993); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('rohan.brent', '7358 Garret Expressway\nSouth Shakiramouth, TN 79775-7250', 'Kacey Walter', 'tracy61@example.net', 
'aeaa6c0dc9ecf12888f511c8604f9ca69b45dc0a', 531021); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('rosa48', '32119 Daryl Road\nPowlowskifurt, HI 81387-8471', 'Nelson Cormier', 'randal.hoeger@example.org', '75921c4aaf2b61ee3421bccb53deefc2777af7f7', 460); INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('rosendo.williamson', '3698 Cartwright Courts Suite 853\nMcKenziebury, MT 89109', 'Natalie Ledner', 'elsie.skiles@example.org', '13ea815d38863f620a1abd0a240eee3059096cb8', 176);
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('rutherford.alan', '211 Maryam Inlet\nMarlinton, NY 78791-4960', 'Flossie Parker', 'jaren48@example.org', '62c8ef1bbf3cb8c4c72525eb93ece64b90df28a2', 205); INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('selina.marquardt', '59332 Grady Course\nEast Elenor, HI 27199', 'Danny Kuphal', 'ressie12@example.org', '16803019adcb887f7c0157d04ed4b85acab01fe0', 342); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('sgoldner', '629 Beer Ramp\nPort Nedfurt, CT 73747-1608', 'Sibyl Keebler', 'ukihn@example.com', '532a8302a49bdafca6733849f98b1f20f67872b4', 461500); INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('so\'conner', '1587 Conscustomer_idine Circle\nNorth Garettbury, customer_id 15770', 'Muhammad Baumbach IV', 'anabelle.bergnaum@example.net', '7f792e5b66f5b677cb883389deb82756f15a00c2', 68); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('tparisian', '008 Adell Isle Suite 938\nKristinshire, LA 63475-6023', 'Dr. Jaren Baumbach IV', 'leann.schroeder@example.net', 
'e6d84cd6e03724a31e03821871f663e8b96a6ed9', 427500); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('umante', '265 Bartoletti Turnpike Apt. 829\nMagdalenaville, WA 31194-5772', 'Mr. Barrett Jerde', 'kcarter@example.net', 
'2282c88db66d821223d02145808f466748a75e79', 98); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('vtreutel', '09980 Luigi Stream\nPort Porter, OK 93928', 'Hermina Beahan', 'columbus25@example.org', '40f51319413e4ae11229f7517977f59e0e290d09', 770); INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('willie97', '63887 Hector Ramp\nNorth Noemyfurt, VT 21325', 'Orlo Emard', 'boyle.carmen@example.org', '4793f11ad549769bc6ca0da6226006954e2bb4d2', 897671883); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('wyman.jarvis', '1487 Kieran Flats\nNew Coleport, SC 21146', 'Prof. Joy Mertz', 'eveline.mcclure@example.com', '0535e0efc8cabf68e4baea42afc0500df7a00279', 425046); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('xbrown', '7431 Hauck Stream Apt. 698\nJenkinschester, MI 84694', 'Simone Bednar DDS', 'patsy.reichel@example.net', 
'95e0ee758b6e854982a61be077191bc7d6f057f0', 972); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('ylangworth', '76290 Lakin Curve Suite 697\nNorth Lexieland, CA 90880', 'Mr. Norbert Harber', 'tomasa.grant@example.org', 
'7b41936aed5065c3aa932ec46796c77c9abfbf16', 657087); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('yondricka', '4957 Juvenal Lane Suite 948\nSchroederville, VA
34546-7808', 'Prof. Tristin Dare DVM', 'iklein@example.org', 
'a2ccf9aae46777ff2649758fc8768d5db3ad9584', 620); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('yundt.santa', '9801 Osinski Common\nSouth Glenhaven, FL 55283-7373', 'Oda Grady', 'lori27@example.org', 
'7f1d7c701b222a89d8f8a32be27f70e35985787f', 905695); 
INSERT INTO `Customer` (`customer_id`, `Address`, `Name`, `Email`, `Password`, `PhoneNumber`) VALUES ('zemlak.autumn', '3675 Haley Burgs Apt. 218\nKuphalmouth, MD 05379', 'Eladio Schuppe Jr.', 'leilani74@example.org', 
'30168f352f698c5d591b64dacf94d881c2724ddf', 623784); 

INSERT INTO `Supplier` (`supplier_id`, `Name`, `PhoneNumber`, `Email`) VALUES (21, 'Ms. Petra Barrows', 0, 'abshire.eldrsupplier_idge@example.org'); 
INSERT INTO `Supplier` (`supplier_id`, `Name`, `PhoneNumber`, `Email`) VALUES (22, 'Dr. Rodolfo Wolf', 1, 'uferry@example.net'); 
INSERT INTO `Supplier` (`supplier_id`, `Name`, `PhoneNumber`, `Email`) VALUES (23, 'Carrie Farrell II', 65, 'arden58@example.com'); 
INSERT INTO `Supplier` (`supplier_id`, `Name`, `PhoneNumber`, `Email`) VALUES (25, 'May Volkman', 546274, 'davin73@example.net');
INSERT INTO `Supplier` (`supplier_id`, `Name`, `PhoneNumber`, `Email`) VALUES (28, 'Ransom Little', 4294967295, 'nels.vonrueden@example.org'); 
INSERT INTO `Supplier` (`supplier_id`, `Name`, `PhoneNumber`, `Email`) VALUES (31, 'Cameron Armstrong', 962, 'grace.schmeler@example.com'); 
INSERT INTO `Supplier` (`supplier_id`, `Name`, `PhoneNumber`, `Email`) VALUES (34, 'Nora Effertz IV', 936365, 'lang.carlie@example.net'); 
INSERT INTO `Supplier` (`supplier_id`, `Name`, `PhoneNumber`, `Email`) VALUES (36, 'Grady Schoen Sr.', 476993, 'yadira.pollich@example.com'); 
INSERT INTO `Supplier` (`supplier_id`, `Name`, `PhoneNumber`, `Email`) VALUES (38, 'Mr. Carter Lubowitz', 139200, 'janie51@example.com');

INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (1, 11, 21, 'ut', 5, 2, 'a', 'Vitae assumenda est molestias aliquid aut sapiente saepe sint.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (2, 12, 22, 'perferendis', 7, 2, 'c', 'Aspernatur esse ea enim accusantium consectetur veniam.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (3, 13, 23, 'tempore', 6, 6, 'a', 'Eveniet voluptatem rerum et.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (4, 14, 25, 'nam', 6, 8, 'b', 'Odit libero dolorum tempore numquam suscipit qui et.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (5, 15, 28, 'magni', 8, 9, 'b', 'Quaerat cum architecto quia totam voluptatibus blanditiis assumenda.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (6, 16, 31, 'in', 2, 9, 'c', 'Recusandae ea corrupti rem necessitatibus assumenda quia a.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (7, 17, 34, 'rerum', 8, 8, 'c', 'Nihil quo qui nostrum voluptatem in quidem animi quasi.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (8, 18, 36, 'officia', 7, 5, 'b', 'Adipisci non repellendus et dolorum consequuntur voluptatum ipsam repellat.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (9, 19, 38, 'vel', 6, 8, 'a', 'Eos fugit blanditiis placeat aut ut quia eligendi.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (10, 11, 21, 'magnam', 5, 2, 'a', 'Debitis nihil sed sint amet qui nihil et.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (11, 12, 22, 'laboriosam', 9, 5, 'b', 'Quia molestias corrupti qui laboriosam nihil.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (12, 13, 23, 'aliquam', 7, 1, 'c', 'Ut ipsum assumenda omnis nisi facere totam.');
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (13, 14, 25, 'optio', 6, 6, 'a', 'Et quia et et sint.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (14, 15, 28, 'quia', 9, 7, 'c', 'Nostrum fugiat quisquam vel rerum.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (15, 16, 31, 'repellendus', 1, 1, 'b', 'Mollitia quia officia vel sequi magnam.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (16, 17, 34, 'fugit', 6, 8, 'c', 'Delectus dolorem in voluptatibus dolor.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (17, 18, 36, 'odio', 4, 1, 'a', 'Incidunt sit ad consequatur.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (18, 19, 38, 'beatae', 6, 1, 'c', 'Fugit illo molestias temporibus sed eum voluptatem quis ea.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (19, 11, 21, 'suscipit', 4, 6, 'b', 'Similique officiis quis eum corporis consequatur consequatur.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (20, 12, 22, 'reiciendis', 4, 1, 'a', 'Eos eius et aspernatur esse dolor voluptatibus.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (21, 13, 23, 'ad', 7, 4, 'b', 'Id perspiciatis id nobis praesentium.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (22, 14, 25, 'repellendus', 7, 9, 'b', 'Et autem in sint nesciunt doloribus.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (23, 15, 28, 'dignissimos', 4, 9, 'c', 'Eum minima vel consequatur culpa.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (24, 16, 31, 'ut', 9, 6, 'a', 'Architecto et et est est saepe non.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (25, 17, 34, 'modi', 4, 2, 'b', 'Sunt cumque possimus similique incidunt impedit.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (26, 18, 36, 'voluptatem', 3, 7, 'a', 'Fugit est voluptatibus corporis iste vitae.');
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (27, 19, 38, 'ex', 1, 4, 'b', 'Dolorem error placeat ut voluptates.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (28, 11, 21, 'nostrum', 9, 9, 'b', 'Dolorem non adipisci iusto harum beatae exercitationem.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (29, 12, 22, 'perferendis', 1, 6, 'c', 'Neque reiciendis commodi ut.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (30, 13, 23, 'ut', 6, 2, 'a', 'Molestiae eum quidem dolorum itaque aspernatur doloremque.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (31, 14, 25, 'rem', 5, 7, 'a', 'Quis ut omnis ut tempore et.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (32, 15, 28, 'cum', 6, 1, 'c', 'Quia quo aliquam quo sit.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (33, 16, 31, 'non', 3, 4, 'c', 'Omnis quo ad eligendi eum.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (34, 17, 34, 'qui', 3, 1, 'c', 'Ipsa quia ut accusamus et.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (35, 18, 36, 'reprehenderit', 1, 8, 'a', 'Distinctio explicabo rem aliquid est consequatur.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (36, 19, 38, 'sed', 4, 7, 'a', 'Iste alias nulla sit illum aliquam et saepe.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (37, 11, 21, 'assumenda', 8, 9, 'a', 'Ab quae dicta dolor ad quis ut.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (38, 12, 22, 'rerum', 7, 5, 'a', 'Temporibus assumenda in quam aut.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (39, 13, 23, 'neque', 8, 4, 'b', 'Et dolorum veritatis qui quo.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (40, 14, 25, 'quia', 5, 9, 'c', 'Et aut nostrum praesentium et.');
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (41, 15, 28, 'alias', 6, 4, 'b', 'Quia qui et modi corrupti beatae.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (42, 16, 31, 'repellendus', 6, 4, 'a', 'Ea iusto nisi non blanditiis ipsam repellat.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (43, 17, 34, 'accusantium', 6, 7, 'b', 'Ab est qui optio ab amet.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (44, 18, 36, 'ullam', 8, 6, 'a', 'Laudantium et repellat quia aliquam.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (45, 19, 38, 'architecto', 5, 8, 'b', 'Consectetur laudantium dicta id repudiandae est atque quia.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (46, 11, 21, 'accusamus', 3, 4, 'c', 'In corrupti omnis veniam commodi sit.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (47, 12, 22, 'enim', 6, 3, 'a', 'Minus itaque voluptatem molestiae odio quae ut.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (48, 13, 23, 'aut', 3, 1, 'b', 'Suscipit odit voluptate fuga.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (49, 14, 25, 'quae', 2, 8, 'b', 'Ut nostrum harum et cum magni.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (50, 15, 28, 'voluptates', 3, 7, 'b', 'In in sint repudiandae delectus dignissimos.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (51, 16, 31, 'omnis', 4, 1, 'a', 'Voluptatem maiores voluptatem libero ut impedit accusantium assumenda.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (52, 17, 34, 'alias', 4, 5, 'b', 'Aut hic harum minima saepe.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (53, 18, 36, 'porro', 7, 7, 'b', 'Dicta quam officia nam aut.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (54, 19, 38, 'enim', 1, 3, 'b', 'Qui ad quo veritatis et.');
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (55, 11, 21, 'maxime', 4, 6, 'b', 'Aut similique illum qui aliquid.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (56, 12, 22, 'aperiam', 6, 5, 'c', 'Vitae similique minima quisquam maiores deserunt.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (57, 13, 23, 'recusandae', 7, 5, 'a', 'Et assumenda modi neque sit et consequatur.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (58, 14, 25, 'rerum', 5, 3, 'a', 'Alias eum laudantium ut ratione dolorem maxime molestias.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (59, 15, 28, 'molestiae', 6, 6, 'a', 'Quas explicabo est enim qui culpa velit et fugiat.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (60, 16, 31, 'quasi', 4, 7, 'b', 'Et est consequatur distinctio at dolor amet non.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (61, 17, 34, 'neque', 7, 2, 'b', 'Repudiandae repellendus in fuga maxime vel.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (62, 18, 36, 'aut', 6, 6, 'a', 'Enim eveniet eaque aut voluptatibus fugit.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (63, 19, 38, 'officia', 3, 2, 'a', 'Ex aliquam minima aliquid esse omnis magni.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (64, 11, 21, 'velit', 3, 4, 'b', 'Expedita omnis placeat qui adipisci aperiam veniam in.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (65, 12, 22, 'omnis', 5, 3, 'c', 'Et modi molestiae deserunt eum.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (66, 13, 23, 'assumenda', 9, 7, 'c', 'Maiores ut sit molestiae libero voluptas.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (67, 14, 25, 'veniam', 4, 8, 'c', 'Error modi et commodi minus sequi animi id.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (68, 15, 28, 'nihil', 7, 7, 'a', 'Earum sit placeat consequatur sed placeat earum.');
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (69, 16, 31, 'ad', 9, 1, 'b', 'Doloremque aliquam veniam in inventore voluptatem praesentium.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (70, 17, 34, 'labore', 2, 7, 'a', 'Aut consequatur vel quia soluta qui suscipit.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (71, 18, 36, 'qui', 1, 7, 'b', 'Corporis a deserunt dolore voluptatem sequi.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (72, 19, 38, 'suscipit', 3, 7, 'c', 'Est sed eos et fugiat nam enim et ad.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (73, 11, 21, 'odit', 4, 3, 'b', 'Sed cum reprehenderit reiciendis aut sint qui.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (74, 12, 22, 'voluptas', 5, 1, 'a', 'Consequatur eius blanditiis voluptatem molestiae consequuntur quia.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (75, 13, 23, 'quam', 1, 8, 'a', 'Repellendus earum non voluptas velit tenetur exercitationem sit.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (76, 14, 25, 'quisquam', 8, 7, 'b', 'Nostrum atque illo itaque aut fugit ab.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (77, 15, 28, 'vero', 2, 3, 'c', 'Numquam doloremque nisi quia vero.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (78, 16, 31, 'accusantium', 6, 7, 'a', 'Distinctio quasi saepe perspiciatis tempore odit totam.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (79, 17, 34, 'libero', 8, 8, 'c', 'Dicta nostrum dolores fugit.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (80, 18, 36, 'et', 3, 5, 'c', 'Vel enim atque beatae aliquid.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (81, 19, 38, 'possimus', 3, 2, 'a', 'Magnam ut vel aut dignissimos neque.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (82, 11, 21, 'ab', 4, 3, 'a', 'Blanditiis ipsam quam ad voluptatem et voluptas.');
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (83, 12, 22, 'voluptatem', 3, 4, 'b', 'Laborum sapiente dolor hic culpa.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (84, 13, 23, 'accusamus', 6, 4, 'c', 'Officia voluptatem nemo accusantium ad incidunt ut.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (85, 14, 25, 'eos', 4, 3, 'c', 'Eos modi quibusdam adipisci et.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (86, 15, 28, 'quia', 1, 3, 'a', 'Commodi culpa ut magni sapiente aut.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (87, 16, 31, 'et', 4, 5, 'b', 'Fugiat accusamus est deserunt quaerat et amet tenetur beatae.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (88, 17, 34, 'molestiae', 5, 4, 'c', 'Dolorum ut sed placeat excepturi et.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (89, 18, 36, 'totam', 4, 9, 'c', 'Corporis incidunt qui exercitationem sed necessitatibus.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (90, 19, 38, 'quod', 5, 7, 'c', 'Velit ducimus harum iure nemo laborum.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (91, 11, 21, 'nihil', 3, 5, 'c', 'Non ut magni asperiores non quia quod et.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (92, 12, 22, 'assumenda', 9, 2, 'a', 'Incidunt amet ea et.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (93, 13, 23, 'fuga', 7, 5, 'a', 'Qui tempore corrupti id molestias et voluptates.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (94, 14, 25, 'ipsam', 7, 2, 'a', 'Hic et amet perferendis sunt voluptatem natus.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (95, 15, 28, 'dolores', 9, 3, 'c', 'Laborum magni odio aspernatur aut voluptas voluptatum.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (96, 16, 31, 'soluta', 2, 1, 'c', 'Maxime velit corporis autem eum mollitia.');
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (97, 17, 34, 'sit', 1, 8, 'b', 'Quos unde alias tempora unde cum corporis in quaerat.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (98, 18, 36, 'perspiciatis', 5, 1, 'a', 'Corporis voluptas sequi eaque ab rerum.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (99, 19, 38, 'id', 4, 2, 'a', 'Asperiores voluptate suscipit consequuntur est earum repellat totam.'); 
INSERT INTO `Product` (`product_id`, `admin_id`, `supplier_id`, `ProductName`, `MRP`, `Quantity`, `ProductCategory`, `ProductDescription`) VALUES (100, 11, 21, 'ab', 2, 1, 'b', 'Molestiae a velit voluptas et voluptatum magnam.'); 

INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('aletha87', 1, 229); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('aletha87', 14, 126); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('aletha87', 19, 53); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('aletha87', 37, 80); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('aletha87', 55, 205); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('aletha87', 60, 233); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('aletha87', 73, 228); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('aletha87', 78, 225); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('aletha87', 96, 140); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('alvera03', 2, 134); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('alvera03', 15, 118); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('alvera03', 20, 66); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('alvera03', 38, 155); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('alvera03', 56, 85); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('alvera03', 61, 57); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('alvera03', 74, 104); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('alvera03', 79, 189); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('alvera03', 97, 238);
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('arowe', 3, 215); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('arowe', 16, 47); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('arowe', 21, 185); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('arowe', 39, 68); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('arowe', 57, 232); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('arowe', 62, 67); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('arowe', 75, 147); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('arowe', 80, 238); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('arowe', 98, 21); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('batz.saige', 4, 116); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('batz.saige', 17, 45); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('batz.saige', 22, 162); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('batz.saige', 40, 64); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('batz.saige', 58, 40); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('batz.saige', 63, 88); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('batz.saige', 76, 39); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('batz.saige', 81, 104); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('batz.saige', 99, 253); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('berenice.upton', 5, 210); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('berenice.upton', 18, 203); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('berenice.upton', 23, 217); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('berenice.upton', 41, 113); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('berenice.upton', 59, 167); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('berenice.upton', 64, 182); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('berenice.upton', 77, 166); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('berenice.upton', 82, 105); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('berenice.upton', 100, 238); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('block.lenore', 1, 169); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('botsford.nicklaus', 2, 191); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('botsford.nicklaus', 7, 22); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('botsford.nicklaus', 20, 160); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('botsford.nicklaus', 25, 69); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('botsford.nicklaus', 43, 205); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('botsford.nicklaus', 61, 120); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('botsford.nicklaus', 66, 135); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('botsford.nicklaus', 79, 93); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('botsford.nicklaus', 84, 206); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('brad74', 3, 111); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('brad74', 8, 153); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('brad74', 21, 148); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('brad74', 26, 119); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('brad74', 44, 29); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('brad74', 62, 51); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('brad74', 67, 2); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('brad74', 80, 201); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('brad74', 85, 208); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('christop.schaden', 4, 4); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('christop.schaden', 9, 182); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('christop.schaden', 22, 154); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('christop.schaden', 27, 53); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('christop.schaden', 45, 151); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('christop.schaden', 63, 19); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('christop.schaden', 68, 126); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('christop.schaden', 81, 48); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('christop.schaden', 86, 152);
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('cremin.mikel', 5, 168); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('cremin.mikel', 10, 249); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('cremin.mikel', 23, 168); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('cremin.mikel', 28, 56); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('cremin.mikel', 46, 233); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('cremin.mikel', 64, 29); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('cremin.mikel', 69, 50); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('cremin.mikel', 82, 156); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('cremin.mikel', 87, 30); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('dameon27', 6, 188); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('dameon27', 11, 85); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('dameon27', 24, 246); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('dameon27', 29, 85); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('dameon27', 47, 137); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('dameon27', 65, 242); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('dameon27', 70, 33); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('dameon27', 83, 59); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('dameon27', 88, 84); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('delphia.mertz', 7, 161); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('delphia.mertz', 12, 171); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('delphia.mertz', 25, 70); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('delphia.mertz', 30, 53); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('delphia.mertz', 48, 101); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('delphia.mertz', 66, 165); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('delphia.mertz', 71, 27); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('delphia.mertz', 84, 117); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('delphia.mertz', 89, 236); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('demario.blanda', 8, 219); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('demario.blanda', 13, 102); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('demario.blanda', 26, 212); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('demario.blanda', 31, 37); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('demario.blanda', 49, 120); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('demario.blanda', 67, 68); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('demario.blanda', 72, 169); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('demario.blanda', 85, 202);
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('demario.blanda', 90, 45); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('devyn02', 9, 71); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('devyn02', 14, 144); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('devyn02', 27, 142); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('devyn02', 32, 93); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('devyn02', 50, 113); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('devyn02', 68, 166); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('devyn02', 73, 108); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('devyn02', 86, 110); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('devyn02', 91, 0); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('dlowe', 10, 20); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('dlowe', 15, 164); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('dlowe', 28, 5); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('dlowe', 33, 186); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('dlowe', 51, 176); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('dlowe', 69, 61); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('dlowe', 74, 185); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('dlowe', 87, 106); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('dlowe', 92, 252); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('emmett.mcdermott', 11, 136); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('emmett.mcdermott', 16, 157); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('emmett.mcdermott', 29, 199); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('emmett.mcdermott', 34, 159); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('emmett.mcdermott', 52, 85); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('emmett.mcdermott', 70, 159); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('emmett.mcdermott', 75, 102); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('emmett.mcdermott', 88, 244); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('emmett.mcdermott', 93, 215); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ezequiel70', 12, 182); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ezequiel70', 17, 225); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ezequiel70', 30, 54); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ezequiel70', 35, 241); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ezequiel70', 53, 246); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ezequiel70', 71, 141);
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ezequiel70', 76, 44); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ezequiel70', 89, 129); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ezequiel70', 94, 87); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ezra.goyette', 13, 129); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ezra.goyette', 18, 47); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ezra.goyette', 31, 244); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ezra.goyette', 36, 40); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ezra.goyette', 54, 187); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ezra.goyette', 72, 31); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ezra.goyette', 77, 17); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ezra.goyette', 90, 161); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ezra.goyette', 95, 18); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('fiona.berge', 14, 108); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('fiona.berge', 19, 184); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('fiona.berge', 32, 201); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('fiona.berge', 37, 28); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('fiona.berge', 55, 18); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('fiona.berge', 73, 65); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('fiona.berge', 78, 206); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('fiona.berge', 91, 124); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('fiona.berge', 96, 177); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('gaylord.francesca', 15, 21); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('gaylord.francesca', 20, 175); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('gaylord.francesca', 33, 64); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('gaylord.francesca', 38, 32); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('gaylord.francesca', 56, 160); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('gaylord.francesca', 74, 97); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('gaylord.francesca', 79, 243); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('gaylord.francesca', 92, 70); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('gaylord.francesca', 97, 13); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('haylee.grimes', 16, 105); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('haylee.grimes', 21, 179); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('haylee.grimes', 34, 68);
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('haylee.grimes', 39, 21); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('haylee.grimes', 57, 78); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('haylee.grimes', 75, 60); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('haylee.grimes', 80, 
215); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('haylee.grimes', 93, 11); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('haylee.grimes', 98, 83); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('herminia.jacobson', 17, 132); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('herminia.jacobson', 22, 201); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('herminia.jacobson', 35, 207); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('herminia.jacobson', 40, 91); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('herminia.jacobson', 58, 64); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('herminia.jacobson', 76, 135); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('herminia.jacobson', 81, 10); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('herminia.jacobson', 94, 137); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('herminia.jacobson', 99, 85); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('hodkiewicz.corene', 18, 83); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('hodkiewicz.corene', 23, 81); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('hodkiewicz.corene', 36, 202); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('hodkiewicz.corene', 41, 58); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('hodkiewicz.corene', 59, 244); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('hodkiewicz.corene', 77, 142); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('hodkiewicz.corene', 82, 110); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('hodkiewicz.corene', 95, 220); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('hodkiewicz.corene', 100, 143); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('istracke', 1, 197);
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('istracke', 19, 142); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('istracke', 24, 197); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('istracke', 37, 191); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('istracke', 42, 152); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('istracke', 60, 172); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('istracke', 78, 110); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('istracke', 83, 155); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('istracke', 96, 186); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('javonte73', 2, 245); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('javonte73', 20, 222); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('javonte73', 25, 146); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('javonte73', 38, 204); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('javonte73', 43, 244); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('javonte73', 61, 251); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('javonte73', 79, 203); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('javonte73', 84, 178); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('javonte73', 97, 17); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('justina52', 3, 202); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('justina52', 21, 201); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('justina52', 26, 15); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('justina52', 39, 242); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('justina52', 44, 33); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('justina52', 62, 212); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('justina52', 80, 51); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('justina52', 85, 34); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('justina52', 98, 147); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('kari40', 4, 163); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('kari40', 22, 130); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('kari40', 27, 67); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('kari40', 40, 97); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('kari40', 45, 126); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('kari40', 63, 139); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('kari40', 81, 18); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('kari40', 86, 10); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('kari40', 99, 241); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('khomenick', 5, 175); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('khomenick', 23, 253); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('khomenick', 28, 253); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('khomenick', 41, 194); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('khomenick', 46, 237); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('khomenick', 64, 22); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('khomenick', 82, 12); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('khomenick', 87, 115); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('khomenick', 100, 114);
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('kiley54', 6, 8); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('kiley54', 24, 94); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('kiley54', 29, 158); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('kiley54', 42, 96); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('kiley54', 47, 57); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('kiley54', 65, 188); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('kiley54', 83, 190); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('kiley54', 88, 119); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('lpagac', 7, 71); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('lpagac', 25, 242); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('lpagac', 30, 96); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('lpagac', 43, 200); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('lpagac', 48, 5); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('lpagac', 66, 70); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('lpagac', 84, 198); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('lpagac', 89, 246); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('macie26', 8, 191); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('macie26', 26, 58); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('macie26', 31, 17); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('macie26', 44, 242); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('macie26', 49, 145); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('macie26', 67, 21); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('macie26', 85, 49); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('macie26', 90, 206); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('maritza.walker', 9, 204); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('maritza.walker', 27, 70); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('maritza.walker', 32, 178); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('maritza.walker', 45, 35); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('maritza.walker', 50, 108); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('maritza.walker', 68, 104); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('maritza.walker', 86, 119); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('maritza.walker', 91, 243); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('maybell.mante', 10, 159); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('maybell.mante', 28, 48); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('maybell.mante', 33, 32); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('maybell.mante', 46, 219);
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('maybell.mante', 51, 112); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('maybell.mante', 69, 16); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('maybell.mante', 87, 9); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('maybell.mante', 92, 243); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('modesto47', 11, 192); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('modesto47', 29, 194); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('modesto47', 34, 130); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('modesto47', 47, 225); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('modesto47', 52, 81); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('modesto47', 70, 0); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('modesto47', 88, 6); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('modesto47', 93, 175); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('montana54', 12, 97); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('montana54', 30, 173); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('montana54', 35, 6); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('montana54', 48, 79); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('montana54', 53, 3); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('montana54', 71, 30); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('montana54', 89, 220); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('montana54', 94, 10); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('morn', 13, 119); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('morn', 31, 72); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('morn', 36, 115); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('morn', 49, 66); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('morn', 54, 119); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('morn', 72, 180); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('morn', 90, 71); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('morn', 95, 96); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('myrl.sawayn', 14, 85); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('myrl.sawayn', 32, 213); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('myrl.sawayn', 37, 180); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('myrl.sawayn', 50, 198); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('myrl.sawayn', 55, 185); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('myrl.sawayn', 73, 22); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('myrl.sawayn', 91, 171); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('myrl.sawayn', 96, 228); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('pearl.von', 15, 250); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('pearl.von', 33, 38); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('pearl.von', 38, 26); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('pearl.von', 51, 58); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('pearl.von', 56, 232); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('pearl.von', 74, 100);
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('pearl.von', 92, 171); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('pearl.von', 97, 27); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ptillman', 16, 166); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ptillman', 34, 116); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ptillman', 39, 119); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ptillman', 52, 207); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ptillman', 57, 24); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ptillman', 75, 27); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ptillman', 93, 188); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ptillman', 98, 175); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('raleigh55', 17, 120); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('raleigh55', 35, 139); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('raleigh55', 40, 126); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('raleigh55', 53, 191); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('raleigh55', 58, 251); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('raleigh55', 76, 240); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('raleigh55', 94, 69); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('raleigh55', 99, 81); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rhartmann', 18, 104); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rhartmann', 36, 74); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rhartmann', 41, 235); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rhartmann', 54, 149); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rhartmann', 59, 161); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rhartmann', 77, 254); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rhartmann', 95, 153); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rhartmann', 100, 183); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rkihn', 1, 100); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rkihn', 19, 121); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rkihn', 37, 39); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rkihn', 42, 165); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rkihn', 55, 18); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rkihn', 60, 126); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rkihn', 78, 195); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rkihn', 96, 102); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rohan.brent', 2, 74); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rohan.brent', 20, 191); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rohan.brent', 38, 111); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rohan.brent', 43, 14); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rohan.brent', 56, 89); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rohan.brent', 61, 8); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rohan.brent', 79, 108); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rohan.brent', 97, 167); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rosa48', 3, 43); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rosa48', 21, 160);
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rosa48', 39, 100); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rosa48', 44, 95); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rosa48', 57, 105); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rosa48', 62, 165); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rosa48', 80, 48); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rosa48', 98, 46); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rosendo.williamson', 4, 150); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rosendo.williamson', 22, 247); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rosendo.williamson', 40, 123); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rosendo.williamson', 45, 129); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rosendo.williamson', 58, 129); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rosendo.williamson', 63, 21); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rosendo.williamson', 81, 132); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rosendo.williamson', 99, 173); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rutherford.alan', 5, 159); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rutherford.alan', 23, 216); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rutherford.alan', 41, 147); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rutherford.alan', 46, 12); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rutherford.alan', 59, 33); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rutherford.alan', 64, 113); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rutherford.alan', 82, 25); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('rutherford.alan', 100, 164); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('selina.marquardt', 1, 37); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('selina.marquardt', 6, 16); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('selina.marquardt', 24, 89); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('selina.marquardt', 42, 51); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('selina.marquardt', 47, 218);
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('selina.marquardt', 60, 94); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('selina.marquardt', 65, 5); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('selina.marquardt', 83, 130); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('sgoldner', 2, 26); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('sgoldner', 7, 196); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('sgoldner', 25, 199); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('sgoldner', 43, 31); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('sgoldner', 48, 130); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('sgoldner', 61, 68); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('sgoldner', 66, 118); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('sgoldner', 84, 120); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('so\'conner', 3, 56); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('so\'conner', 8, 228); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('so\'conner', 26, 211); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('so\'conner', 44, 245); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('so\'conner', 49, 243); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('so\'conner', 62, 44); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('so\'conner', 67, 191); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('so\'conner', 85, 125); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('tparisian', 4, 49); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('tparisian', 9, 119); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('tparisian', 27, 125); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('tparisian', 45, 146); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('tparisian', 50, 108); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('tparisian', 63, 29); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('tparisian', 68, 13); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('tparisian', 86, 192); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('umante', 5, 221); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('umante', 10, 8); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('umante', 28, 62); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('umante', 46, 5); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('umante', 51, 95); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('umante', 64, 251); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('umante', 69, 198); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('umante', 87, 226); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('vtreutel', 6, 144); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('vtreutel', 11, 148); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('vtreutel', 29, 168); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('vtreutel', 47, 155); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('vtreutel', 52, 93); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('vtreutel', 65, 198);
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('vtreutel', 70, 27); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('vtreutel', 88, 226); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('willie97', 7, 98); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('willie97', 12, 105); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('willie97', 30, 59); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('willie97', 48, 58); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('willie97', 53, 102); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('willie97', 66, 58); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('willie97', 71, 183); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('willie97', 89, 2); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('wyman.jarvis', 8, 109); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('wyman.jarvis', 13, 19); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('wyman.jarvis', 31, 255); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('wyman.jarvis', 49, 212); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('wyman.jarvis', 54, 99); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('wyman.jarvis', 67, 228); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('wyman.jarvis', 72, 38); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('wyman.jarvis', 90, 126); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('xbrown', 9, 120); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('xbrown', 14, 18); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('xbrown', 32, 162); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('xbrown', 50, 135); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('xbrown', 55, 30); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('xbrown', 68, 129); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('xbrown', 73, 207); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('xbrown', 91, 190); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ylangworth', 10, 16); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ylangworth', 15, 144); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ylangworth', 33, 186); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ylangworth', 51, 207); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ylangworth', 56, 15); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ylangworth', 69, 161); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ylangworth', 74, 162); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('ylangworth', 92, 215); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('yondricka', 11, 120); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('yondricka', 16, 179); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('yondricka', 34, 71); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('yondricka', 52, 130); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('yondricka', 57, 168); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('yondricka', 70, 171); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('yondricka', 75, 226); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('yondricka', 93, 69); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('yundt.santa', 12, 203); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('yundt.santa', 17, 175);
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('yundt.santa', 35, 104); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('yundt.santa', 53, 137); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('yundt.santa', 58, 162); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('yundt.santa', 71, 98); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('yundt.santa', 76, 146); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('yundt.santa', 94, 70); INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('zemlak.autumn', 13, 103); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('zemlak.autumn', 18, 43); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('zemlak.autumn', 36, 189); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('zemlak.autumn', 54, 98); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('zemlak.autumn', 59, 248); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('zemlak.autumn', 72, 239); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('zemlak.autumn', 77, 211); 
INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ('zemlak.autumn', 95, 158); 

INSERT INTO `Delivery` (`delivery_id`, `Name`, `PhoneNumber`) VALUES (16, 'Mrs. Catalina Walter', 0); 
INSERT INTO `Delivery` (`delivery_id`, `Name`, `PhoneNumber`) VALUES (17, 'Ruthie Ebert', 555478); 
INSERT INTO `Delivery` (`delivery_id`, `Name`, `PhoneNumber`) VALUES (18, 'Mrs. Tanya Koss', 22); 
INSERT INTO `Delivery` (`delivery_id`, `Name`, `PhoneNumber`) VALUES (19, ' Goat Prakrit', 69); 
INSERT INTO `Delivery` (`delivery_id`, `Name`, `PhoneNumber`) VALUES (20, 'Emily Crona', 1); 
INSERT INTO `Delivery` (`delivery_id`, `Name`, `PhoneNumber`) VALUES (21, 'Adell Trantow', 937816); 
INSERT INTO `Delivery` (`delivery_id`, `Name`, `PhoneNumber`) VALUES (22, 'Gunnar Heller', 359); 
INSERT INTO `Delivery` (`delivery_id`, `Name`, `PhoneNumber`) VALUES (23, 'Dr. Morgan Ward MD', 448); 
INSERT INTO `Delivery` (`delivery_id`, `Name`, `PhoneNumber`) VALUES (24, 'Bruce Cruickshank', 271722); 
INSERT INTO `Delivery` (`delivery_id`, `Name`, `PhoneNumber`) VALUES (28, 'Tillman Smitham I', 485424);
INSERT INTO `Delivery` (`delivery_id`, `Name`, `PhoneNumber`) VALUES (29, 'Albina Reilly', 336); 

INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('ab', 45); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('accusa', 10); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('ad', 84); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('aliqua', 94); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('animi', 49); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('aperia', 97); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('archit', 52); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('aspern', 70); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('at', 16); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('atque', 47); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('aut', 84); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('beatae', 24); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('conseq', 26); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('corpor', 64); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('corrup', 88); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('culpa', 82); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('cum', 95); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('cumque', 40); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('cupidi', 35); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('debiti', 38); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('delect', 71); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('deseru', 9); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('dicta', 6); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('dolor', 41); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('dolore', 84); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('dolori', 70); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('ducimu', 59);
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('ea', 24); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('eius', 54); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('eligen', 30); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('enim', 90); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('eos', 66); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('esse', 97); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('est', 32); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('et', 0); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('eum', 94); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('exerci', 34); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('harum', 81); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('hilol', 28); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('illo', 53); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('illum', 84); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('impedi', 49); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('in', 20); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('incidu', 0); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('ipsa', 74); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('ipsam', 34); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('iste', 53); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('iure', 64); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('iusto', 0); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('laudan', 61); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('libero', 30); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('magni', 84); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('maxime', 99); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('minima', 70); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('modi', 30); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('molest', 84); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('nesciu', 25); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('nisi', 9); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('nobis', 53); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('nulla', 81); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('occaec', 13); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('odio', 91); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('omnis', 62); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('pariat', 35); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('perspi', 32); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('placea', 60); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('praese', 54); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('quaera', 32); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('quas', 95); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('qui', 35); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('quia', 52);
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('quis', 75); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('quisqu', 6); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('quo', 41); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('quod', 81); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('quos', 94); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('rem', 92); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('repell', 40); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('rerum', 38); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('saepe', 35); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('sed', 4); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('sequi', 15); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('simili', 94); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('sint', 23); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('sit', 91); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('soluta', 33); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('sunt', 14);
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('tenetu', 55); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('ullam', 77); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('unde', 98); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('ut', 77); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('vel', 9); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('velit', 53); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('veniam', 49); 
INSERT INTO `Discount` (`discount_id`, `percentageOff`) VALUES ('volupt', 37); 

INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (1, 'aletha87', '1978-09-20 22:31:59', 'NotDelivered', 'CreditCard', 'ab', 16); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (2, 'alvera03', '1981-10-26 09:37:39', 'Delivered', 'Cash', 'accusa', 17); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (3, 'arowe', '1988-07-17 19:13:30', 'Returned', 'DebitCard', 'ad', 18); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (4, 'batz.saige', '1992-10-28 09:54:01', 'Returned', 'Cash', 'aliqua', 20); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (5, 'berenice.upton', '1987-01-13 20:38:42', 'Delivered', 'DebitCard', 'animi', 21); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (6, 'block.lenore', '1976-11-02 01:22:12', 'Delivered', 'Cash', 'aperia', 22); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (7, 'botsford.nicklaus', '1987-01-13 11:19:21', 'Delivered', 'CreditCard', 'archit', 23); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (8, 'brad74', '2013-08-01 17:31:53', 'Delivered', 'DebitCard', 'aspern', 24); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (9, 'christop.schaden', '1972-01-02 01:20:23', 'Returned', 'DebitCard', 'at', 28); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (10, 'cremin.mikel', '2016-11-04 06:03:24', 'Delivered', 'Cash', 'atque', 29); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (11, 'dameon27', '2018-03-19 18:37:35', 'Returned', 'CreditCard', 'aut', 16); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (12, 'delphia.mertz', '1996-07-31 22:21:35', 'NotDelivered', 'Cash', 'beatae', 17); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (13, 'demario.blanda', '1991-08-12 19:41:04', 'Returned', 'CreditCard', 'conseq', 18); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (14, 'devyn02', '1976-08-10 11:52:09', 'NotDelivered', 'CreditCard', 'corpor', 20);
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (15, 'dlowe', '1975-04-06 03:28:02', 'NotDelivered', 'Cash', 'corrup', 21); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (16, 'emmett.mcdermott', '1988-03-12 19:21:45', 'Returned', 'DebitCard', 'culpa', 22); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (17, 'ezequiel70', '1972-11-18 09:33:48', 'Returned', 'DebitCard', 'cum', 23); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (18, 'ezra.goyette', '2007-11-22 15:33:53', 'NotDelivered', 'Cash', 'cumque', 24); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (19, 'fiona.berge', '1991-09-11 02:35:24', 'Delivered', 'DebitCard', 'cupidi', 28); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (20, 'gaylord.francesca', '1978-04-07 07:51:38', 'Returned', 'CreditCard', 'debiti', 29); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (21, 'haylee.grimes', '1989-02-07 08:53:11', 'Delivered', 'CreditCard', 'delect', 16); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (22, 'herminia.jacobson', '1980-12-21 11:05:10', 'Returned', 'DebitCard', 'deseru', 17); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (23, 'hodkiewicz.corene', '1971-01-14 22:05:37', 'NotDelivered', 'CreditCard', 'dicta', 18); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (24, 'istracke', '1978-10-16 06:50:47', 'Delivered', 'CreditCard', 'dolor', 20); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (25, 'javonte73', '1971-05-08 11:42:48', 'Returned', 'DebitCard', 'dolore', 21); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (26, 'justina52', '1984-08-28 13:38:19', 'Returned', 'CreditCard', 'dolori', 22); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (27, 'kari40', '2019-02-02 09:47:50', 'NotDelivered', 'CreditCard', 'ducimu', 23); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (28, 'khomenick', '2001-05-06 11:33:21', 'Delivered', 'CreditCard', 'ea', 24);
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (29, 'kiley54', '2005-04-24 15:35:39', 'Returned', 'DebitCard', 'eius', 28); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (30, 'lpagac', '2006-12-22 04:15:55', 'NotDelivered', 'CreditCard', 'eligen', 29); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (31, 'macie26', '2014-08-05 17:36:48', 'NotDelivered', 'DebitCard', 'enim', 16); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (32, 'maritza.walker', '1980-08-24 02:36:07', 'Returned', 'Cash', 'eos', 17); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (33, 'maybell.mante', '1972-04-29 20:08:30', 'Returned', 'CreditCard', 'esse', 18); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (34, 'modesto47', '1991-10-26 04:36:54', 'Delivered', 'Cash', 'est', 20); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (35, 'montana54', '1994-02-05 22:46:14', 'Delivered', 'Cash', 'et', 21); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (36, 'morn', '1975-02-15 18:43:26', 'Returned', 'Cash', 'eum', 22); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (37, 'myrl.sawayn', '1999-03-29 22:02:08', 'NotDelivered', 'Cash', 'exerci', 23); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (38, 'pearl.von', '1981-07-07 06:28:10', 'Returned', 'CreditCard', 'harum', 24); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (39, 'ptillman', '2005-07-30 13:33:45', 'Delivered', 'CreditCard', 'hilol', 28); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (40, 'raleigh55', '2006-02-22 15:20:00', 'NotDelivered', 'DebitCard', 'illo', 29); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (41, 'rhartmann', '1996-12-29 03:22:34', 'NotDelivered', 'Cash', 'illum', 16); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (42, 'rkihn', '2022-02-07 10:32:43', 'Delivered', 'DebitCard', 'impedi', 17);
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (43, 'rohan.brent', '2002-07-20 18:58:06', 'Delivered', 'Cash', 'in', 18); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (44, 'rosa48', '2009-01-03 02:14:10', 'Delivered', 'CreditCard', 'incidu', 20); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (45, 'rosendo.williamson', '1975-03-05 02:23:04', 'NotDelivered', 'DebitCard', 'ipsa', 21); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (46, 'rutherford.alan', '1989-03-06 05:08:17', 'Returned', 'Cash', 'ipsam', 22); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (47, 'selina.marquardt', '1980-04-09 00:01:37', 'NotDelivered', 'CreditCard', 'iste', 23); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (48, 'sgoldner', '2015-11-23 23:31:28', 'Delivered', 'DebitCard', 'iure', 24); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (49, 'so\'conner', '2005-08-17 22:12:33', 'Returned', 'DebitCard', 'iusto', 28); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (50, 'tparisian', '2006-04-09 12:22:35', 'Returned', 'DebitCard', 'laudan', 29); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (51, 'umante', '1988-04-20 16:35:45', 'Delivered', 'CreditCard', 'libero', 16); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (52, 'vtreutel', '2014-12-08 01:14:33', 'Returned', 'Cash', 'magni', 17); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (53, 'willie97', '1975-12-02 09:23:07', 'Delivered', 'DebitCard', 'maxime', 18); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (54, 'wyman.jarvis', '1998-02-15 18:49:51', 'NotDelivered', 'DebitCard', 'minima', 20); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (55, 'xbrown', '1997-09-26 07:30:28', 'Delivered', 'CreditCard', 'modi', 21); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (56, 'ylangworth', '1983-08-30 12:57:48', 'NotDelivered', 'CreditCard', 'molest', 22);
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (57, 'yondricka', '1988-12-09 02:32:52', 'Returned', 'DebitCard', 'nesciu', 23); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (58, 'yundt.santa', '1979-02-28 19:12:04', 'Returned', 'CreditCard', 'nisi', 24); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (59, 'zemlak.autumn', '1984-10-06 03:31:58', 'NotDelivered', 'CreditCard', 'nobis', 28); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (60, 'aletha87', '2013-05-06 04:42:00', 'NotDelivered', 'CreditCard', 'nulla', 29); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (61, 'alvera03', '1995-12-15 13:13:09', 'Returned', 'Cash', 'occaec', 16); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (62, 'arowe', '2007-08-27 20:43:41', 'Delivered', 'DebitCard', 'odio', 17); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (63, 'batz.saige', '1994-07-09 04:57:05', 'Returned', 'Cash', 'omnis', 18); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (64, 'berenice.upton', '2006-03-22 15:37:29', 'Delivered', 'Cash', 'pariat', 20); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (65, 'block.lenore', '2002-03-29 04:19:10', 'NotDelivered', 'DebitCard', 'perspi', 21); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (66, 'botsford.nicklaus', '2003-04-30 06:44:25', 'Delivered', 'CreditCard', 'placea', 22); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (67, 'brad74', '2016-08-26 20:18:58', 'NotDelivered', 'Cash', 'praese', 23); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (68, 'christop.schaden', '2010-02-12 08:35:00', 'Returned', 'DebitCard', 'quaera', 24); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (69, 'cremin.mikel', '1988-12-12 08:41:45', 'Delivered', 'DebitCard', 'quas', 28); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (70, 'dameon27', '1972-04-04 17:38:59', 'Returned', 'CreditCard', 'qui', 29);
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (71, 'delphia.mertz', '1987-04-03 21:20:51', 'Returned', 'Cash', 'quia', 16); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (72, 'demario.blanda', '1983-10-21 17:40:44', 'Delivered', 'Cash', 'quis', 17); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (73, 'devyn02', '1981-03-02 22:31:56', 'NotDelivered', 'Cash', 'quisqu', 18); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (74, 'dlowe', '2004-01-11 15:29:18', 'Returned', 'Cash', 'quo', 20); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (75, 'emmett.mcdermott', '2014-03-17 01:34:28', 'Delivered', 'DebitCard', 'quod', 21); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (76, 'ezequiel70', '1983-02-11 14:59:14', 'NotDelivered', 'DebitCard', 'quos', 22); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (77, 'ezra.goyette', '2014-01-24 15:27:04', 'NotDelivered', 'CreditCard', 'rem', 23); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (78, 'fiona.berge', '1978-09-13 21:53:43', 'Delivered', 'DebitCard', 'repell', 24); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (79, 'gaylord.francesca', '1981-08-20 16:35:33', 'Returned', 'DebitCard', 'rerum', 28); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (80, 'haylee.grimes', '2010-09-02 19:57:40', 'Delivered', 'Cash', 'saepe', 29); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (81, 'herminia.jacobson', '1997-07-25 20:46:42', 'Delivered', 'DebitCard', 'sed', 16); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (82, 'hodkiewicz.corene', '2015-07-10 10:20:18', 'Delivered', 'CreditCard', 'sequi', 17); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (83, 'istracke', '1990-04-08 01:45:42', 'NotDelivered', 'CreditCard', 'simili', 18); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (84, 'javonte73', '2015-01-23 10:11:37', 'Delivered', 'DebitCard', 'sint', 20);
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (85, 'justina52', '2017-11-07 16:57:37', 'NotDelivered', 'Cash', 'sit', 21); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (86, 'kari40', '1971-06-03 01:00:39', 'Returned', 'Cash', 'soluta', 22); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (87, 'khomenick', '1979-04-15 21:58:28', 'Returned', 'CreditCard', 'sunt', 23); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (88, 'kiley54', '1991-07-17 04:51:34', 'NotDelivered', 'CreditCard', 'tenetu', 24); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (89, 'lpagac', '2019-01-06 04:35:23', 'Delivered', 'DebitCard', 'ullam', 28); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (90, 'macie26', '1995-11-19 16:02:24', 'NotDelivered', 'CreditCard', 'unde', 29); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (91, 'maritza.walker', '2005-10-19 15:08:32', 'NotDelivered', 'CreditCard', 'ut', 16); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (92, 'maybell.mante', '1984-06-17 07:35:38', 'NotDelivered', 'Cash', 'vel', 17); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (93, 'modesto47', '1972-12-08 05:41:37', 'Returned', 'Cash', 'velit', 18); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (94, 'montana54', '2020-08-30 20:00:13', 'NotDelivered', 'DebitCard', 'veniam', 20); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (95, 'morn', '1982-07-09 02:24:35', 'NotDelivered', 'Cash', 'volupt', 21); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (96, 'myrl.sawayn', '2021-10-30 15:32:38', 'Delivered', 'CreditCard', 'ab', 22); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (97, 'pearl.von', '2009-10-10 23:32:40', 'Delivered', 'CreditCard', 'accusa', 23); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (98, 'ptillman', '1976-04-20 10:15:34', 'Delivered', 'DebitCard', 'ad', 24);
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (99, 'raleigh55', '2003-03-03 19:23:07', 'Delivered', 'Cash', 'aliqua', 28); 
INSERT INTO `Orders` (`orders_id`, `customer_id`, `timestamp`, `status`, `modeOfPayment`, `discount_id`, `delivery_id`) VALUES (100, 'rhartmann', '1986-08-20 22:05:18', 'Delivered', 'DebitCard', 'animi', 29); 

INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (1, 57, 9283); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (2, 16, 9897); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (2, 49, 539); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (2, 81, 8735); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (3, 57, 4559); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (3, 87, 1879); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (4, 1, 8505); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (5, 22, 1329); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (5, 96, 8074); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (6, 34, 7801);
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (7, 26, 2754); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (7, 58, 9462); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (7, 68, 9675); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (7, 69, 3322); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (7, 93, 3144); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (8, 16, 3594); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (8, 45, 5183); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (8, 60, 9383); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (8, 75, 7174); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (9, 11, 8575); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (9, 85, 4108); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (10, 10, 5353); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (11, 18, 5200); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (12, 55, 99); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (13, 36, 4296); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (14, 59, 6474); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (15, 18, 5434); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (16, 11, 2641); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (16, 49, 6817); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (17, 57, 5283); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (17, 59, 1349); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (18, 7, 2989);
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (18, 26, 8966); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (18, 33, 7320); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (19, 5, 9768); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (19, 93, 6308); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (20, 21, 6449); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (21, 45, 874); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (22, 63, 4645); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (23, 72, 638); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (24, 33, 5711); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (25, 75, 7243); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (26, 10, 2919); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (27, 64, 8122); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (28, 40, 982); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (29, 1, 3838); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (29, 34, 6324); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (29, 51, 510); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (29, 90, 5284); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (30, 3, 8609); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (30, 22, 4247); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (30, 69, 1030); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (31, 78, 3835); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (31, 82, 5087);
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (32, 74, 234); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (33, 21, 389); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (33, 24, 554); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (33, 69, 396); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (33, 80, 9930); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (34, 39, 513); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (34, 91, 5148); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (35, 34, 2825); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (35, 77, 696); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (36, 79, 633); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (37, 13, 6039); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (37, 35, 454); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (37, 69, 358); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (38, 74, 784); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (39, 11, 6728); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (39, 80, 6957); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (40, 15, 5513); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (40, 43, 8091); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (40, 59, 4191); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (41, 4, 5398); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (42, 1, 3952); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (42, 66, 5146);
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (43, 79, 1922); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (44, 8, 779); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (44, 36, 9451); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (44, 66, 4545); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (45, 42, 5163); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (45, 48, 78); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (45, 56, 9994); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (45, 57, 9391); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (45, 63, 7047); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (45, 89, 770); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (46, 96, 7126); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (47, 6, 81); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (47, 48, 847); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (48, 20, 8953); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (49, 100, 7367); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (50, 24, 870); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (50, 54, 2381); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (50, 90, 7391); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (51, 21, 8045); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (51, 25, 1891); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (52, 34, 6989); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (52, 58, 8468);
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (52, 72, 7427); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (52, 79, 5340); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (53, 89, 9863); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (54, 57, 9630); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (55, 95, 6857); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (56, 27, 35); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (56, 41, 8963); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (56, 55, 963); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (56, 56, 9080); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (56, 81, 1009); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (57, 66, 9948); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (58, 8, 1933); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (59, 13, 1125); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (59, 15, 5349); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (59, 29, 439); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (59, 48, 8240); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (59, 86, 1274); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (60, 2, 8447); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (60, 4, 7651); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (60, 71, 1609); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (61, 9, 2145); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (61, 20, 1918);
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (62, 46, 6714); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (62, 90, 4795); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (63, 57, 3535); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (64, 52, 5066); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (64, 55, 5933); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (65, 66, 9776); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (66, 40, 9731); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (67, 84, 9862); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (67, 90, 2653); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (68, 26, 2429); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (69, 27, 1283); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (69, 31, 2034); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (70, 55, 619); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (71, 7, 3863); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (71, 31, 6472); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (71, 46, 3804); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (71, 83, 5313); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (72, 30, 7485); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (72, 49, 1794); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (73, 34, 8964); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (74, 2, 2274); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (75, 5, 5904);
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (75, 62, 7202); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (75, 74, 1243); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (76, 49, 4799); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (77, 92, 2320); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (78, 79, 6021); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (79, 24, 5665); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (80, 24, 9449); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (80, 31, 9756); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (80, 37, 3061); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (80, 38, 5266); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (80, 42, 1961); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (81, 6, 4925); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (81, 53, 1672); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (81, 61, 2141); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (81, 95, 9546); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (82, 27, 7626); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (82, 40, 7304); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (83, 73, 6288); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (84, 30, 560); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (85, 41, 89); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (85, 42, 6783); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (85, 52, 400);
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (86, 9, 8931); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (86, 11, 2526); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (87, 4, 2245); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (87, 7, 1643); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (87, 28, 7081); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (87, 55, 8857); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (88, 69, 7470); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (89, 7, 7175); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (89, 8, 2349); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (89, 31, 6873); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (89, 54, 4971); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (90, 18, 1452); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (90, 25, 2794); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (91, 61, 5182); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (91, 67, 4140); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (91, 70, 5208); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (92, 8, 2886); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (92, 43, 4630); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (92, 80, 9638); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (93, 18, 854); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (94, 18, 8146); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (94, 43, 5197);
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (94, 71, 8996); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (95, 16, 6396); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (95, 18, 6480); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (95, 35, 1679); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (95, 95, 6609); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (95, 100, 7278); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (96, 93, 1999); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (97, 28, 6046); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (98, 53, 9715); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (98, 98, 2065); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (99, 25, 144); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (100, 32, 7966); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (100, 48, 879); 
INSERT INTO `OrdersContent` (`orders_id`, `product_id`, `quantity`) VALUES (100, 54, 8145); 


delimiter $$
create function cartTotal (customer_id varchar(28)) 
	returns int
    deterministic
	begin
	declare tot integer;
		select sum(P.MRP*C.quantity) into tot
		from product P inner join cart C
		on C.product_id=P.product_id
     where C.customer_id=customer_id;
	return tot;
end$$

create function orderTotal (orders_id int) 
	returns bigint
    deterministic
	begin
	declare tot bigint;
		select sum(P.MRP*C.quantity) into tot
		from product P inner join ordersContent C
		on C.product_id=P.product_id where C.orders_id=orders_id;
	return tot;
end$$
delimiter ;

create view cartTotal as select P.customer_id as Username, P.Name, cartTotal(P.customer_id) as CartTotal
from customer P;

create view orderTotal as select P.customer_id as Username, P.Name, O.orders_id as OrderNumber, orderTotal(O.orders_id) as PriceBeforeDiscount
from customer P inner join orders O
on O.customer_id=P.customer_id;

create view orderDiscount as select V.Username,V.Name,V.OrderNumber,V.PriceBeforeDiscount,D.discount_id as DiscountCode,
V.PriceBeforeDiscount-(IF(V.PriceBeforeDiscount>=D.minPrice,1,0)*V.PriceBeforeDiscount*D.percentageOff*0.01) as PriceAfter
from orderTotal V inner join discount D inner join orders O
on O.discount_id=D.discount_ID and O.orders_id=V.OrderNumber;


-- triggers
create trigger quantityUpdate
after insert 
on cart
for each row
update product set quantity = quantity - new.quantity where product_id = new.product_id;
   
create trigger addDeliveryPartner
after insert
on orders
for each row
update orders set orders.delivery_id = (select delivery_id from delivery order by rand() limit 1);

create trigger addTimeStamp
after insert
on orders
for each row
update orders set orders.timeStamp=systimestamp;

create trigger addDiscount
after insert
on orders
for each row
update orders set orders.discount_id= (select discount_id from discount order by rand() limit 1); -- it is not a bug it is a feature

-- grants
grant all on dbms.admin to 'root'@'localhost';

grant select on dbms.customer to 'root'@'localhost';
grant insert on dbms.customer to 'root'@'localhost';
grant update on dbms.customer to 'root'@'localhost';

grant all on dbms.supplier to 'root'@'localhost';

grant all on dbms.delivery to 'root'@'localhost';

-- views

create view adminview as select A.admin_id,A.name,A.email,A.phonenumber from admin A;

create view supplierview as select S.supplier_id,S.name,S.phonenumber,S.email,V.sum as NumberOfItemsProvided from supplier S inner join
(select count(P.product_id) as sum, S1.supplier_id from Product P inner join Supplier S1 on S1.supplier_id=P.supplier_id group by supplier_id) as V on S.supplier_id=V.supplier_id;

create view customerview as select C.customer_id, C.address, C.Name, C.Email, C.PhoneNumber, V.cartTotal  from Customer C inner join carttotal V on C.customer_id=V.username;

create view deliveryview as select D.delivery_id, D.name, D.phonenumber, V.NumberOfOrders 
from Delivery D inner join (select D1.delivery_id,count(O.orders_id) as numberoforders from Orders O inner join Delivery D1 on D1.delivery_id=O.delivery_id group by delivery_id) as V on V.delivery_id=D.delivery_id;

-- index 
create index BeforePrice on Product(MRP asc);
create index lowestPrice on Discount(minPrice asc);

create index qtyindex on product(quantity asc);

create index offindex on Discount(percentageOff asc);

create index categorySort on Product(ProductCategory asc);

create index Psupplier on Product(supplier_id ASC);
create index Sid on Supplier(supplier_id ASC);