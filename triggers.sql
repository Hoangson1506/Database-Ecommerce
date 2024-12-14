use ecommerce;

# Trigger for itemsInCarts whenever a customer add product to their cart to check whether the quantity is available
DELIMITER //
CREATE TRIGGER check_product_stock
BEFORE INSERT ON itemsInCarts
FOR EACH ROW
BEGIN
	-- Declare new variable to store available stock
	DECLARE available_stock INT;
    
    -- Store the quantity in stock to variable available_stock
    SELECT quantityInStock INTO available_stock
    FROM products
    WHERE productID = NEW.productID;
    
    -- If no product found (i.e., available_stock is NULL), raise an error
    IF available_stock IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Product not found';
    -- Conditional statement to check the quantity added to cart is valid
    ELSEIF NEW.quantity > available_stock THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient quantity for product';
    END IF;
END;
//
DELIMITER ;

# Trigger for products whenever an update to the products is apply, this trigger used to check availability of itemsInCarts
DELIMITER //
CREATE TRIGGER check_items_in_carts
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
	-- compare the new quantity in stock of products with quantity in cart to check availability
    IF OLD.quantityInStock <> NEW.quantityInStock THEN
        UPDATE itemsInCarts
        SET isAvailable = 
            CASE
                WHEN quantity > NEW.quantityInStock THEN 'No'
                ELSE 'Yes'
            END
        WHERE productID = NEW.productID;
    END IF;
END;
//
DELIMITER ;

# Trigger before an orderDetail is created to check valid quantity ordered
DELIMITER //
CREATE TRIGGER check_valid_order
BEFORE INSERT ON orderDetails
FOR EACH ROW
BEGIN 
	-- create new variable to store quantityInStock
    DECLARE available_stock INT;
    
    -- store the quantityInStock of the product added to orderDetails to available_stock
    SELECT quantityInStock INTO available_stock
    FROM products
    WHERE productID = NEW.productID;
    
    -- If no product found, raise an error
    IF available_stock IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Product not found';
    -- Check if the ordered quantity exceeds available stock
    ELSEIF NEW.quantity > available_stock THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid order: Ordered quantity exceeds available stock';
    END IF;

END;
//
DELIMITER ;

# Trigger after an orderDetail is inserted to update the quantityInStock of the product
DELIMITER //
CREATE TRIGGER update_quantity_in_stock
AFTER INSERT ON orderDetails
FOR EACH ROW
BEGIN
	-- update the quantity in stock of the product
    UPDATE products
    SET quantityInStock = quantityInStock - NEW.quantity
    WHERE productID = NEW.productID;
END;
//
DELIMITER ;





    

