SELECT COUNT(DISTINCT artist_id) FROM artist_genre
GROUP BY genre_id;

select COUNT(album_id) FROM track
JOIN album ON track.album_id = album.id
WHERE year_of_issue BETWEEN 1995 AND 2007

select album_title, AVG(duration) FROM track
JOIN album ON track.album_id = album.id
GROUP BY album_title;

SELECT artist_name, year_of_issue FROM artist
JOIN artist_album ON artist.id = artist_album.artist_id
JOIN album ON artist_album.album_id = album.id
WHERE year_of_issue != 2007;

select distinct  music_collections FROM collections
JOIN collections_track ON collections.id = collections_track.collections_id
JOIN track ON collections_track.track_id = track.id
JOIN album ON track.album_id = album.id
JOIN artist_album ON album.id = artist_album.album_id
JOIN artist ON artist_album.artist_id = artist.id
WHERE artist_name = 'Григорий Лепс';

SELECT album_title FROM album
JOIN artist_album ON album.id = artist_album.album_id
JOIN artist ON artist_album.artist_id = artist.id
JOIN artist_genre ON artist.id = artist_genre.artist_id
GROUP BY album_title
HAVING COUNT(genre_id) > 1;

select id, name_of_the_track FROM track
where id not in (SELECT track_id FROM collections_track);

select artist_name FROM artist
JOIN artist_album ON artist.id = artist_album.artist_id
JOIN album ON artist_album.album_id = album.id
JOIN track ON album.id = track.album_id
WHERE duration = (SELECT MIN(duration) from track);


select distinct album_title from album
join track on track.album_id = album.id
where track.album_id in ( select album_id from track 
group by album_id
having count(id) = (
        select count(id) from track
        group by album_id
        order by count
        limit 1
    )
)
order by album_title;

