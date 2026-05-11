--2. Muestra los nombres de todas las películas con una clasificación por edades de ‘Rʼ
 
SELECT 
   "title" AS "nombre_películas", "rating" AS "clasificación"
FROM "film" AS "f"
WHERE "rating" = 'R';
 
--3. Encuentra los nombres de los actores que tengan un “actor_idˮ entre 30 y 40.
 
SELECT 
    CONCAT("first_name", '', "last_name") AS "actores", "actor_id"
FROM "actor" AS "a"
WHERE "actor_id" BETWEEN 30 AND 40;
 
--4. Obtén las películas cuyo idioma coincide con el idioma original.

SELECT 
    "title" AS "películas"
FROM "film" AS "f"
WHERE "language_id" = "original_language_id";
 
--5. Ordena las películas por duración de forma ascendente.
 
SELECT 
    "title" AS "películas", "length" AS "duración"
FROM "film" AS "f"
ORDER BY "length" ASC;
 
--6. Encuentra el nombre y apellido de los actores que tengan ‘Allenʼ en su apellido.
 
SELECT 
    "first_name" AS "nombre", "last_name" as "apellido"
FROM "actor" AS "a"
WHERE "last_name" LIKE '%Allen%';
 
--7. Encuentra la cantidad total de películas en cada clasificación de la tabla “filmˮ y muestra la clasificación junto con el recuento.

SELECT 
    "rating" AS "clasificación", COUNT (*) AS "cantidad_pelis"
FROM "film" AS "f"
GROUP BY "rating";
 
--8. Encuentra el título de todas las películas que son ‘PG-13ʼ o tienen una duración mayor a 3 horas en la tabla film
 
SELECT 
   "title" AS "películas", "rating" AS "Clasificación", "length" AS "Duración"
FROM "film" AS "f"
WHERE "rating" = 'PG-13' OR "length" > 180;
 
--9. Encuentra la variabilidad de lo que costaría reemplazar las películas.
 
SELECT 
    STDDEV("replacement_cost") AS "desviación", VARIANCE("replacement_cost") AS "duración"
FROM "film" AS "f";
 
--10. Encuentra la mayor y menor duración de una película de nuestra BBDD.
 
SELECT 
    MAX("length") AS "duración_max", MIN("length") AS "duración_min"
FROM "film" AS "f";
 

--11. Encuentra lo que costó el antepenúltimo alquiler ordenado por día.
 
SELECT 
    "amount" AS "costo_alquiler"
FROM "payment" AS "p"
ORDER BY "payment_date" DESC
LIMIT 1
OFFSET 2;
 
--12. Encuentra el título de las películas en la tabla “filmˮ que no sean ni ‘NC-17ʼ ni ‘Gʼ en cuanto a su clasificación.
 
SELECT 
    "title" AS "películas", "rating" AS "Clasificación"
FROM "film" AS "f"
WHERE "rating" NOT IN ('NC-17', 'G');
 
--13. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
 
SELECT 
    AVG("length") AS "duración_pelis", "rating" AS "clasificación_pelis"
FROM "film" AS "f" 
GROUP BY "rating";
 
--14. Encuentra el título de todas las películas que tengan una duración mayor a 180 minutos.
 
SELECT 
    "title" AS "películas", "length" AS "Duración"
FROM "film" AS "f"
WHERE "length" > 180;
 
--15. ¿Cuánto dinero ha generado en total la empresa?
 
SELECT 
    SUM("amount") AS "total_ingresos"
FROM "payment" AS "p";
 
--16. Muestra los 10 clientes con mayor valor de id.

SELECT 
    CONCAT("first_name", ' ', "last_name") AS "clientes"
FROM "customer" AS "c"
ORDER BY "customer_id" DESC 
LIMIT 10;
 
--17. Encuentra el nombre y apellido de los actores que aparecen en la película con título ‘Egg Igbyʼ.
 
SELECT 
    CONCAT(a."first_name", ' ', a."last_name") AS "actores"
FROM "actor" AS "a"
INNER JOIN "film_actor" AS "fa"
    ON a."actor_id" = fa."actor_id"
INNER JOIN "film" AS "f"
    ON fa."film_id" = f."film_id"
WHERE f."title" = 'Egg Igby';
 
--18. Selecciona todos los nombres de las películas únicos
 
SELECT DISTINCT 
          "title" AS "nombres_únicos"
FROM "film" AS "f";
 
--19. Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla “filmˮ.
 
SELECT 
    f."title" AS "titulo",
    f."length" AS "duracion"
FROM "film" AS "f"
INNER JOIN "film_category" AS "fc"
    ON f."film_id" = fc."film_id"
INNER JOIN "category" AS "c"
    ON fc."category_id" = c."category_id"
WHERE c."name" = 'Comedy'
AND f."length" > 180;
 
--20.  Encuentra las categorías de películas que tienen un promedio de duración superior a 110 minutos y muestra el nombre de la categoría junto con el promedio de duración.
 
SELECT 
     c."name" AS "categoría", avg(f."length") AS "duración"
FROM "category" AS "c"
INNER JOIN "film_category" AS "fc"
     ON c."category_id" = fc."category_id"
INNER JOIN "film" AS "f"
     ON f."film_id" = fc."film_id"
GROUP BY c."name"
HAVING AVG(f."length") > 110;

 
--21. ¿Cuál es la media de duración del alquiler de las películas?
 
SELECT 
    ROUND(AVG(rental_duration), 2) AS "media_duracion_alquiler"
FROM film;
 
--22. Crea una columna con el nombre y apellidos de todos los actores y actrices.
 
SELECT 
    CONCAT("first_name", ' ', "last_name") AS "actores"
FROM "actor" as "a";
 
--23. Números de alquiler por día, ordenados por cantidad de alquiler de forma descendente.
 
SELECT 
    "rental_date" AS "fecha_alquileres", COUNT (*) AS "cantidad_alquileres"
FROM "rental" AS "r"
GROUP BY "rental_date"
ORDER BY "cantidad_alquileres"DESC;
 
--24. Encuentra las películas con una duración superior al promedio.

SELECT 
    "title" AS "películas"
FROM "film" AS "f"
WHERE "length" > (
    SELECT AVG("length") 
    FROM "film" AS "f"
);
 
--25. Averigua el número de alquileres registrados por mes.
 
SELECT 
   date_trunc('month', "rental_date") AS "mes", COUNT(*) AS "número_alquileres"
FROM "rental" AS "r"
GROUP BY "mes"
ORDER BY "mes";
 
--26. Encuentra el promedio, la desviación estándar y varianza del total pagado.
 
SELECT 
    AVG("amount"), STDDEV("amount"), VARIANCE("amount")
FROM "payment" as "p"; 
 
--27. ¿Qué películas se alquilan por encima del precio medio?
 
SELECT 
    f."title" AS "películas", f."rental_rate" AS "precio_alquiler"
FROM "film" AS "f"
WHERE f."rental_rate" > (
    SELECT AVG("rental_rate") 
    FROM "film" AS "f"
)
ORDER BY f."rental_rate" DESC;
 
--28. Muestra el id de los actores que hayan participado en más de 40 películas.
 
SELECT 
   "actor_id", COUNT("film_id") AS "total_películas"
FROM "film_actor" AS "fa"
GROUP BY "actor_id"
HAVING COUNT("film_id") > 40
ORDER BY "total_películas" DESC;
 
--29. Obtener todas las películas y, si están disponibles en el inventario, mostrar la cantidad disponible
 
SELECT f."film_id", 
       f."title" AS "películas", 
       COUNT(i."inventory_id") AS "cantidad_disponible"
FROM "film" AS "f"
LEFT JOIN "inventory" AS "i"
    ON f."film_id" = i."film_id"
LEFT JOIN "rental" AS "r" 
    ON i."inventory_id" = r."inventory_id" AND r."return_date" IS NULL
GROUP BY f."film_id", f."title"
ORDER BY "cantidad_disponible" DESC;

--30.  Obtener los actores y el número de películas en las que ha actuado.
 
SELECT 
    CONCAT("first_name", ' ', "last_name") AS "actores", COUNT(fa."film_id") AS "total_películas"
FROM "actor" AS "a"
INNER JOIN "film_actor" AS "fa"
     ON a."actor_id" = fa."actor_id"
GROUP BY "actores"
ORDER BY "total_películas" DESC;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 