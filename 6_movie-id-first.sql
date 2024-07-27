SELECT 
    m.id,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    JSON_OBJECT(
        'id', f.id,
        'filename', f.filename,
        'mime_type', f.mime_type,
        'key_file', f.key_file,
        'url', f.url
    ) AS poster,
    JSON_OBJECT(
        'id', p.id,
        'first_name', p.first_name,
        'last_name', p.last_name,
        'photo', (
            SELECT JSON_OBJECT(
                'id', pf.id,
                'filename', pf.filename,
                'mime_type', pf.mime_type,
                'key_file', pf.key_file,
                'url', pf.url
            )
            FROM file pf
            JOIN person_image pi ON pf.id = pi.image_id
            WHERE pi.person_id = p.id
            LIMIT 1
        )
    ) AS director,
    (
        SELECT CONCAT(
            '[', 
            GROUP_CONCAT(
                JSON_OBJECT(
                    'id', a.id,
                    'first_name', a.first_name,
                    'last_name', a.last_name,
                    'photo', (
                        SELECT JSON_OBJECT(
                            'id', af.id,
                            'filename', af.filename,
                            'mime_type', af.mime_type,
                            'key_file', af.key_file,
                            'url', af.url
                        )
                        FROM file af
                        JOIN person_image ai ON af.id = ai.image_id
                        WHERE ai.person_id = a.id
                        LIMIT 1
                    )
                )
            ORDER BY a.id
            SEPARATOR ', '
            ),
            ']'
        )
        FROM person a
        JOIN actor_movie am ON a.id = am.person_id
        WHERE am.movie_id = m.id
    ) AS actors,
    (
        SELECT CONCAT(
            '[', 
            GROUP_CONCAT(
                JSON_OBJECT(
                    'id', g.id,
                    'name', g.name
                )
            ORDER BY g.id
            SEPARATOR ', '
            ),
            ']'
        )
        FROM genre g
        JOIN movie_genre mg ON g.id = mg.genre_id
        WHERE mg.movie_id = m.id
    ) AS genres
FROM 
    movie m
LEFT JOIN 
    file f ON m.poster_id = f.id
LEFT JOIN 
    person p ON m.director_id = p.id
WHERE 
    m.id = 1
GROUP BY 
    m.id, m.title, m.release_date, m.duration, 
    m.description, f.id, f.filename, f.mime_type, 
    f.key_file, f.url, p.id, p.first_name, p.last_name;