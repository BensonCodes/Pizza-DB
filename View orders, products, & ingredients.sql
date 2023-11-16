create view VIEW_1 AS
select 
	s1.Product_name,
	s1.Ingred_ID,
	s1.Ingred_name,
	s1.Ingred_weight,
	s1.Ingred_price,
	s1.order_quantity,
	s1.recipe_quantity,
	s1.order_quantity*s1.recipe_quantity as ordered_weight,
	s1.Ingred_price/s1.Ingred_weight as unit_cost,
	(s1.order_quantity*s1.recipe_quantity)*(s1.Ingred_price/Ingred_weight) as ingredient_cost
from (select
	o.product_id,
	p.SKU,
	P.Product_name,
    r.ingred_ID,
    i.Ingred_name,
    r.quantity AS recipe_quantity,
	sum(o.quantity) as order_quantity,
    i.Ingred_weight,
    i.Ingred_price
from 
	orders o 
	left join products p on o.Product_ID = p.Product_ID
    left join recipes r on p.sku = r.Recipe_ID
    left join ingredients i on i.Ingred_ID = r.Ingred_ID
group by 
	o.product_ID, 
    p.SKU, 
    P.Product_name,
    r.Ingred_ID,
    r.Quantity,
    i.ingred_name,
	i.Ingred_weight,
    i.Ingred_price) s1
