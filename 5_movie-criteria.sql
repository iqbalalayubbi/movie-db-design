select mv.id, mv.title, mv.release_date, mv.duration, mv.description,
json_object('ID', fl.id, 'filename', fl.filename , 'mime_type', fl.mime_type,
'key_file', fl.key_file, 'url', fl.url) as poster,
json_object('ID', ps.id, 'first_name', ps.first_name , 'last_name', ps.last_name) as director
from movie as mv 
join movie_genre as mv_gen on mv.id=mv_gen.movie_id 
join person as ps on mv.director_id=ps.id
join file as fl on mv.poster_id=fl.id
where 
mv.release_date >= '2022-01-01' &&
mv.duration > 135 &&
mv_gen.genre_id=2 ||
mv_gen.genre_id=4