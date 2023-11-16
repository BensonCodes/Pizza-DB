Create view view_3 as
select
	r.period,
	s.first_name,
	s.last_name,
	s.hourly_rate,
    sh.start_time,
    sh.end_time,
    (timestampdiff(minute, sh.start_time, sh.end_time))/60 as num_hrs_in_shift,
    (timestampdiff(minute, sh.start_time, sh.end_time))/60 * s.Hourly_rate as staff_cost
from rotations r
left join staff s on r.Staff_ID = s.Staff_ID
left join shift sh on r.Shift_ID = sh.Shift_ID