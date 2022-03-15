-- 1. time functions
SELECT
       payment_id,
       payment_date ,
       to_char(payment_date, 'day:dd/MM/YY'),
       to_char(payment_date, 'dd/MM/YYYY'),
       now(),
       now()-payment_date,
      concat(extract(year from payment_date), ' ', extract(month from payment_date)),
      DATE_PART ('day', now() - payment_date),
       extract(year from now()) - extract(year from payment_date),
       (extract(year from now()) - extract(year from payment_date)) * 12 + (extract(month from now()) - extract(month from payment_date))
FROM payment;

-- 2. Group by 1
SELECT COUNT(1), c.city,
    MIN(address),
    MAX(address)
FROM address a
JOIN city c on a.city_id = c.city_id
WHERE city = 'London'
GROUP BY city
HAVING count(1) > 1
order by count(1) desc;
-- 3 JOINS

SELECT *
/*
FROM film f
 RIGHT JOIN film_actor fa on f.film_id = fa.film_id
 RIGHT JOIN actor a on fa.actor_id = a.actor_id
*/
    FROM actor a
    LEFT JOIN film_actor fa on a.actor_id = fa.actor_id
    LEFT JOIN film f on fa.film_id = f.film_id
WHERE f.title is null;

INSERT INTO actor (first_name, last_name) VALUES ('zdzisek', 'x');

-- group by 2

SELECT
       f.title,
       COUNT(1),
       f.length,
       f.special_features
FROM film f
JOIN inventory i
    on f.film_id = i.film_id
JOIN store s
    on i.store_id = s.store_id
WHERE 'Trailers' = ANY(f.special_features)
GROUP BY (f.title), f.title, f.length, f.special_features;






--- BAZA PRACOWNICY,  selfjoin
/*
SELECT
p.nazwisko, p2.nazwisko
FROM pracownicy p
JOIN pracownicy p2 on p.id = p2.id_przelozonego

ORDER BY p.nazwisko
;*/

 -- zamiana nuli na zara w selekcie
-- COALESCE(pole,0,dsfs, dsfd)


 -- zamiana nuli na zara w selekcie
-- COALESCE(pole,0)

-- SELECT nazwisko, placa + COALESCE(dodatek_funkcyjny, 0)
-- FROM pracownicy
;