select year, sender, receiver
from packages as p inner join (
	select id_package, name as sender 
	from packages 
	inner join users 
	on id_user_sender = id 
	where address <> 'Taiwan'
) as sub1
on sub1.id_package = p.id_package
inner join (
	select id_package, name as receiver 
	from packages 
	inner join users 
	on id_user_receiver = id 
	where address <> 'Taiwan'
) as sub2
on sub2.id_package = p.id_package
where color = 'blue' or year = 2015
order by year desc, sender desc
;