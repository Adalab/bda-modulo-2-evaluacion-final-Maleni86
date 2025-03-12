-- Examen Módulo 2 - Maleni Espinoza

USE sakila;
-- Ejercicio 1: Selecciona todos los nombres de las películas sin que aparezcan duplicados.

SELECT DISTINCT title
	FROM film;
    
-- He usado DISTINCT para que solo me dé como outputs los nombres únicos de las peliculas y que no hayan duplicados.

-- Ejercicio 2:  Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
-- Versión query comprobación:
SELECT title, rating	
	FROM film
    WHERE rating = "PG-13";

/* He usado el WHERE para que me filtre por el rating "PG-13" según pide el enunciado 
y he indicado ambas columnas en el SELECT para que aparezcan en el output.*/

-- Versión final:
SELECT title	
	FROM film
    WHERE rating = "PG-13";

-- Ejercicio 3: Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.

SELECT title, description
	FROM film
    WHERE description LIKE "%amazing%";

/* He usado LIKE para buscar cadenas que contengan la palabra "amazing" en cualquier parte del título de la película y 
le he puesto el símbolo de % que representa cualquier número de caracteres antes o después de "amazing".*/

-- Ejercicio 4 : Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.

SELECT title
	FROM film
    WHERE length > 120;
    
/* He usado un WHERE para que me filtre solo las peliculas con duración (length) mayor a 120 min,
y en el SELECT incluyo las columnas del  nombre de todas las peliculas que cumplan ese filtro. */

-- Ejercicio 5 : Recupera los nombres de todos los actores.

SELECT CONCAT(first_name, " ", last_name) AS nombre_actores
	FROM actor;

/* He usado el CONCAT para que junte el nombre y apellido de los actores y así evitar homonimias, sacando los datos desde la tabla actor. */

-- Ejercicio 6 : Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.

SELECT first_name, last_name
	FROM actor
    WHERE last_name = "Gibson";

-- He utilizado el WHERE para igualar el last_name a Gibson y así me muestre solo los actores con ese apellido.

-- Ejercicio 7 : Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.

SELECT actor_id, first_name
	FROM actor
    WHERE actor_id >= 10 AND actor_id <= 20;
    
 /* He utilizado un WHERE para filtrar los actor_id que se encuentren entre >= 10 y <= 20, 
 ya que he interpretado que se incluían los dos números, sino el enunciado diría "excluyendo ambos números";
 en caso que no se incluyan el código sería:  WHERE actor_id > 10 AND actor_id < 20.*/
 
-- Ejercicio 8 : Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.

SELECT title, rating AS clasificación
	FROM film
    WHERE rating NOT IN ('R', 'PG-13');
 
 /* He utilizado la condición NOT IN haciendo un WHERE en la columna rating, que muestra la clasificación, 
 para que el output sea el título de las peliculas que no incluyan ni "R" ni "PG-13" en su clasificación */
 
/* Ejercicio 9: Encuentra la cantidad total de películas en cada clasificación de la tabla film y 
muestra la clasificación junto con el recuento.*/

SELECT rating AS clasificación, COUNT(rating) AS recuento_clasificación_peliculas
	FROM film
    GROUP BY rating;
    
 /* He utilizado: primero COUNT para que sume la cantidad de películas que hay en cada clasíficación 
 y luego GROUP BY para que me agrupe todas las películas por su clasificación.*/

 
/* Ejercicio 10: Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su
nombre y apellido junto con la cantidad de películas alquiladas. */

 
 SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS cantidad_peliculas_alquiladas
	FROM customer AS c
	LEFT JOIN rental AS r ON c.customer_id = r.customer_id
	GROUP BY c.customer_id;
    
 /* He usado LEFT JOIN para asegurarnos de que obtengamos todos los clientes que hayan alquilado alguna pelicula, uniendo la tabla clientes
 con la tabla rental, a través del customer_id. Luego usé el COUNT para el recuento de las películas alquiladas,
 y agrupé por customer_id para tener el recuento de peliculas alquiladas por cada cliente.*/
 
/* Ejercicio 11: Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría
 junto con el recuento de alquileres. */
 
SELECT c.name AS categoria, COUNT(r.rental_id) AS recuento_alquileres
	FROM category AS c
	INNER JOIN film_category AS fc ON c.category_id = fc.category_id
	INNER JOIN film AS f ON fc.film_id = f.film_id
	INNER JOIN inventory AS i ON f.film_id = i.film_id
	INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
	GROUP BY c.name;
 
  /* He utilzado el INNER JOIN para asociar la columna category_id de la tabla category y de la tabla film_category para que nos muestre el nombre de la categoría,
a su vez he relacionado film_id de las tablas film_category y film para asociar las películas con sus categorías.
Además he utilizado la tabla inventory para conectar las películas (film_id) con los alquileres (inventory_id).
Finalmente, he relacionado los alquileres (rental) con el inventario (inventory).
Para el SELECT he hecho un COUNT para que me muestre en el output el recuento de los alquileres y 
un GROUP BY para que los agrupe por categorías.*/

/* Ejercicio 12: Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y
muestra la clasificación junto con el promedio de duración.*/

SELECT rating AS clasificación, AVG(length) AS Promedio_duración
	FROM film
    GROUP BY rating;
    
 /* He calculado el promedio de la duración de las películas (length) para cada 
 clasificación utilizando AVG(length), y he agrupado por clasificación (rating), ambos de la tabla film.*/
 
 
 /* Ejercicio 13: Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".*/
 
 SELECT a.first_name, a.last_name
	FROM actor AS a 
    INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
    INNER JOIN film AS f ON fa.film_id = f.film_id
    WHERE title = "Indian Love";
 
 /* He utilizado INNER JOIN para unir las tablas actor, film_actor y film para encontrar a los 
 actores que han participado en la película "Indian Love", siendo la tabla relacionada Film_actor.
 Además he filtrado por el título de la película con WHERE según pedía el enunciado.*/


  /* Ejercicio 14: Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.*/
 
SELECT title
	FROM film
    WHERE description LIKE "%dog%" OR description LIKE "%cat%";
    
/* He utilizado WHERE en la columna description de la tabla film para filtrar las películas 
que dentro de la descripición contengan "dog" o "cat" usando LIKE y el símbolo % al inicio y al final para indicar coincidencias parciales.*/


 /* Ejercicio 15: Hay algún actor o actriz que no aparezca en ninguna película en la tabla film_actor.*/
 -- Respuesta: No, todos los actores y actrices aparecen en la tabla film_actor.
 
SELECT first_name, last_name
	FROM actor
	WHERE actor_id NOT IN (
							SELECT actor_id
								FROM film_actor);
                                
/* Desde la tabla actor he seleccionado los nombres y apellidos de los mismos y he hecho un WHERE para excluir los actores que aparecen 
en la tabla film_actor utilizando NOT IN con una subconsulta que me da un output de los actores que estarían en la tabla film_actor.


  /* Ejercicio 16: Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.*/

-- Opción 1:
SELECT title, release_year
	FROM film
	WHERE release_year BETWEEN 2005 AND 2010;
 
-- Opción 2:
SELECT title, release_year
	FROM film
	WHERE release_year >= 2005 AND release_year <= 2010;
    
-- Versión Final:
SELECT title, release_year
	FROM film
	WHERE release_year BETWEEN 2005 AND 2010;

/* He utilizado un WHERE y el BETWEEN para encontrar la columna del año de lanzamiento (release_year)
y que muestre solo el rango de películas lanzadas entre el 2005 y el 2010.*/


  /* Ejercicio 17: Encuentra el título de todas las películas que son de la misma categoría que "Family".*/
  
  SELECT f.title
	FROM film AS f
	INNER JOIN film_category AS fc ON f.film_id = fc.film_id
	INNER JOIN category AS c ON fc.category_id = c.category_id
	WHERE c.name = 'Family';
  
 /* He unido a traves de dos INNER JOIN las tablas film, film_category y category para encontrar todas
 las películas que están en la misma categoría que "Family" para eso he filtrado con WHERE por el nombre de la categoría solicitada.*/
 
 
 /* Ejercicio 18: Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.*/

SELECT a.first_name, a.last_name
	FROM actor AS a
	INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
	GROUP BY a.actor_id
	HAVING COUNT(fa.film_id) > 10;
    
/* He utilado un INNER JOIN para relacionar los actores con las películas usando la tabla film_actor. He usado un COUNT 
para contar cuántas películas ha hecho cada actor, agrupándolos con un GROUP BY. Finalmente he filtrado aquellos que
tienen más de 10 películas usando un HAVING >10.*/
   
   
/* Ejercicio 19: Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la
tabla film.*/

SELECT title, rating, length	
	FROM film
    WHERE rating = "R" AND length > 120;

-- He filtrado con un WHERE las películas que tienen una clasificación "R" y una duración mayor a 120 minutos.

/* Ejercicio 20: Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y
muestra el nombre de la categoría junto con el promedio de duración.*/

SELECT c.name AS nombre_categoría, AVG(f.length) AS promedio_duracion
	FROM category AS c
	INNER JOIN film_category AS fc ON c.category_id = fc.category_id -- Esta tabla me ha servido de puente entre category y film_category
	INNER JOIN film AS f ON fc.film_id = f.film_id -- Esta tabla me ha servido para relacionar film con film_category
	GROUP BY c.name -- Aqui agrupo por nombre de categoría
	HAVING AVG(f.length) > 120; -- Y aqui hago un promedio de la duración superior a 120 min


/* Ejercicio 21: Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto
con la cantidad de películas en las que han actuado.*/

SELECT CONCAT(a.first_name, " " ,a.last_name) AS nombre_actor, COUNT(fa.film_id) AS total_peliculas
	FROM actor AS a
	INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id -- En esta tabla relaciono film_actor con la tabla actor
	GROUP BY a.actor_id -- Aqui agrupo por actor_id que ya está relacionado con la cantidad de peliculas
	HAVING COUNT(fa.film_id) >= 5; -- Aqui hago un recuento de las peliculas para que el output sea mayor que 5 peliculas


/* Ejercicio 22: Encuentra el título de todas las películas que fueron alquiladas por más de 5 días.
 Utiliza una subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las
películas correspondientes.*/

-- Primero hice una sub consulta para encontrar los rental_ids con una duración de alquiler superior a 5 días:
SELECT rental_id, DATEDIFF(return_date,rental_date)
	FROM rental
	WHERE DATEDIFF(return_date,rental_date)> 5 ;

/* Aunque no lo habíamos hecho en clase, investigué y encontré que DATEDIFF
 nos da la diferencia en días entre dos fechas que en este caso serían mayor a 5 días, y así hice un WHERE
 para filtrarlo desde la tabla rental*/

-- Versión Final:
SELECT r.rental_id, f.title
	FROM rental AS r
	LEFT JOIN inventory AS i ON r.inventory_id = i.inventory_id
	LEFT JOIN film AS f ON i.film_id = f.film_id
	WHERE r.rental_id IN (
							SELECT rental_id FROM rental
							WHERE return_date IS NOT NULL 
							AND DATEDIFF(return_date, rental_date) > 5);
                            
/* He utilizado LEFT JOIN para conectar rental, inventory y film para obtener el título de la película y para 
asegurarnos de que todos los rental_id aparezcan, aunque no tengan un film_id en inventory;
además filtré con un WHERE en la tabla rental (rental_id) e incluí la primera sub consulta, 
pero le agregue al filtro WHERE return_date IS NOT NULL para evitar errores con valores NULL, y así encontré 
las películas con más de 5 días de alquiler*/


/* Ejercicio 23: Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría
"Horror". Utiliza una subconsulta para encontrar los actores que han actuado en películas de la
categoría "Horror" y luego exclúyelos de la lista de actores.*/

-- Primera sub consulta:
SELECT fa.actor_id, c.name AS nombre_categoria
	FROM film_actor AS fa 
	INNER JOIN film_category fc ON fa.film_id = fc.film_id -- Esta tabla sirve de enlace entre film_actor y film_category
	INNER JOIN category c ON fc.category_id = c.category_id -- Para vincular category y film_category
	WHERE c.name = 'Horror'; -- Usamos este filtro para encontrar todas las peliculas que estén dentro de la categoría Horror
                                
-- Versión final:

SELECT a.first_name, a.last_name
	FROM actor AS a
	WHERE a.actor_id NOT IN (SELECT fa.actor_id
								FROM film_actor AS fa
								INNER JOIN film_category AS fc ON fa.film_id = fc.film_id
								INNER JOIN category AS c ON fc.category_id = c.category_id
								WHERE c.name = 'Horror');


/* Cómo ya hemos visto la subconsulta me da un output de los actores que han actuado en películas de la categoría "Horror".
 Finalmente, la consulta principal selecciona aquellos actores que no están (NOT IN )en la lista de la subconsulta. */


/* Ejercicio 24: Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en
la tabla film.*/

-- Versión query comprobación:
SELECT title AS título, c.name AS categoria, f.length AS duración
	FROM film AS f -- Use la tabla film porque tiene los títulos de las películas y su duración
	INNER JOIN film_category AS fc ON f.film_id = fc.film_id -- Relacioné la tabla film con film_category para obtener la relación entre películas y categorías
	INNER JOIN category AS c ON fc.category_id = c.category_id -- Uní category con film_category para obtener el nombre de la categoría
	WHERE c.name = 'Comedy' AND f.length > 180; -- Filtré por el nombre de la categoría comedia y la duración que sea mayor a 180 minutos

-- Versión final:
SELECT title AS título
	FROM film AS f
	INNER JOIN film_category AS fc ON f.film_id = fc.film_id
	INNER JOIN category AS c ON fc.category_id = c.category_id
	WHERE c.name = 'Comedy' AND f.length > 180;    