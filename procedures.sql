USE ecommerce;

# Function to check valid use of voucher 
DELIMITER //
CREATE FUNCTION is_valid_voucher(voucherID INT, paymentID INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
	-- Declare the applied orderID, product line, and shop
    DECLARE applied_orderID INT DEFAULT NULL;
    DECLARE applied_productLineID INT DEFAULT NULL;
    DECLARE applied_shopID INT DEFAULT NULL;

    -- Store the orderID associated with the paymentID
    SELECT orderID INTO applied_orderID
    FROM payments
    WHERE payments.paymentID = paymentID;

    -- Store productLineID and shopID associated with the voucherID
    SELECT productLineID, shopID
    INTO applied_productLineID, applied_shopID
    FROM vouchers
    WHERE vouchers.voucherID = voucherID;
    
    RETURN EXISTS (
		SELECT 1
		FROM orderDetails od
		JOIN products p ON od.productID = p.productID
		WHERE od.orderID = applied_orderID
		AND (applied_productLineID IS NULL OR p.productLineID = applied_productLineID)
		AND (applied_shopID IS NULL OR p.shopID = applied_shopID)
	);
END;
//
DELIMITER ;

# Function to find the user who have a payment
DELIMITER //
CREATE FUNCTION payments_user(paymentID INT)
RETURNS INT
DETERMINISTIC
BEGIN
	-- declare variable
    DECLARE userID INT DEFAULT NULL;
    DECLARE orderID INT DEFAULT NULL;
    
    -- store orderID into applied_orderID
    SELECT payments.orderID INTO orderID
    FROM payments
    WHERE payments.paymentID = paymentID;
    
    IF orderID IS NULL THEN
        RETURN NULL;
    END IF;
    
    -- store userID into applied_userID
    SELECT payments.userID INTO userID
    FROM orders
    WHERE orders.orderID = orderID;
    
    IF userID IS NULL THEN
        RETURN NULL;
    END IF;
    
    RETURN userID;
END;
//
DELIMITER ;

# Function to check whether the user has the voucher or not
DELIMITER //
CREATE FUNCTION has_voucher(voucherID INT, paymentID INT)
RETURNS BOOLEAN
READS SQL DATA
BEGIN
	-- declare variable
    DECLARE applied_userID INT;
    SET applied_userID = payments_user(paymentID);
    
    IF applied_userID IS NULL THEN
        RETURN FALSE;
    END IF;
    
    RETURN EXISTS (
		SELECT 1
        FROM voucherStorage
        WHERE userID = applied_userID
        AND voucherStorage.voucherID = voucherID
        AND quantity > 0
        LIMIT 1
	);
END;
//
DELIMITER ;
    
# Procedure for applying voucher in payments
DELIMITER //
CREATE PROCEDURE applyVoucher(IN applied_voucherID INT, IN applied_paymentID INT)
BEGIN
    -- Declare variables
    DECLARE applied_userID INT;
    DECLARE salesOffValue INT;
    DECLARE paymentAmount INT;
    DECLARE maximumDiscount INT;
    DECLARE minimumOrderValue INT;

    -- Start the transaction to apply the voucher
    START TRANSACTION;

    -- Check if the voucher is valid
    IF NOT is_valid_voucher(applied_voucherID, applied_paymentID) THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid voucher, try another voucher!';
    END IF;

    -- Check if the user has the voucher
    IF NOT has_voucher(applied_voucherID, applied_paymentID) THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The user does not have the voucher, try another voucher!';
    END IF;

    -- Retrieve the userID for the payment
    SET applied_userID = payments_user(applied_paymentID);
    -- If no userID found, exit the procedure
    IF applied_userID IS NULL THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User not found for this payment';
    END IF;

    -- Retrieve the payment amount
    SELECT amount INTO paymentAmount
    FROM payments
    WHERE paymentID = applied_paymentID;

    -- Retrieve voucher details
    SELECT (salesOff / 100) * paymentAmount, vouchers.maximumDiscount, vouchers.minimumOrderValue
    INTO salesOffValue, maximumDiscount, minimumOrderValue
    FROM vouchers
    WHERE voucherID = applied_voucherID;

    -- Ensure the salesOffValue does not exceed the maximumDiscount
    SET salesOffValue = CASE 
        WHEN salesOffValue > maximumDiscount THEN maximumDiscount
        ELSE salesOffValue
    END;

    -- Raise error if paymentAmount is less than the minimumOrderValue
    IF paymentAmount < minimumOrderValue THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid payment amount to apply voucher, try another voucher!';
    END IF;

    -- Update the payment with the applied voucher and salesOffValue
    UPDATE payments
    SET voucherID = applied_voucherID,
        amount = amount - salesOffValue
    WHERE paymentID = applied_paymentID;

    -- Update the voucher storage to decrease quantity
    UPDATE voucherStorage 
    SET quantity = quantity - 1
    WHERE voucherID = applied_voucherID
    AND userID = applied_userID;

    -- Commit the transaction
    COMMIT;
END;
//
DELIMITER ;

    
    
    
		










