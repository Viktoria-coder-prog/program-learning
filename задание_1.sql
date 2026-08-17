--1.	Выведите авторов, имеющихся в базе.
select *
from author;

--2.	Найдите всех авторов с инициалами «С. А.». Автор в базе определяется так: И. О. Фамилия
SELECT *
FROM author a 
WHERE a.name LIKE 'С. А. %';

--3.	Выведите список книг, выпущенных в издательстве «Мир».
SELECT b.title 
FROM book b , publisher p 
WHERE b.publisher_id = p.id
      AND p.name = 'Мир';

--4.	Выведите количество книг, принадлежащих каждой из категорий. Результат отсортировать по возрастанию.
SELECT COUNT(b.category_id )
FROM book b
GROUP BY b.category_id       
ORDER BY COUNT(b.category_id) ASC;

--5.	Выведите количество книг, выпущенных в каждом издательстве. В итоговом списке оставьте только те издательства, 
--которые выпустили 3 и более книг. Результат отсортировать по убыванию.
SELECT p.name , COUNT(b.title)
FROM publisher p , book b 
WHERE b.publisher_id = p.id 
GROUP BY p.name 
HAVING COUNT(b.title) >= 3
ORDER BY COUNT(b.title) DESC ;

--6.	Выведите список книг, автором которых являлся «С. А. Айвазян».
SELECT b.title 
FROM book b , author a , authorbook a2
WHERE a.id = a2.author_id  
     AND b.id = a2.book_id 
     AND a.name = 'С. А. Айвазян';

--7.	В каких издательствах и сколько выпускались книги за авторством «С. А. Айвазян». Результат отсортировать по убыванию.
SELECT p.name , COUNT(b.title)
FROM publisher p , book b , author a , authorbook a2 
WHERE a.id = a2.author_id  
     AND b.id = a2.book_id 
     AND p.id = b.publisher_id 
     AND a.name = 'С. А. Айвазян'
GROUP BY p.name 
ORDER BY COUNT(b.title) DESC ;