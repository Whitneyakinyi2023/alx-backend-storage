
-- Creation of a trigger
-- Decreases quanity of items after adding a new order
DELIMITER //

CREATE TRIGGER update_numbers
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
    SET quantity  = quantity - NEW.number
    WHERE name = NEW.item_name;
END //

DELIMITER ;
