-- Examen Módulo 2 - Maleni
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

-- He usado LIKE para encontrar dentro de la cadena de texto la palabra "amazing" y le he puesto el símbolo de % antes y después para que pueda encontrarlo en cuarquier parte del texto.


    
    

    