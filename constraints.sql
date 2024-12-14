use ecommerce;
# Add foreign key to tables
ALTER TABLE shops
ADD FOREIGN KEY (shopOwner) REFERENCES users(userID);

ALTER TABLE voucherStorage
ADD FOREIGN KEY (userID) REFERENCES users(userID),
ADD FOREIGN KEY (voucherID) REFERENCES vouchers(voucherID);

ALTER TABLE vouchers
ADD FOREIGN KEY (shopID) REFERENCES shops(shopID),
ADD FOREIGN KEY (productLineID) REFERENCES productLines(productLineID);

ALTER TABLE payments
ADD FOREIGN KEY (voucherID) REFERENCES vouchers(voucherID),
ADD FOREIGN KEY (paymentMethodID) REFERENCES paymentMethods(paymentMethodID),
ADD FOREIGN KEY (orderID) REFERENCES orders(orderID);

ALTER TABLE orders
ADD FOREIGN KEY (shippingUnitID) REFERENCES ShippingUnits(shippingUnitID),
ADD FOREIGN KEY (userID) REFERENCES users(userID);

ALTER TABLE orderDetails
ADD FOREIGN KEY (orderID) REFERENCES orders(orderID),
ADD FOREIGN KEY (productID) REFERENCES products(productID);

ALTER TABLE products
ADD FOREIGN KEY (productLineID) REFERENCES productLines(productLineID),
ADD FOREIGN KEY (shopID) REFERENCES shops(shopID);

ALTER TABLE itemsInCarts
ADD FOREIGN KEY (userID) REFERENCES users(userID),
ADD FOREIGN KEY (productID) REFERENCES products(productID);

ALTER TABLE userPenalty
ADD FOREIGN KEY (userID) REFERENCES users(userID);

ALTER TABLE shopPenalty
ADD FOREIGN KEY (shopID) REFERENCES shops(shopID);

# Add default constraint to tables
ALTER TABLE payments
ALTER COLUMN paymentStatus SET DEFAULT 'Pending';

ALTER TABLE userPenalty
ALTER COLUMN isResolved SET DEFAULT 'Pending';

ALTER TABLE shopPenalty
ALTER COLUMN isResolved SET DEFAULT 'Pending';

ALTER TABLE orderDetails
ALTER COLUMN orderStatus SET DEFAULT 'Processing';

# Add INDEX constraint to tables
ALTER TABLE products
ADD INDEX idx_productID (productID);

ALTER TABLE productLines
ADD INDEX idx_productLineID (productLineID);

ALTER TABLE shippingUnits
ADD INDEX idx_shippingUnitID (shippingUnitID);

ALTER TABLE vouchers
ADD INDEX idx_voucherID (voucherID);

ALTER TABLE users
ADD INDEX idx_userID (userID);

# Add check constraint
ALTER TABLE shops
ADD CHECK (ratings >= 0 AND ratings <= 5);

ALTER TABLE vouchers
ADD CHECK (salesOff > 0 AND salesOff <= 100);