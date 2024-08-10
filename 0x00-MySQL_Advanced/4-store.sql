
-- Creation of a trigger
-- Decreases quanity of items after adding a new order
DELIMITER //

CREATE TRIGGER update_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
    SET quantity = quantity - orders
    WHERE name= items;
END //

DELIMITER ;
