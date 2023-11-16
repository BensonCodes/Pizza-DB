SELECT
	o.Order_id,
	p.Product_price,
	o.Quantity,
	p.Product_cat,
	p.Product_name,
	o.Created_at,
	a.Delivery_Address1,
	a.Delivery_Address2,
	a.Delivery_city,
	a.Delivery_zipcode,
	o.Delivery
FROM 
	orders o 
	LEFT JOIN products p on o.Product_ID = p.Product_ID
	LEFT JOIN address a on o.Add_ID = a.Add_ID