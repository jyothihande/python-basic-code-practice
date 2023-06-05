-- JOIN TWO DATABASE/tables IN SQL:
-- for joining purpose content of one column must be same.
-- Inner join
-- Outer Join 1.LEFT JOIN 2. RIGHT JOIN
-- Self Join (default)

-- 1.SELF JOIN EXAMPLE
SELECT * FROM sql_invoicing.clients c
JOIN invoices i
ON c.client_id = i.client_id ;

SELECT c.client_id,address,city FROM sql_invoicing.clients c
JOIN invoices i
ON c.client_id = i.client_id ;

SELECT * FROM sql_invoicing.clients c
LEFT JOIN invoices i
USING (client_id); -- shows client_id only once

SELECT * FROM sql_store.customers
NATURAL JOIN sql_store.orders; -- BUT Avoid using as same content column may get mixed. using clause is better

-- CROSS JOIN
-- UNION FUNCTION:
SELECT product_id,name,quantity_in_stock,"FULL"as unit_price FROM sql_store.products
WHERE quantity_in_stock >= 50
UNION
SELECT product_id,name,quantity_in_stock, "needs attention" as unit_price   FROM sql_store.products
WHERE quantity_in_stock < 50;

-- JOIN MULTIPLE TABLEs:
SELECT c.client_id,name,city,number,p.invoice_id FROM clients c
JOIN invoices i
ON c.client_id = i.client_id 
JOIN payments p
ON i.invoice_id = p.invoice_id;

-- OUTER JOIN EXAMPLE:
SELECT * FROM sql_store.order_items oi
JOIN sql_inventory.products p
ON oi.product_id = p.product_id;

-- SELF JOIN: JOINING TABLE WITH ITSELF WHERE IT IS USED???
SELECT * FROM sql_hr.employees em
JOIN sql_hr.employees e
ON em.reports_to = e.employee_id;

SELECT em.employee_id,em.first_name as " Employee Name" ,e.first_name AS "Manager" from sql_hr.employees em
JOIN sql_hr.employees e
ON em.reports_to = e.employee_id;

-- OUTER LEFT / RIGHT JOIN:
SELECT * FROM clients c
RIGHT JOIN invoices i
ON c.client_id = i.client_id ;


-- EXAMPLE:
SELECT * FROM sql_store.customers c
left join sql_store.orders o
ON c.customer_id = o.customer_id
left join sql_store.shippers s
on o.shipper_id = s.shipper_id;

SELECT c.customer_id,c.first_name,c.phone,o.order_id,s.name as "shipper name" FROM sql_store.customers c
left join sql_store.orders o
ON c.customer_id = o.customer_id
left join sql_store.shippers s
on o.shipper_id = s.shipper_id






