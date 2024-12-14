#insert users
use ecommerce;
INSERT INTO 
users (userName, email, phone, firstName, lastName, gender, dateOfBirth, isActive, city, district)
VALUES 
('minhtuuse', 'kjffic@gmail.com', '0964818150', 'Minh Tu', 'Pham', 'Male', '2001-09-11', 'Yes', 'Bac Ninh', 'Bac Ninh'),
('nctrinh', 'nctrinh@gmail.com', '0908266451', 'Cong Trinh', 'Nguyen', 'Male', '1975-04-30', 'Yes', 'Nam Dinh', 'Hai Hau'),
('T1 Asura', 'vinhvatvo@gmail.com', '0954521398', 'Cong Vinh', 'Nguyen', 'Male', '1991-12-26', 'Yes', 'Quang Binh', 'Dong Hoi'),
('sleppifox', 'foxiii@gmail.com', '0945910951', 'Minh Quan', 'Nguyen', 'Male', '1989-09-01', 'Yes', 'Hung Yen', 'Khoai Chau'),
('noccbao', 'ngocbaoi@gmail.com', '0942949798', 'Bao Ngoc', 'Nguyen', 'Female', '1995-09-02', 'Yes', 'Ho Chi Minh', 'Thu Duc'),
('atiso hibiscus', 'chingchong@gmail.com', '0912585794', 'Thi Viet Trinh', 'Dao', 'Female', '1997-11-07', 'Yes', 'Bac Giang', 'Hiep Hoa'),
('阮英书', 'nguyenthu20@gmail.com', '0985230862', 'Anh Thu', 'Nguyen', 'Female', '2003-10-04', 'Yes', 'Nghe An', 'Vinh'),
('upu', 'uyenphuong@gmail.com', '0947952031', 'Phuong Uyen', 'Do', 'Female', '1969-07-28', 'Yes', 'Ca Mau', 'Cai Nuoc'),
('exofanno1', 'hongthu@gmail.com', '098673509', 'Thi Hong Thu', 'Nguyen', 'Female', '1998-03-14', 'Yes', 'Ha Giang', 'Ha Giang'),
('hoangsonbandon', 'sonlgoun@gmail.com', '0389271345', 'Son', 'Hoang', 'Male', '1992-05-07', 'Yes', 'Ha Noi', 'Ha Dong');

INSERT INTO
shops (shopName, numberOfFollowers, ratings, openSince, shopOwner,taxRate)
VALUES
('Do Go Cong Trinh', 532, 4.1, '1995-11-07', 2, 0),
('Thu Trang Shop', 2735, 4.5, '2020-01-23', 9, 5),
('DUREX VIETNAM', 5016, 4.6, '2015-07-20', 1, 10),
('Vua Robot', 1058, 4.3, '2017-09-02', 10, 5),
('TTG Shop', 3454, 4.7, '2018-07-22', 3, 8);

INSERT INTO
productlines (name, description)
VALUES
('Noi that', 'San pham noi that trong gia dinh'),
('Noi that go', 'San pham noi that do go trong gia dinh'),
('thoi trang', 'San pham thoi trang cho tat ca moi nguoi'),
('thoi trang nam', 'San pham thoi trang danh cho nam gioi'),
('thoi trang nu', 'San pham thoi trang danh cho nu gioi'),
('thoi trang tre em', 'San pham thoi trang danh cho tre em'),
('San pham ho tro suc khoe', 'San pham ho tro suc khoe nhu thuoc men, khang sinh, thuc pham bo sung'),
('robot', 'San pham cong nghe tu dong ho tro cuoc song moi nguoi'),
('May hut bui', NULL),
('May tinh de ban', NULL),
('May tinh Gaming', NULL);

INSERT INTO
products (productName, productLineID, quantityInStock, sellPrice,shopID)
VALUES
('Ban hoc go', 2, 20, 500000, 1),
('Ghe go', 2, 50, 300000, 1),
('Ban tho tu linh', 2, 5, 25000000, 1),
('Tu bon canh', 2, 10, 2500000, 1),
('Ke tivi', 2, 6, 10000000, 1),
('Nam/ Ao khoac long vu', 4, 200, 699300, 2),
('Ao giu nhiet nu co cao', 5, 400, 199000, 2),
('Nam/ Giay the thao khang khuan', 4, 200, 499000, 2),
('Ao chong nang SunStop UV', 5, 400, 390000, 2),
('Bitis BSB005100XNG', 6, 150, 413000, 2),
('Durex Performa', 7, 2000, 222000, 3),
('Durex Play Strawberry', 7, 5000, 170000, 3),
('Durex Classic', 7, 7000, 169000, 3),
('Durex Kingtex', 7, 5700, 112000, 3),
('Durex Invisible 52mm', 7, 4400, 194400, 3),
('Roborock S8 MaxV Ultra', 9, 33, 22990000, 4),
('JIASHI', 9, 2900, 72000, 4),
('D2-001 Pro', 9, 10, 1935000, 4),
('Roborock Flexi Lite', 9, 38, 5271200, 4),
('EASYR UC11', 9, 302, 1228250, 4),
('PC FASTER GAMING 10400F - RTX 3050 6GB', 11, 21, 9990000, 5),
('PC BEST FOR GAMING i5 10400F - GTX 1660 Super 6GB', 11, 32, 9990000, 5),
('PC CHOI GAME HIEU SUAT CAO RTX 3060 12GB - 12400F', 11, 17, 15208000, 5),
('PC ASUS GAMING PERFORMANCE RTX 4060 - I5 12400F', 11, 9, 15980000, 5),
('PC MAXIMUM GAMING RTX 3070 - 12400F', 11, 4, 18980000, 5);

INSERT INTO
itemsincarts (userID, productID, quantity, isAvailable)
VALUES
(1, 24, 1, 'Yes'),
(1, 1, 1, 'Yes'),
(1, 2, 2, 'Yes'),
(1, 6, 1, 'Yes'),
(1, 8, 1, 'Yes'),
(1, 17, 1, 'Yes'),
(2, 11, 10, 'Yes'),
(2, 13, 10, 'Yes'),
(2, 14, 10, 'Yes'),
(2, 7, 1, 'Yes'),
(2, 9, 1, 'Yes'),
(3, 15, 1, 'Yes'),
(3, 16, 1, 'Yes'),
(3, 12, 1, 'Yes'),
(3, 4, 1, 'Yes'),
(3, 5, 1, 'Yes'),
(3, 6, 2, 'Yes'),
(3, 8, 3, 'Yes'),
(4, 21, 1, 'Yes'),
(4, 11, 2, 'Yes'),
(4, 5, 1, 'Yes'),
(4, 2, 3, 'Yes'),
(5, 4, 1, 'Yes'),
(5, 7, 2, 'Yes'),
(5, 10, 1, 'Yes'),
(6, 9, 1, 'Yes'),
(6, 10 , 2, 'Yes'),
(6, 1, 1, 'Yes'),
(7, 3, 1, 'Yes'),
(7, 4, 1, 'Yes'),
(8, 20, 1, 'Yes'),
(9, 19, 1, 'Yes'),
(9, 4, 1, 'Yes'),
(9, 22, 1, 'Yes'),
(10, 25, 1, 'Yes'),
(10, 1, 1, 'Yes'),
(10, 2, 5, 'Yes'),
(10, 14, 3, 'Yes');

INSERT INTO
vouchers (name, salesOff, shopID, productLineID, minimumOrderValue, maximumDiscount)
VALUES
('30K', 30, 2, 3, 0, 30000),
('40K', 50, 2, 3, 0, 40000),
('PC sieu hoi', 10, 5, 10, 0, 1000000),
('CT500', 15, 1, 1, 1000000, 500000),
('CTMAX', 20, 1, 1, 5000000, 2000000),
('Giam 30k', 100, 3, 7, 0, 30000),
('6 phan tram', 6, 3, 7, 300000, 30000),
('Giam 700K', 100, 4, 8, 5950000, 700000),
('Giam 400K', 100, 4, 8, 6450000, 400000),
('Giam 500K', 100, 5, 10, 1990000, 500000),
('Giam 1Tr', 100, 5, 10, 10000000, 1000000);

INSERT INTO
voucherstorage (voucherID, userID, quantity, acquiredDate, expireDate)
VALUES
(1, 1, 3, '2024-06-06', '2025-06-06'),
(2, 1, 3, '2024-06-06', '2025-06-06'),
(1, 2, 2, '2024-09-15', '2025-09-15'),
(2, 2, 3, '2024-09-15', '2025-09-15'),
(1, 3, 5, '2024-10-03', '2025-10-03'),
(2, 3, 1, '2024-10-03', '2025-10-03'),
(1, 5, 3, '2024-09-11', '2025-09-11'),
(2, 5, 3, '2024-09-11', '2025-09-11'),
(1, 6, 1, '2024-03-20', '2025-03-20'),
(2, 6, 1, '2024-03-20', '2025-03-20'),
(3, 1, 1, '2024-02-10', '2025-02-10'),
(3, 4, 1, '2023-12-21', '2024-12-21'),
(3, 9, 1, '2024-02-04', '2025-02-04'),
(3, 10, 1, '2023-11-29', '2024-11-29'),
(4, 1, 3, '2024-01-27', '2025-01-27'),
(5, 1, 3, '2024-01-27', '2025-01-27'),
(4, 3, 3, '2024-08-01', '2025-08-01'),
(5, 3, 3, '2024-08-01', '2025-08-01'),
(4, 4, 3, '2023-12-05', '2023-12-05'),
(5, 4, 3, '2023-12-05', '2023-12-05'),
(4, 5, 3, '2024-05-20', '2025-05-20'),
(5, 5, 3, '2024-05-20', '2025-05-20'),
(4, 6, 3, '2024-03-10', '2025-03-10'),
(5, 6, 3, '2024-03-10', '2025-03-10'),
(4, 7, 3, '2024-01-01', '2025-01-01'),
(5, 7, 3, '2024-01-01', '2025-01-01'),
(4, 9, 3, '2024-04-30', '2024-04-30'),
(5, 9, 3, '2024-04-30', '2024-04-30'),
(4, 10, 3, '2024-07-10', '2025-07-10'),
(5, 10, 3, '2024-07-10', '2025-07-10'),
(6, 2, 5, '2024-07-24', '2025-07-24'),
(7, 2, 5, '2024-07-24', '2025-07-24'),
(6, 3, 5, '2024-08-11', '2025-08-11'),
(7, 3, 5, '2024-08-11', '2025-08-11'),
(6, 4, 5, '2024-10-02', '2025-10-02'),
(7, 4, 5, '2024-10-02', '2025-10-02'),
(6, 10, 5, '2024-01-30', '2025-01-30'),
(7, 10, 5, '2024-01-30', '2025-01-30'),
(8, 1, 1, '2024-02-18', '2025-02-18'),
(9, 1, 1, '2024-02-18', '2025-02-18'),
(8, 3, 1, '2024-11-02', '2025-11-02'),
(9, 3, 1, '2024-11-02', '2025-11-02'),
(8, 8, 1, '2023-12-18', '2025-12-18'),
(9, 8, 1, '2023-12-18', '2025-12-18'),
(8, 9, 1, '2024-06-09', '2025-06-09'),
(9, 9, 1, '2024-06-09', '2025-06-09'),
(10, 1, 1, '2024-02-10', '2025-02-10'),
(11, 1, 1, '2024-02-10', '2025-02-10'),
(10, 4, 1, '2023-12-21', '2024-12-21'),
(11, 4, 1, '2023-12-21', '2024-12-21'),
(10, 9, 1, '2024-02-04', '2025-02-04'),
(11, 9, 1, '2024-02-04', '2025-02-04'),
(10, 10, 1, '2023-11-29', '2024-11-29'),
(11, 10, 1, '2023-11-29', '2024-11-29');

INSERT INTO
shippingUnits (registeredCity, registeredDistrict, name, contactNumber)
VALUES
('Ha Noi', 'Cau Giay', 'HNExpress', '0964780351'),
('Da Nang', 'Hai Chau', 'DNExpress', '0964302870'),
('Ho Chi Minh', 'Thu Duc', 'HCMExpress', '0943848789'); 

INSERT INTO
orders (userID, orderDate, shippingUnitID)
VALUES
(1, '2024-05-07', 1),
(1, '2024-07-20', 1),
(2, '2024-08-13', 1),
(3, '2024-10-10', 2),
(3, '2024-10-17', 2),
(3, '2024-11-11', 2),
(5, '2024-12-01', 3),
(6, '2024-10-10', 1),
(7, '2024-09-23', 2),
(7, '2024-08-02', 2),
(8, '2024-11-03', 3),
(9, '2024-10-27', 1),
(10, '2024-10-15', 1),
(10, '2024-11-02', 1); 

INSERT INTO
orderDetails (orderID, productID, orderStatus, quantity, shippedDate, deadLine)
VALUES
(1, 4, 'Shipped', 1, '2024-05-10', '2024-05-11'),
(1, 10, 'Shipped', 1, '2024-05-10', '2024-05-11'),
(2, 5, 'Shipped', 1, '2024-07-23', '2024-07-23'),
(3, 12, 'Shipped', 5, '2024-08-15', '2024-08-17'),
(4, 11, 'Shipped', 3, '2024-10-12', '2024-10-15'),
(4, 15, 'Shipped', 2, '2024-10-12', '2024-10-15'),
(5, 1, 'Shipped', 1, '2024-10-19', '2024-10-21'),
(6, 2, 'Shipped', 2, '2024-11-15', '2024-11-16'),
(7, 14, 'In Process', 4, null, '2024-12-06'),
(8, 25, 'Shipped', 1, '2024-10-14', '2024-10-16'),
(8, 5, 'Shipped', 1, '2024-10-14', '2024-10-16'),
(9, 4, 'Shipped', 1, '2024-09-25', '2024-09-27'),
(9, 7, 'Shipped', 1, '2024-09-25', '2024-09-27'),
(9, 9, 'Shipped', 1, '2024-09-25', '2024-09-27'),
(10, 15, 'Shipped', 3, '2024-08-05', '2024-08-07'),
(11, 18, 'Shipped', 2, '2024-11-06', '2024-11-08'),
(12, 16, 'Shipped', 2, '2024-11-01', '2024-11-02'),
(13, 14, 'Shipped', 5, '2024-10-17', '2024-10-19'),
(14, 13, 'Shipped', 2, '2024-11-05', '2024-11-06'),
(14, 11, 'Shipped', 3, '2024-11-05', '2024-11-06');

INSERT INTO
paymentMethods (name, details, methodStatus)
VALUES
('Tra tien mat', 'Tra tien khi nhan hang', 'Active'),
('banking', 'Tra tien qua ngan hang', 'Active'),
('pay Later', 'Tra trong vong 1 thang sau khi dat don', 'Active'),
('Tra gop', 'Tra gop trong vong 3 thang', 'Inactive'),
('Tra bang tien ao', 'Thanh toan bang tien ao', 'Inactive');

INSERT INTO
payments (orderID, amount, paymentDate, expireDate, paymentMethodID, paymentStatus, voucherID)
VALUES
(1, 2538000, '2024-05-10', '2024-05-27', 1, 'Completed', 4),
(2, 8000000, '2024-07-20', '2024-07-27', 2, 'Completed', 5),
(3, 850000, '2024-08-13', '2024-08-20', 2, 'Completed', null),
(4, 1024800, '2024-10-25', '2024-11-10', 3, 'Completed', 6),
(5, 500000, '2024-10-19', '2024-11-07', 1, 'Completed', null),
(6, 600000, null, '2024-12-11', 3, 'Pending', null),
(7, 448000, null, '2025-01-01', 3, 'Pending', null),
(8, 27980000, '2024-10-10', '2024-10-17', 2, 'Completed', 11),
(9, 2714000, '2024-09-25', '2024-10-13', 1, 'Completed', 4),
(10, 583200, '2024-08-27', '2024-09-02', 3, 'Completed', null),
(11, 3870000, '2024-11-06', '2024-11-23', 1, 'Completed', null),
(12, 45280000, '2024-10-28', '2024-11-4', 2, 'Completed', 8),
(13, 560000, '2024-10-15', '2024-10-22', 2, 'Completed', null),
(14, 974000, null, '2024-12-02', 3, 'Pending', 7);

INSERT INTO
userPenalty (userID, reason, details, issuedDate, resolvedDate, isResolved)
VALUES
(2, 'mua hang cam', 'Mua qua nhieu hang tu DUREX', '2024-12-01', null, 'Pending'),
(4, 'lam dung giao tiep van ban', 'Quay roi nhan vien cham soc khach hang', '2024-11-09', null, 'Pending'),
(10, 'bomb review', 'nhan tien de tan cong review shop doi thu', '2024-01-24', '2024-03-12', 'Resolved'),
(3, 'bomb review', 'to chuc tan cong review shop doi thu', '2024-01-24', '2024-03-12', 'Resolved');

INSERT INTO
shopPenalty (shopID, reason, details, issuedDate, resolvedDate, isResolved)
VALUES
(5, 'bomb review', 'thue nguoi tan cong review shop doi thu', '2024-01-24', '2024-03-12', 'Resolved'),
(3, 'ban hang cam', 'ban DUREX', '2024-12-03', null, 'Pending');