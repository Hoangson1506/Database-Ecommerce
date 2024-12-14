USE ecommerce;

# Find the payment method of the payments
SELECT 
	payments.*,
    paymentMethods.*
FROM payments
JOIN paymentMethods ON payments.paymentMethodID = paymentMethods.paymentMethodID;

# Find the voucher used for the payments
SELECT 
	payments.*,
    vouchers.*
FROM payments
LEFT JOIN vouchers ON vouchers.voucherID = payments.voucherID;

# Find the user who has penalty
SELECT * FROM users
WHERE userID IN (
	SElECT userID 
	FROM userPenalty
);

# Find the best selling products of each shop based on quantity ordered
SELECT 
    shopDetails.shopName,
    bestSellingProducts.productName,
    bestSellingProducts.totalQuantity
FROM (
    SELECT 
        p.shopID,
        p.productID,
        p.productName,
        SUM(od.quantity) AS totalQuantity
    FROM 
        products p
    JOIN 
        orderDetails od ON p.productID = od.productID
    GROUP BY 
        p.shopID, p.productID, p.productName
) AS bestSellingProducts
JOIN shops shopDetails 
    ON bestSellingProducts.shopID = shopDetails.shopID
WHERE 
    bestSellingProducts.totalQuantity = (
        SELECT MAX(totalQuantity)
        FROM (
            SELECT 
                p.shopID,
                p.productID,
                SUM(od.quantity) AS totalQuantity
            FROM 
                products p
            JOIN 
                orderDetails od ON p.productID = od.productID
            GROUP BY 
                p.shopID, p.productID
        ) AS subQuery
        WHERE subQuery.shopID = bestSellingProducts.shopID
    );

# Find the number of penalty of each user
SELECT userID, COUNT(*) AS totalPenalty
FROM userPenalty
GROUP BY userID;


    