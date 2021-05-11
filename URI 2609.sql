SELECT c.name , SUM (amount) 
FROM products as p,
categories as c
WHERE p.id_categories = c.id  
GROUP BY c.name; 