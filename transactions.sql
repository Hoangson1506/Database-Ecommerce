use ecommerce;

# A new user's gift voucher 
START TRANSACTION;
-- insert new customer
INSERT INTO users(username, email, phone, firstName, lastName, gender, dateOfBirth, isActive, city, district) VALUES
('hoangsonbandon', 'hs.hoangson15062005@gmail.com', '0389261245', 'Hoang', 'Son', 'Male', '2005-6-15', 'Yes', 'Hanoi', 'Hadong');
-- insert voucher for new user if not exist
INSERT INTO vouchers(name, salesOff, shopID, productLineID, minimumOrderValue, maximumDiscount) 
SELECT 'New Comer Voucher', 50, NULL, NULL, 100000.00, 1000000.00
WHERE NOT EXISTS (
	SELECT 1 FROM vouchers WHERE name = 'New Comer Voucher'
);
-- insert user's voucher to voucherStorage
INSERT INTO voucherStorage(voucherID, userID, quantity, acquiredDate, expireDate)
SELECT v.voucherID, u.userID, 10, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 30 DAY)
FROM vouchers v
JOIN users u ON u.username = 'hoangsonbandon'
WHERE v.name = 'New Comer Voucher';
ROLLBACK;
