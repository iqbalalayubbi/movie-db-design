select mv.id, mv.title, count(am.person_id) as actors_count
from actor_movie as am
join movie as mv on mv.id=am.movie_id
where mv.release_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
group by am.movie_id