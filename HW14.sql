--���� ��� �������: ������� category � ������ id � name � ������� page � ������ id, name � category_id. ��������� ����� �������� ��� �������� ������ � �� �����������.
SELECT page.id, page.name, page.category_id, category.name AS categoryName
FROM page
 LEFT OUTER JOIN category  ON category.id = page.category_id

 --���� 3 �������: ������� category � ������ id � name, ������� sub_category � ������ id � name � ������� page � ������ id, name � sub_category_id. 
 --��������� ����� �������� ��� �������� ������ � �� �������������� � �����������. 
SELECT page.id, page.name, category.name AS categoryName, sub_category.name ASsubCategoryName
FROM page 
LEFT OUTER JOIN sub_category ON sub_category.id = page.sub_category_id 
LEFT OUTER JOIN category ON page.category_id = category.id

-- ������� ��������������� �� ���������� ������� (�� ��������) � ����� (�� �����������) ������ ����������, ����������� ���� �� 1 �������.
SELECT Passenger.name, COUNT(distinct Trip.id) AS countOfTrip
FROM Trip
INNER JOIN Pass_in_trip ON Trip.id = Pass_in_trip.trip_id 
INNER JOIN Passenger ON Pass_in_trip.passenger_id = Passenger.id
GROUP BY Passenger.id, Passenger.name
HAVING        (COUNT(Trip.id) > 0)
ORDER BY countOfTrip DESC, Passenger.name


