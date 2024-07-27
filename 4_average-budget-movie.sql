select ps.id as Director_ID ,concat(ps.first_name,' ', ps.last_name) as Director_Name,
avg(mv.budget) as Average_Budget from movie as mv
inner join person as ps on ps.id=mv.director_id
group by mv.director_id