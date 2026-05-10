--2. Muestra los nombres de todas las películas con una clasificación por edades de ‘Rʼ
 
SELECT "title" AS "nombre_películas", "rating" AS "clasificación"
FROM "film" AS "f"
WHERE "rating" = 'R';
 
--3. Encuentra los nombres de los actores que tengan un “actor_idˮ entre 30 y 40.
 
SELECT concat("first_name", '', "last_name") AS "actores", "actor_id"
FROM "actor" AS "a"
WHERE "actor_id" BETWEEN 30 AND 40;
 
--4. Obtén las películas cuyo idioma coincide con el idioma original.

SELECT "title" AS "películas"
FROM "film" AS "f"
WHERE "language_id" = "original_language_id";
 
--5. Ordena las películas por duración de forma ascendente.
 
SELECT "title" AS "películas", "length" AS "duración"
FROM "film" AS "f"
ORDER BY "length" ASC;
 
--6. Encuentra el nombre y apellido de los actores que tengan ‘Allenʼ en su apellido.
 
SELECT "first_name" AS "nombre", "last_name" as "apellido"
FROM "actor" AS "a"
WHERE "last_name" LIKE '%Allen%';
 
--7. Encuentra la cantidad total de películas en cada clasificación de la tabla “filmˮ y muestra la clasificación junto con el recuento.

SELECT "rating" AS "clasificación", count (*) AS "cantidad_pelis"
FROM "film" AS "f"
GROUP BY "rating";
 
--8. Encuentra el título de todas las películas que son ‘PG-13ʼ o tienen una duración mayor a 3 horas en la tabla film
 
SELECT "title" AS "películas", "rating" AS "Clasificación", "length" AS "Duración"
FROM "film" AS "f"
WHERE "rating" = 'PG-13' OR "length" > 180;
 
--9. Encuentra la variabilidad de lo que costaría reemplazar las películas.
 
SELECT stddev("replacement_cost") AS "desviación", variance("replacement_cost") AS "duración"
FROM "film" AS "f";
 
--10. Encuentra la mayor y menor duración de una película de nuestra BBDD.
 
SELECT max("length") AS "duración_max", min("length") AS "duración_min"
FROM "film" as "f";
 

--11. Encuentra lo que costó el antepenúltimo alquiler ordenado por día.
 
SELECT "amount" AS "costo_alquiler"
FROM "payment" AS "p"
ORDER BY "payment_date" DESC
LIMIT 1
OFFSET 2;
 
--12. Encuentra el título de las películas en la tabla “filmˮ que no sean ni ‘NC-17ʼ ni ‘Gʼ en cuanto a su clasificación.
 
SELECT "title" AS "películas", "rating" AS "Clasificación"
FROM "film" AS "f"
WHERE "rating" NOT IN ('NC-17', 'G');
 
--13. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
 
SELECT avg("length") AS "duración_pelis", "rating" AS "clasificación_pelis"
FROM "film" AS "f" 
GROUP BY "rating";
 
--14. Encuentra el título de todas las películas que tengan una duración mayor a 180 minutos.
 
SELECT "title" AS "películas", "length" AS "Duración"
FROM "film" AS "f"
WHERE "length" > 180;
 
--15. ¿Cuánto dinero ha generado en total la empresa?
 
SELECT SUM("amount") AS "total_ingresos"
FROM "payment" AS "p";