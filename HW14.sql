--ƒаны две таблицы: таблица category с пол€ми id и name и таблица page с пол€ми id, name и category_id. ƒостаньте одним запросом все страницы вместе с их категори€ми.
SELECT page.id, page.name, page.category_id, category.name AS categoryName
FROM page
 LEFT OUTER JOIN category  ON category.id = page.category_id

 --ƒаны 3 таблицы: таблица category с пол€ми id и name, таблица sub_category с пол€ми id и name и таблица page с пол€ми id, name и sub_category_id. 
 --ƒостаньте одним запросом все страницы вместе с их подкатегори€ми и категори€ми. 
SELECT page.id, page.name, category.name AS categoryName, sub_category.name ASsubCategoryName
FROM page 
LEFT OUTER JOIN sub_category ON sub_category.id = page.sub_category_id 
LEFT OUTER JOIN category ON page.category_id = category.id

-- ¬ывести отсортированный по количеству поездок (по убыванию) и имени (по возрастанию) список пассажиров, совершивших хот€ бы 1 переезд.
SELECT Passenger.name, COUNT(distinct Trip.id) AS countOfTrip
FROM Trip
INNER JOIN Pass_in_trip ON Trip.id = Pass_in_trip.trip_id 
INNER JOIN Passenger ON Pass_in_trip.passenger_id = Passenger.id
GROUP BY Passenger.id, Passenger.name
HAVING        (COUNT(Trip.id) > 0)
ORDER BY countOfTrip DESC, Passenger.name


