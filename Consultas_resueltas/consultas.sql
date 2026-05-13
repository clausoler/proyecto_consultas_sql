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
 
--31. Obtener todas las películas y mostrar los actores que han actuado en ellas, incluso si algunas películas no tienen actores asociados.
 
SELECT 
     f."title" AS "películas", concat(a."first_name", ' ', a."last_name") AS "actores"
FROM "film" AS "f"
LEFT JOIN "film_actor" AS "fa"
    ON f."film_id" = fa."film_id"
LEFT JOIN "actor" AS "a"
    ON a."actor_id" = fa."actor_id"
ORDER BY "actores";
 
--32. Obtener todos los actores y mostrar las películas en las que han actuado, incluso si algunos actores no han actuado en ninguna película.

SELECT 
    f."title" AS "películas", concat(a."first_name", ' ', a."last_name") AS "actores"
FROM "actor" AS "a"
LEFT JOIN "film_actor" AS "fa"
    ON a."actor_id" = fa."actor_id"
LEFT JOIN "film" AS "f"
    ON fa."film_id" = f."film_id"
ORDER BY "actores";
 
--33.  Obtener todas las películas que tenemos y todos los registros de alquiler

SELECT 
    f."title" AS "pelicula",
    r."rental_id",
    r."rental_date",
    r."return_date"
FROM "film" AS "f"
INNER JOIN "inventory" AS "i"
    ON f."film_id" = i."film_id"
INNER JOIN "rental" AS "r"
    ON i."inventory_id" = r."inventory_id"
ORDER BY f."title";
 
--34. Encuentra los 5 clientes que más dinero se hayan gastado con nosotros.

SELECT 
    CONCAT(c."first_name", ' ', c."last_name") AS "clientes", SUM(p."amount") AS "total_gastado"
FROM "customer" AS "c"
INNER JOIN "payment" AS "p"
     ON c."customer_id" = p."customer_id"
GROUP BY "clientes"
ORDER BY "total_gastado" DESC
LIMIT 5;
 
--35. Selecciona todos los actores cuyo primer nombre es 'Johnny'.

SELECT 
    "actor_id",
    "first_name",
    "last_name"
FROM "actor" AS "a"
WHERE "first_name" = 'Johnny';
 
--36. Renombra la columna “first_nameˮ como Nombre y “last_nameˮ como Apellido.
 
WITH "actores" AS (
    SELECT "first_name" AS "Nombre", 
           "last_name" AS "Apellido"
    FROM "actor" AS "a"
)
SELECT * FROM "actores";
 
--37. Encuentra el ID del actor más bajo y más alto en la tabla actor.
 
SELECT 
    CONCAT("first_name", ' ', "last_name") AS "actor", "actor_id"
FROM "actor" AS "a"
WHERE "actor_id" in 
     ((SELECT MIN("actor_id") FROM "actor" AS "a"), (SELECT MAX("actor_id") FROM "actor" AS "a"));
 
--38. Cuenta cuántos actores hay en la tabla “actorˮ.
 
SELECT 
    COUNT("actor_id")
FROM "actor" AS "a";
 
--39. Selecciona todos los actores y ordénalos por apellido en orden ascendente.
 
SELECT 
   "first_name" AS "nombre_actor", "last_name" AS "apellido_actor"
FROM "actor" AS "a"
ORDER BY "apellido_actor";

--40. Selecciona las primeras 5 películas de la tabla “filmˮ.
 
SELECT 
   "title" AS "películas"
FROM "film" AS "f"
LIMIT 5;
 
--41. Agrupa los actores por su nombre y cuenta cuántos actores tienen el mismo nombre. ¿Cuál es el nombre más repetido?
 
SELECT 
   "first_name", COUNT(*) AS "total_actores"
FROM "actor" AS "a"
GROUP BY "first_name" 
HAVING COUNT(*) > 1
ORDER BY "total_actores" DESC;
 
--42. Encuentra todos los alquileres y los nombres de los clientes que los realizaron.
 
SELECT r."rental_id", 
       r."rental_date", 
       c."customer_id", 
       CONCAT(c."first_name", ' ', c."last_name") AS "nombre_cliente"
FROM "rental" AS "r"
INNER JOIN "customer" AS "c" 
     ON r."customer_id" = c."customer_id"
ORDER BY r."rental_date" DESC;
 
--43. Muestra todos los clientes y sus alquileres si existen, incluyendo aquellos que no tienen alquileres.
 
SELECT c."customer_id", 
       CONCAT(c."first_name", ' ', c."last_name") AS "nombre_cliente", 
       r."rental_id", 
       r."rental_date"
FROM "customer" AS "c"
LEFT JOIN "rental" AS "r" 
    ON c."customer_id" = r."customer_id"
ORDER BY c."customer_id", r."rental_date";
 
--44. Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor esta consulta? ¿Por qué? Deja después de la consulta la contestación.
 
SELECT f."title" AS "pelicula",
       c."name" AS "categoria"
FROM "film" AS "f"
CROSS JOIN "category" AS "c"
ORDER BY f."title", c."name";

-- Lo que ocurre aquí es que el cross join combina cada película con cada categoría. Por tanto, si hay 100 películas y 10 categorías,
-- cada película aparecerá 10 veces, una por cada categoría. Y cada categoría aparecerá 100 veces, una por cada película.
-- Esto no tiene sentido porque no hay una relación de categorías real. Para ello habría que hacer un inner join. 
 
--45. Encuentra los actores que han participado en películas de la categoría 'Action'.
 
SELECT 
   CONCAT(a."first_name", ' ', a."last_name") AS "actores", c."name"
FROM "actor" AS "a"
INNER JOIN "film_actor" AS "fa" 
     ON a."actor_id" = fa."actor_id"
INNER JOIN "film" AS "f" 
     ON fa."film_id" = f."film_id"
INNER JOIN "film_category" AS "fc" 
     ON f."film_id" = fc."film_id"
INNER JOIN "category" AS "c" 
     ON fc."category_id" = c."category_id"
WHERE c."name" = 'Action'
ORDER BY "actores";
 
--46. Encuentra todos los actores que no han participado en películas.
 
SELECT 
   CONCAT(a."first_name", ' ', a."last_name") AS "actores"
FROM "actor" AS "a"
LEFT JOIN "film_actor" AS "fa" 
    ON a."actor_id" = fa."actor_id"
WHERE fa."actor_id" IS NULL
ORDER BY "actores";
 
--47. Selecciona el nombre de los actores y la cantidad de películas en las que han participado.

SELECT 
    CONCAT(a."first_name", ' ', a."last_name") AS "actor",
    COUNT(fa."film_id") AS "cantidad_peliculas"
FROM "actor" AS "a"
INNER JOIN "film_actor" AS "fa"
    ON a."actor_id" = fa."actor_id"
GROUP BY a."actor_id", a."first_name", a."last_name"
ORDER BY "cantidad_peliculas" DESC;
 
--48. Crea una vista llamada “actor_num_peliculasˮ que muestre los nombres de los actores y el número de películas en las que han participado.
 
CREATE VIEW "actor_num_peliculas" AS
SELECT a."actor_id", 
       CONCAT(a."first_name", ' ', a."last_name") AS "nombre_actores", 
       COUNT(fa."film_id") AS "total_peliculas"
FROM "actor" AS "a"
LEFT JOIN "film_actor" AS "fa" 
    ON a."actor_id" = fa."actor_id"
GROUP BY a."actor_id", a."first_name", a."last_name"
ORDER BY "total_peliculas" DESC;

SELECT * FROM "actor_num_peliculas";
 
--49. Calcula el número total de alquileres realizados por cada cliente.
 
WITH "alquileres_totales" AS (
    SELECT 
        CONCAT(c."first_name", ' ', c."last_name") AS "cliente",
        COUNT(r."rental_id") AS "total_alquileres"
    FROM "customer" AS "c"
    LEFT JOIN "rental" AS "r" 
        ON c."customer_id" = r."customer_id"
    GROUP BY "cliente"
)
SELECT * 
FROM "alquileres_totales"
ORDER BY "total_alquileres" DESC;
 
--50. Calcula la duración total de las películas en la categoría 'Action'.
 
WITH "peliculas_action" AS (
    SELECT f."film_id", f."title", f."length"
    FROM "film" AS "f"
    INNER JOIN "film_category" as "fc"
         ON f."film_id" = fc."film_id"
    INNER JOIN "category" AS "c" 
         ON fc."category_id" = c."category_id"
    WHERE c."name" = 'Action'
)
SELECT SUM("length") AS "duracion_total_minutos"
FROM "peliculas_action";
 
--51. Crea una tabla temporal llamada “cliente_rentas_temporalˮ para almacenar el total de alquileres por cliente.
 
CREATE TEMPORARY TABLE "cliente_rentas_temporal" (
    "customer_id" INT PRIMARY KEY,
    "nombre_completo" TEXT,
    "total_alquileres" INT
);

INSERT INTO cliente_rentas_temporal (customer_id, nombre_completo, total_alquileres)
SELECT c."customer_id", 
       CONCAT(c."first_name", ' ', c."last_name") AS "nombre_completo",
       COUNT(r."rental_id") AS "total_alquileres"
FROM "customer" AS "c"
LEFT JOIN "rental" AS "r" 
    ON c."customer_id" = r."customer_id"
GROUP BY c."customer_id", c."first_name", c."last_name"
ORDER BY "total_alquileres" DESC;

SELECT * FROM cliente_rentas_temporal;
 
--52. Crea una tabla temporal llamada “peliculas_alquiladasˮ que almacene las películas que han sido alquiladas al menos 10 veces.
 
CREATE TEMPORARY TABLE "peliculas_alquiladas" (
    film_id INT PRIMARY KEY,
    titulo TEXT,
    total_alquileres INT
);

INSERT INTO peliculas_alquiladas (film_id, titulo, total_alquileres)
SELECT f."film_id", 
       f."title" AS "titulo", 
       COUNT(r."rental_id") AS "total_alquileres"
FROM "film" AS "f"
INNER JOIN "inventory" AS "i" 
     ON f."film_id" = i."film_id"
INNER JOIN "rental" AS "r" 
     ON i."inventory_id" = r."inventory_id"
GROUP BY f."film_id", f."title"
HAVING COUNT(r."rental_id") >= 10
ORDER BY "total_alquileres" DESC;

SELECT * FROM peliculas_alquiladas;
 
--53. Encuentra el título de las películas que han sido alquiladas por el cliente con el nombre ‘Tammy Sandersʼ y que aún no se han devuelto. 
--Ordena los resultados alfabéticamente por título de película.

SELECT 
    f."title" AS "pelicula"
FROM "customer" AS "c"
INNER JOIN "rental" AS "r"
    ON c."customer_id" = r."customer_id"
INNER JOIN "inventory" AS "i"
    ON r."inventory_id" = i."inventory_id"
INNER JOIN "film" AS "f"
    ON i."film_id" = f."film_id"
WHERE c."first_name" = 'Tammy'
AND c."last_name" = 'Sanders'
AND r."return_date" IS NULL
ORDER BY f."title" ASC;
 
--54. Encuentra los nombres de los actores que han actuado en al menos una película que pertenece a la categoría ‘Sci-Fiʼ. Ordena los resultados alfabéticamente por apellido.

WITH "actores_sci_fi" AS (
    SELECT DISTINCT a."actor_id", 
           CONCAT(a."first_name", ' ', a."last_name") AS "nombre_completo"
    FROM "actor" AS "a"
    INNER JOIN "film_actor" AS "fa"
         ON a."actor_id" = fa."actor_id"
    INNER JOIN "film" AS "f" 
         ON fa."film_id" = f."film_id"
    INNER JOIN "film_category" AS "fc" 
         ON f."film_id" = fc."film_id"
    INNER JOIN "category" AS "c" 
         ON fc."category_id" = c."category_id"
    WHERE c."name" = 'Sci-Fi'
)
SELECT * FROM "actores_sci_fi"
ORDER BY "nombre_completo";
 
--55. Encuentra el nombre y apellido de los actores que han actuado en películas que se alquilaron después de que la película ‘Spartacus Cheaperʼ se alquilara por primera vez. 
--Ordena los resultados alfabéticamente por apellido.
 

WITH "primera_fecha_alquiler" AS (

    SELECT 
        MIN(r."rental_date") AS "fecha_primer_alquiler"
    FROM "rental" AS "r"
    INNER JOIN "inventory" AS "i"
        ON r."inventory_id" = i."inventory_id"
    INNER JOIN "film" AS "f"
        ON i."film_id" = f."film_id"
    WHERE f."title" = 'Spartacus Cheaper'

)

SELECT DISTINCT
    a."first_name",
    a."last_name"
FROM "actor" AS "a"
INNER JOIN "film_actor" AS "fa"
    ON a."actor_id" = fa."actor_id"
INNER JOIN "film" AS "f"
    ON fa."film_id" = f."film_id"
INNER JOIN "inventory" AS "i"
    ON f."film_id" = i."film_id"
INNER JOIN "rental" AS "r"
    ON i."inventory_id" = r."inventory_id"
WHERE r."rental_date" > (
    SELECT "fecha_primer_alquiler"
    FROM "primera_fecha_alquiler"
)
ORDER BY a."last_name" ASC;

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 