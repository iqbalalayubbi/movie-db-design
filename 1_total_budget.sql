select am.id, ps.first_name, ps.last_name, sum(mv.budget) as total_movies_budget
from person as ps inner join actor_movie as am
on am.person_id=ps.id 
inner join movie as mv
on am.movie_id=mv.id
group by ps.id, ps.first_name, ps.last_name