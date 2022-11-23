-- STATUS_ACC
insert into status_acc values (1,"Bình thường");
insert into status_acc values (2,"Tạm khóa");
insert into status_acc values (3,"Khóa vĩnh viễn");

-- CITY

INSERT INTO city(name_city, transport) VALUES("HỒ CHÍ MINH", 10000);
INSERT INTO city(name_city, transport) VALUES("HÀ NỘI", 30000);
INSERT INTO city(name_city, transport) VALUES("ĐÀ NẴNG", 20000);

-- ACCOUNT_CUSTOMER
INSERT INTO account_customer(username, pass, id_status_acc, id_city, fullname, sex, email_customer, phone_customer, address)
VALUES("nguyenphutai840@gmail.com", "123", 1, 1, "Nguyễn Phú Tài", "Nam", "nguyenphutai840@gmail.com", "0353677271",
"Di Linh, Lâm Đồng");
INSERT INTO account_customer(username, pass, id_status_acc, id_city, fullname, sex, email_customer, phone_customer, address)
VALUES("tranminhtuyen0908@gmail.com", "123", 1, 1, "Trần Minh Tuyên", "Nam", "tranminhtuyen0908@gmail.com", "0353677272",
"Nam Định");
INSERT INTO account_customer(username, pass, id_status_acc, id_city, fullname, sex, email_customer, phone_customer, address)
VALUES("nguyentandat@gmail.com", "123", 1, 1, "Nguyễn Tấn Đạt", "Nam", "nguyentandat@gmail.com", "0353677273",
"Bến Tre");

-- ROLE_ADMIN
insert into role_admin values (1,"root");
insert into role_admin values (2,"member");

-- ACCOUNT_ADMIN
insert into account_admin (username,id_role_admin,id_status_acc,passwordAD) values ("tuyen",1,1,"20130459");
insert into account_admin (username,id_role_admin,id_status_acc,passwordAD) values ("tai",2,1,"20130390");
insert into account_admin (username,id_role_admin,id_status_acc,passwordAD) values ("dat",2,1,"20130221");

-- UPDATE TABLE ACCOUNT_ADMIN
UPDATE account_admin
SET fullname = "Trần Minh Tuyên"
where username ="tuyen";


UPDATE account_admin
SET fullname = "Nguyễn Phú Tài"
where username ="tai";


UPDATE account_admin
SET fullname = "Nguyễn Tấn Đạt"
where username ="dat";
-------------------------------------------

-- STATUS PRODUCT
INSERT INTO status_product VALUES (1, 'Mới');
INSERT INTO status_product VALUES (2, 'Hết');
INSERT INTO status_product VALUES (3, 'Còn');

-- TYPE PRODUCT
INSERT INTO type_product VALUES (0,'Acid');
INSERT INTO type_product VALUES (0, 'Bazo');
INSERT INTO type_product VALUES (0, 'Muối');

-- SUPPLIERS
INSERT INTO suppliers VALUES (0, 'suppliers 1');
INSERT INTO suppliers VALUES (0, 'suppliers 2');
INSERT INTO suppliers VALUES (0, 'suppliers 3');

-- PRODUCTS
INSERT INTO products VALUES (0, 1, 1, 1, 'Acid Sulfuric 95%', 'Axit Sunfuric hay còn gọi H2S04 là một chất hóa học được mệnh danh là “ vua” của các loại hóa chất. Nó đóng vai trò chủ chốt cho sự tồn tại và phát triển của ngành công nghiệp hiện nay.', '../images/hoa_chat/acid_bazo/acid_huu_co/550x750/acid-huu-co-1.jpg', 100, 'Mỹ', null, 4);
INSERT INTO products VALUES (0, 1, 1, 1, 'Acid Sulfuric 95%', 'Axit Sunfuric hay còn gọi H2S04 là một chất hóa học được mệnh danh là “ vua” của các loại hóa chất. Nó đóng vai trò chủ chốt cho sự tồn tại và phát triển của ngành công nghiệp hiện nay.', '../images/hoa_chat/acid_bazo/acid_huu_co/550x750/acid-huu-co-1.jpg', 100, 'Mỹ', null, 4);
INSERT INTO products VALUES (0, 1, 1, 1, 'Acid Sulfuric 95%', 'Axit Sunfuric hay còn gọi H2S04 là một chất hóa học được mệnh danh là “ vua” của các loại hóa chất. Nó đóng vai trò chủ chốt cho sự tồn tại và phát triển của ngành công nghiệp hiện nay.', '../images/hoa_chat/acid_bazo/acid_huu_co/550x750/acid-huu-co-1.jpg', 100, 'Mỹ', null, 4);
INSERT INTO products VALUES (0, 1, 1, 1, 'Acid Sulfuric 95%', 'Axit Sunfuric hay còn gọi H2S04 là một chất hóa học được mệnh danh là “ vua” của các loại hóa chất. Nó đóng vai trò chủ chốt cho sự tồn tại và phát triển của ngành công nghiệp hiện nay.', '../images/hoa_chat/acid_bazo/acid_huu_co/550x750/acid-huu-co-1.jpg', 100, 'Mỹ', null, 4);
INSERT INTO products VALUES (0, 1, 1, 1, 'Acid Sulfuric 95%', 'Axit Sunfuric hay còn gọi H2S04 là một chất hóa học được mệnh danh là “ vua” của các loại hóa chất. Nó đóng vai trò chủ chốt cho sự tồn tại và phát triển của ngành công nghiệp hiện nay.', '../images/hoa_chat/acid_bazo/acid_huu_co/550x750/acid-huu-co-1.jpg', 100, 'Mỹ', null, 4);
INSERT INTO products VALUES (0, 1, 1, 1, 'Acid Sulfuric 95%', 'Axit Sunfuric hay còn gọi H2S04 là một chất hóa học được mệnh danh là “ vua” của các loại hóa chất. Nó đóng vai trò chủ chốt cho sự tồn tại và phát triển của ngành công nghiệp hiện nay.', '../images/hoa_chat/acid_bazo/acid_huu_co/550x750/acid-huu-co-1.jpg', 100, 'Mỹ', null, 4);
INSERT INTO products VALUES (0, 1, 1, 1, 'Acid Sulfuric 95%', 'Axit Sunfuric hay còn gọi H2S04 là một chất hóa học được mệnh danh là “ vua” của các loại hóa chất. Nó đóng vai trò chủ chốt cho sự tồn tại và phát triển của ngành công nghiệp hiện nay.', '../images/hoa_chat/acid_bazo/acid_huu_co/550x750/acid-huu-co-1.jpg', 100, 'Mỹ', null, 4);
INSERT INTO products VALUES (0, 1, 1, 1, 'Acid Sulfuric 95%', 'Axit Sunfuric hay còn gọi H2S04 là một chất hóa học được mệnh danh là “ vua” của các loại hóa chất. Nó đóng vai trò chủ chốt cho sự tồn tại và phát triển của ngành công nghiệp hiện nay.', '../images/hoa_chat/acid_bazo/acid_huu_co/550x750/acid-huu-co-1.jpg', 100, 'Mỹ', null, 4);
INSERT INTO products VALUES (0, 1, 1, 1, 'Acid Sulfuric 95%', 'Axit Sunfuric hay còn gọi H2S04 là một chất hóa học được mệnh danh là “ vua” của các loại hóa chất. Nó đóng vai trò chủ chốt cho sự tồn tại và phát triển của ngành công nghiệp hiện nay.', '../images/hoa_chat/acid_bazo/acid_huu_co/550x750/acid-huu-co-1.jpg', 100, 'Mỹ', null, 4);

-- PRICE PRODUCT
INSERT INTO price_product VALUES (2, '2022-12-15', 12000000, 14000000);
INSERT INTO price_product VALUES (3, '2022-12-15', 12000000, 14000000);
INSERT INTO price_product VALUES (4, '2022-12-15', 12000000, 14000000);
INSERT INTO price_product VALUES (5, '2022-12-15', 12000000, 14000000);
INSERT INTO price_product VALUES (6, '2022-12-15', 12000000, 14000000);
INSERT INTO price_product VALUES (7, '2022-12-15', 12000000, 14000000);
INSERT INTO price_product VALUES (8, '2022-12-15', 12000000, 14000000);
INSERT INTO price_product VALUES (9, '2022-12-15', 12000000, 14000000);
INSERT INTO price_product VALUES (10, '2022-12-15', 12000000, 14000000);
