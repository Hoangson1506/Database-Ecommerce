CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS shops;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS productlines;
DROP TABLE IF EXISTS itemsincarts; 
DROP TABLE IF EXISTS vouchers;
DROP TABLE IF EXISTS voucherstorages;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS orderdetails;
DROP TABLE IF EXISTS shippingunits;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS paymentmethods;
DROP TABLE IF EXISTS userpenalty;
DROP TABLE IF EXISTS shoppenaly;

CREATE TABLE paymentMethods (
  paymentMethodID INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  details TEXT NOT NULL,
  methodStatus ENUM('Active', 'Inactive') NOT NULL,
  PRIMARY KEY (paymentMethodID)
);

CREATE TABLE shippingUnits (
  shippingUnitID INT NOT NULL AUTO_INCREMENT,
  registeredCity VARCHAR(50) NOT NULL,
  registeredDistrict VARCHAR(50) NOT NULL,
  name VARCHAR(100) NOT NULL,
  contactNumber VARCHAR(50) NOT NULL,
  PRIMARY KEY (shippingUnitID)
);

CREATE TABLE users (
  userID INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone CHAR(10) NOT NULL,
  firstName VARCHAR(50) NOT NULL,
  lastName VARCHAR(50) NOT NULL,
  gender ENUM('Male', 'Female') NOT NULL,
  dateOfBirth DATE NOT NULL,
  isActive ENUM('Yes', 'No') NOT NULL,
  city VARCHAR(50) NOT NULL,
  district VARCHAR(50) NOT NULL,
  PRIMARY KEY (userID)
);

CREATE TABLE shops (
  shopID INT NOT NULL AUTO_INCREMENT,
  shopName VARCHAR(100) NOT NULL,
  numberOfFollowers INT NOT NULL,
  ratings DECIMAL(2, 1) NOT NULL,
  openSince DATE NOT NULL,
  shopOwner INT NOT NULL,
  taxRate DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (shopID)
);

CREATE TABLE productLines (
  productLineID INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  PRIMARY KEY (productLineID)
);

CREATE TABLE products (
  productID INT NOT NULL AUTO_INCREMENT,
  productName VARCHAR(70) NOT NULL,
  productLineID INT NOT NULL,
  quantityInStock SMALLINT NOT NULL,
  sellPrice DECIMAL(15,2) NOT NULL,
  shopID INT NOT NULL,
  PRIMARY KEY (productID)
);

CREATE TABLE orders (
  orderID INT NOT NULL AUTO_INCREMENT,
  userID INT NOT NULL,
  orderDate DATE NOT NULL,
  shippingUnitID INT NOT NULL,
  PRIMARY KEY (orderID)
);

CREATE TABLE vouchers (
  voucherID INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  salesOff INT NOT NULL,
  shopID INT,
  productLineID INT,
  minimumOrderValue DECIMAL(15,2) NOT NULL,
  maximumDiscount DECIMAL(15,2) NOT NULL,
  PRIMARY KEY (voucherID)
);

CREATE TABLE payments (
  paymentID INT NOT NULL AUTO_INCREMENT,
  orderID INT NOT NULL,
  amount DECIMAL(15,2) NOT NULL,
  paymentDate DATE,
  expireDate DATE NOT NULL,
  paymentMethodID INT NOT NULL,
  paymentStatus ENUM('Pending', 'Completed', 'Refunded', 'Cancelled') NOT NULL,
  voucherID INT,
  PRIMARY KEY (paymentID)
);

CREATE TABLE shopPenalty (
  penaltyID INT NOT NULL AUTO_INCREMENT,
  shopID INT NOT NULL,
  reason VARCHAR(50) NOT NULL,
  details TEXT NOT NULL,
  issuedDate DATE NOT NULL,
  resolvedDate DATE,
  isResolved ENUM('Resolved', 'Pending') NOT NULL,
  PRIMARY KEY (penaltyID)
);

CREATE TABLE userPenalty (
  penaltyID INT NOT NULL AUTO_INCREMENT,
  userID INT NOT NULL,
  reason VARCHAR(50) NOT NULL,
  details TEXT NOT NULL,
  issuedDate DATE NOT NULL,
  resolvedDate DATE,
  isResolved ENUM('Resolved', 'Pending') NOT NULL,
  PRIMARY KEY (penaltyID)
);

CREATE TABLE orderDetails (
  orderID INT NOT NULL,
  productID INT NOT NULL,
  orderStatus VARCHAR(15) NOT NULL,
  quantity SMALLINT NOT NULL,
  shippedDate DATE,
  deadline DATE NOT NULL,
  PRIMARY KEY (orderID, productID)
);

CREATE TABLE itemsInCarts (
  userID INT NOT NULL,
  productID INT NOT NULL,
  quantity SMALLINT NOT NULL,
  isAvailable ENUM('Yes', 'No') NOT NULL,
  PRIMARY KEY (userID, productID)
);

CREATE TABLE voucherStorage (
	voucherID INT NOT NULL,
    userID INT NOT NULL,
    quantity SMALLINT NOT NULL,
	acquiredDate DATE NOT NULL,
    expireDate DATE NOT NULL,
    PRIMARY KEY (voucherID, userID)
);