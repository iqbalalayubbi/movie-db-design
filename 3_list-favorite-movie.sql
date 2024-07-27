select fav.user_id, user.username, 
json_array(group_concat(fav.movie_id)) as favorite_movie_ids 
from favorite_movie as fav
inner join user on user.id=fav.user_id
group by fav.user_id