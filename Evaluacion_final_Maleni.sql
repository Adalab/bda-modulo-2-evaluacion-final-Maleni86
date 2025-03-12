-- Examen Módulo 2 - Maleni Espinoza

USE sakila;
-- Ejercicio 1: Selecciona todos los nombres de las películas sin que aparezcan duplicados.

SELECT DISTINCT title
	FROM film;
    
-- He usado DISTINCT para que solo me dé como outputs los nombres únicos de las peliculas y que no hayan duplicados.

-- Ejercicio 2:  Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
SELECT title, rating	
	FROM film
    WHERE rating = "PG-13";

-- He usado el WHERE para que me filtre por el rating "PG-13" según pide el enunciado y he indicado ambas columnas en el SELECT para que aparezcan en el output.

-- Ejercicio 3: Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.

SELECT title, description
	FROM film
    WHERE description LIKE "%amazing%";

/* He usado LIKE para buscar cadenas que contengan la palabra "amazing" en cualquier parte del título de la película y 
le he puesto el símbolo de % que representa cualquier número de caracteres antes o después de "amazing".*/

-- Ejercicio 4 : Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.

SELECT title, length 
	FROM film
    WHERE length > 120;
    
/* He usado un WHERE para que me filtre solo las peliculas con duración (length) mayor a 120 min,
y en el SELECT incluyo las columnas del  nombre y duración de las mismas tal como lo pide el enunciado. */

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
 y luego GROUP BY para que me agrupe todas las películas por su clasificación y me las muestre.*/

 
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
 
 
 
 
 
 
 
 
 
 
  /* Ejercicio 14: Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.*/
 



    
 
 /* Ejercicio 15: Hay algún actor o actriz que no aparezca en ninguna película en la tabla film_actor.*/
 
 
 
 
 
 
 
 
  /* Ejercicio 16: Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.*/
 






  /* Ejercicio 17: Encuentra el título de todas las películas que son de la misma categoría que "Family".*/
  
  
  
  
   /* Ejercicio 18: Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.*/
   
   
   
   
   
   
   
    /* Ejercicio 19: Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la
tabla film.*/





/* Ejercicio 20: Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y
muestra el nombre de la categoría junto con el promedio de duración.*/






/* Ejercicio 21: Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto
con la cantidad de películas en las que han actuado.*/





/* Ejercicio 22: Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una
subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las
películas correspondientes.*/




/* Ejercicio 23: Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría
"Horror". Utiliza una subconsulta para encontrar los actores que han actuado en películas de la
categoría "Horror" y luego exclúyelos de la lista de actores.*/





/* Ejercicio 24: Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en
la tabla film.*/
    