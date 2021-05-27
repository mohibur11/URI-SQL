select d.name , round(t.salary, 1)
from doctors as d
inner join
(
    select id_doctor, sum( (hours * 150) +
    ((hours*150.0 * w.bonus)/100.0) ) as salary
    from work_shifts as w
    inner join
    attendances as a
    on w.id = a.id_work_shift
    group by id_doctor
    
) as t
on t.id_doctor = d.id
order by t.salary desc
;