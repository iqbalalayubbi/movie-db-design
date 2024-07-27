```
erDiagram
    ACTOR_MOVIE {
        int id PK
        int movie_id
        int person_id
        int character_id
    }

    CHARACTER_MOVIE {
        int id PK
        string name
        text description
        string role
    }

    COUNTRY {
        int id PK
        string name
    }

    FAVORITE_MOVIE {
        int id PK
        int movie_id
        int user_id
    }

    FILE {
        int id PK
        string filename
        string mime_type
        string key_file
        string url
    }

    GENRE {
        int id PK
        string name
    }

    MOVIE {
        int id PK
        string title
        text description
        int budget
        date release_date
        int duration
        int director_id
        int country_id
        int poster_id
    }

    MOVIE_GENRE {
        int id PK
        int genre_id
        int movie_id
    }

    PERSON {
        int id PK
        string first_name
        string last_name
        text biography
        date date_of_birth
        string gender
        int country_id
    }

    PERSON_IMAGE {
        int id PK
        int person_id
        int image_id
    }

    USER {
        int id PK
        string username
        string first_name
        string last_name
        string email
        string password
        int avatar_id
    }


    COUNTRY ||--o{ MOVIE : has
    USER ||--|| FILE : has
    MOVIE ||--|| FILE : has
    MOVIE ||--|| PERSON : has
    MOVIE ||--o{ CHARACTER_MOVIE : has
    COUNTRY ||--|| PERSON : has
    USER ||--O{ FAVORITE_MOVIE : has
    MOVIE ||--O{ FAVORITE_MOVIE : has
    FILE ||--O{ PERSON_IMAGE : has
    PERSON ||--O{ PERSON_IMAGE : has
    MOVIE ||--O{ MOVIE_GENRE : has
    GENRE ||--O{ MOVIE_GENRE : has
    MOVIE ||--O{ ACTOR_MOVIE : has
    PERSON ||--O{ ACTOR_MOVIE : has
```