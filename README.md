# Examen Final Módulo 2 Maleni Espinoza

Este archivo contiene consultas SQL realizadas en la base de datos Sakila, utilizada para gestionar un videoclub. Aquí explico los principales conceptos utilizados, destacando consultas con subconsultas, agregaciones y filtros avanzados.

## Conceptos más importantes utilizados:

1️⃣ JOIN (Unión de Tablas): Para conectar datos de diferentes tablas relacionadas.
2️⃣ GROUP BY y HAVING: Para agrupar datos y aplicar filtros sobre los resultados agregados.
3️⃣ SUBCONSULTAS: Para obtener valores intermedios y usarlos en la consulta principal.
4️⃣ DATEDIFF: Para calcular diferencias de fechas.
5️⃣ EXISTS vs IN: Para verificar la existencia de valores en otra tabla.
6️⃣ LEFT JOIN vs INNER JOIN: Para asegurarnos de que no perdemos información en ciertas consultas.

## Ejercicio RETO:

Ejercicio 23:
Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría
"Horror". Utiliza una subconsulta para encontrar los actores que han actuado en películas de la
categoría "Horror" y luego exclúyelos de la lista de actores.*/

SELECT a.first_name, a.last_name
	FROM actor AS a
	WHERE a.actor_id NOT IN (SELECT fa.actor_id
                                FROM film_actor AS fa
								INNER JOIN film_category AS fc ON fa.film_id = fc.film_id
								INNER JOIN category AS c ON fc.category_id = c.category_id
								WHERE c.name = 'Horror');


/* En este ejercicio la subconsulta me da un output de los actores que han actuado en películas de la categoría "Horror".
 Finalmente, la consulta principal selecciona aquellos actores que no están (NOT IN )en la lista de la subconsulta. */

## Conclusión:

Estas consultas demuestran cómo usar SQL para extraer información clave de una base de datos relacional, combinando múltiples tablas, utilizando subconsultas y aprendiendo nuevas funciones de SQL como DATEDIFF, para obtener resultados precisos.




