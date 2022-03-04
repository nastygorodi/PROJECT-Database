
-- Общее число песен каждого из артистов в табличке songs ( CTE )

WITH singer_ AS
( SELECT singer, country FROM musicians ORDER BY singer ),
count_songs_ AS
( SELECT count_songs( singer ), singer FROM musicians)
SELECT singer_.singer, singer_.country, count_songs_.count_songs
FROM singer_ JOIN count_songs_ 
ON singer_.singer = count_songs_.singer;

-- Исполнители, которые также принимали участие в кино или сериалах

SELECT singer
    FROM musicians
    INTERSECT
SELECT singer
    FROM films
ORDER BY singer;

-- Лейбл звукозаписи с самой большой клиентской базой

SELECT customer_base( label_name ), 
       label_name 
FROM labels
WHERE label_name <> ''
ORDER BY customer_base DESC
LIMIT 1;

-- Оконная функция

SELECT singer, year, min(year) OVER w, 
avg(year) OVER w, max(year) OVER w
FROM songs
WINDOW w AS (PARTITION BY singer);