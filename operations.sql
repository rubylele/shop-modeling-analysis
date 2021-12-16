
CREATE FUNCTION ComputeOrderProductsPrice(@OrderProductsID int)
RETURNS int
AS
BEGIN
	DECLARE @totalPrice money;
	DECLARE @prodId int;
	DECLARE @productPrice money;
	DECLARE @productQuantity int;
	SET @prodId = (SELECT PRODUCT_ID FROM ORDER_PRODUCTS WHERE ID = @OrderProductsID)
	SET @productPrice = (SELECT PRICE FROM PRODUCTS WHERE ID = @prodId)
	SET @productQuantity = (SELECT PRODUCT_QUANTITY FROM ORDER_PRODUCTS WHERE ID = @OrderProductsID)
	SELECT @totalPrice = @productPrice * @productQuantity
	RETURN @totalPrice;
END;

DROP function ComputeOrderProductsPrice


PRINT(dbo.ComputeOrderProductsPrice(2));


CREATE TRIGGER ORDERPRODUCTS_INSERT
ON ORDER_PRODUCTS
AFTER INSERT
AS 
UPDATE PRODUCTS
SET QUANTITY = QUANTITY - (SELECT PRODUCT_QUANTITY FROM inserted)
WHERE ID = (SELECT PRODUCT_ID FROM inserted)

CREATE PROCEDURE Apple_products AS
SELECT * FROM PRODUCTS
WHERE BRAND_ID = 1

EXEC Apple_products