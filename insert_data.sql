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
