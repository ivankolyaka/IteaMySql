
--1) Restricting and Sorting Data  
--Таблица Employees. Получить список всех сотрудников, в которых в имени содержатся минимум 2 буквы 'n'
SELECT *
  FROM [itea].[dbo].[EMPLOYEES]
  WHERE FIRST_NAME like '%n%n%';
--Таблица Employees. Получить список всех сотрудников, у которых длина имени более 4 букв.
SELECT *
  FROM [itea].[dbo].[EMPLOYEES]
  WHERE len(FIRST_NAME)>4;
--Таблица Employees. Получить список всех сотрудников, у которых в имени содержится символ '%'
SELECT *
  FROM [itea].[dbo].[EMPLOYEES]
  WHERE FIRST_NAME like '%\%%' ESCAPE '\';
--Таблица Employees. Получить список всех сотрудников, у которых зарплата находится в промежутке от 8000 до 9000 (включительно)
SELECT *
  FROM [itea].[dbo].[EMPLOYEES]
  WHERE SALARY BETWEEN 8000 AND 9000;
--Таблица Employees. Получить список всех ID менеджеров
SELECT DISTINCT MANAGER_ID
  FROM [itea].[dbo].[EMPLOYEES];


--2) Используя Single-Row Functions to Customize Output
--Таблица Employees. Получить список всех сотрудников, у которых длина имени более 10 букв.
SELECT *
  FROM [itea].[dbo].[EMPLOYEES]
  WHERE len(FIRST_NAME)>10;
--Таблица Employees. Получить первое 3х значительное число телефонного номера сотрудника, если его номер в формате ХХХ.ХХХ.ХХХХ
SELECT LEFT(PHONE_NUMBER,3)
  FROM [itea].[dbo].[EMPLOYEES]
  where EMPLOYEE_ID=1;
--Таблица Employees. Получить список всех сотрудников у которых последняя буква в имени равна 'm' и длинной имени больше 5ти
SELECT LEFT(PHONE_NUMBER,3)
  FROM [itea].[dbo].[EMPLOYEES]
  WHERE FIRST_NAME like '%m' AND len(FIRST_NAME)>5;

--Таблица Employees. Получить список всех сотрудников заменив в значении PHONE_NUMBER все '.' на '-' 
SELECT *, REPLACE(PHONE_NUMBER,'.','-') as pnumb
  FROM [itea].[dbo].[EMPLOYEES];

--3) Functions and Conditional Expressions
--Таблица Employees. Получить список всех сотрудников пришедших на работу в первый день месяца (любого)
SELECT *
  FROM [itea].[dbo].[EMPLOYEES]
  WHERE DAYOFMONTH(HIRE_DATE)=1;

--Таблица Employees. Получить список всех сотрудников, которые пришили на работу в феврале 2007 года.
SELECT *
  FROM [itea].[dbo].[EMPLOYEES]
  WHERE YEAR(HIRE_DATE)=2007 AND MONTH(HIRE_DATE)=2;

--4) Reporting Aggregated Data Using the Group Functions
--Таблица Employees. Сколько сотрудников имена которых начинаются с одной и той же буквы? Сортировать по количеству. Показывать только те, где количество больше 1
SELECT LEFT(FIRST_NAME,1) as chr, COUNT(EMPLOYEE_ID) as CountEmp
  FROM [itea].[dbo].[EMPLOYEES]
  GROUP BY LEFT(FIRST_NAME,1)
  HAVING COUNT(EMPLOYEE_ID)>1
order by COUNT(EMPLOYEE_ID);

--аблица Employees. Получить репорт сколько сотрудников взяли на работу по годам. Сортировать по количеству
SELECT YEAR(HIRE_DATE) as yar, COUNT(EMPLOYEE_ID) as CountEmp
  FROM [itea].[dbo].[EMPLOYEES]
  GROUP BY YEAR(HIRE_DATE)
 -- HAVING COUNT(EMPLOYEE_ID)>0
order by COUNT(EMPLOYEE_ID);


--5) Displaying Data from Multiple Tables Using Joins
--Таблица Employees, Departamentos, Locations, Countries, Regions. Получить список регионов и количество сотрудников в каждом регионе
SELECT        REGIONS.REGION_NAME, COUNT(EMPLOYEES.EMPLOYEE_ID) AS CountEmplByRegion
FROM            COUNTRIES INNER JOIN
                         REGIONS ON COUNTRIES.REGION_ID = REGIONS.REGION_ID INNER JOIN
                         LOCATIONS ON COUNTRIES.COUNTRY_ID = LOCATIONS.COUNTRY_ID INNER JOIN
                         DEPARTMENTS INNER JOIN
                         EMPLOYEES ON DEPARTMENTS.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID ON LOCATIONS.LOCATION_ID = DEPARTMENTS.LOCATION_ID
GROUP BY REGIONS.REGION_NAME
--Таблица Employees, Job_history. В таблице Employee хранятся все сотрудники. В таблице Job_history хранятся сотрудники покинувшие компанию. Получить репорт о всех сотрудниках и о его статусе в компании (Работает или покинул компанию с датой ухода)
SELECT   distinct     EMPLOYEES.FIRST_NAME, CASE WHEN JOB_HISTORY.EMPLOYEE_ID IS NULL THEN 'is working' ELSE 'not working' END CASE as wrkStatus
FROM            EMPLOYEES LEFT OUTER JOIN
                         JOB_HISTORY ON EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID;


