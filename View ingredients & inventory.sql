Create view view_2 as
select
	s2.Ingred_name,
    s2.s_ordered_weight,
    ing.Ingred_weight,
    inv.quantity,
	ing.Ingred_weight*inv.Quantity as total_inv_weight,
    (ing.Ingred_weight*inv.Quantity)-s2.s_ordered_weight as remaining_weight
    
from 
	(SELECT
		Ingred_ID,
		Ingred_name,
		sum(ordered_weight) as s_ordered_weight
	FROM
		view_1
	group by 
		Ingred_name, 
        Ingred_ID) s2
    
left join inventory inv on inv.ingred_id = s2.ingred_ID
left join ingredients ing on ing.ingred_id = s2.ingred_ID;