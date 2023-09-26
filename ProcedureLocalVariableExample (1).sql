USE om;

DROP PROCEDURE IF EXISTS test;

DELIMITER //

CREATE PROCEDURE test(
	order_id_search INT
)

BEGIN
	
	DECLARE daysSinceOrder INT;
    
    SELECT datediff(shipped_date, order_date)
    INTO daysSinceOrder
    FROM orders
    WHERE order_id = order_id_search;
    
    
    IF daysSinceOrder IS NULL THEN
		SELECT 'Your order is processing' as 'Status';
	ELSE
		SELECT Concat('Your order has shipped. It shipped out ', daysSinceOrder, ' days after the order was placed.') as 'Status';
	END IF;
	
END //

DELIMITER ;