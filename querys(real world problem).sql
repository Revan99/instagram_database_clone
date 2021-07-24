USE instagram_clone;

SELECT 
    *
FROM
    users;
SELECT 
    COUNT(*)
FROM
    photos;
SELECT 
    COUNT(*)
FROM
    comments;

-- finding 5 oldest users
SELECT 
    username, created_at
FROM
    users
ORDER BY created_at
LIMIT 5;

-- the day of the week which the most user registerd
SELECT 
    COUNT(*) AS total, DAYNAME(created_at) AS day_of_week
FROM
    users
GROUP BY day_of_week
ORDER BY total DESC
LIMIT 2;

-- find all users who don't have any post yet
SELECT 
    username
FROM
    users
        LEFT JOIN
    photos ON users.id = photos.user_id
WHERE
    photoS.id IS NULL;

-- find the user who has most likes 
SELECT 
    username, image_url, COUNT(likes.photo_id) AS likes
FROM
    users
        JOIN
    photos ON users.id = photos.user_id
        LEFT JOIN
    likes ON photos.id = likes.photo_id
GROUP BY image_url
ORDER BY likes DESC
LIMIT 1;

-- the 5 most used hashtag
SELECT 
    tag_name, COUNT(photo_tags.photo_id)
FROM
    tags
        INNER JOIN
    photo_tags
ON tags.id = photo_tags.tag_id
GROUP BY tag_name
ORDER BY COUNT(photo_tags.photo_id) DESC
LIMIT 5;

-- find users who liked every photo (bots)
SELECT 
    username
FROM
    users
        INNER JOIN
    likes ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);












