CREATE TABLE Dept
  (
     Id   SERIAL PRIMARY KEY,
     City CHARACTER VARYING(50),
     UNIQUE(City)
  );

CREATE TABLE Empl
  (
     Id   SERIAL PRIMARY KEY,
     FirstName CHARACTER VARYING(50),
     LastName CHARACTER VARYING(50),
     DeptId int,
     CONSTRAINT fk_dept FOREIGN KEY(DeptId) REFERENCES Dept(Id)
  );


insert into Dept (City) values('Kyiv'); -- 1
insert into Dept (City) values('Lviv'); -- 2
insert into Dept (City) values('Kharkiv'); -- 3
insert into Dept (City) values('Dnipro'); -- 4
insert into Dept (City) values('Dobropillya'); -- 5
select * from Dept


insert into Empl (FirstName, LastName, DeptId) values('Ivan', 'Ivanov', 1);
insert into Empl (FirstName, LastName, DeptId) values('Stepan', 'Stepanov', 1);
insert into Empl (FirstName, LastName, DeptId) values('Kostyantyn', 'Kostyantynov', 2);
insert into Empl (FirstName, LastName, DeptId) values('Danylo', 'Danylov', 2);
insert into Empl (FirstName, LastName, DeptId) values('Nadia', 'Nadivko', 4);
insert into Empl (FirstName, LastName, DeptId) values('Oleg', 'Oleghkiv', 4);
insert into Empl (FirstName, LastName, DeptId) values('Maria', 'Mariyva', 4);
insert into Empl (FirstName, LastName, DeptId) values('Larysa', 'Lasysko', 5);
insert into Empl (FirstName, LastName, DeptId) values('Tymifiy', 'Oleghkiv', 5);
insert into Empl (FirstName, LastName, DeptId) values('Kate', 'Katev', 1);
insert into Empl (FirstName, LastName) values('Nadia', 'Nadiyv');

--выведите список городов, где находятся подразделения компании
select city from dept

--выведите список имен работников (без повторов, упорядочен по алфавиту)
select distinct firstname from empl
order by firstname

--подсчитайте, сколько работников у компании в заданном подразделении (номер)
select count(*) from empl
where deptId = 1

--получите список количества работников в каждом подразделении (номер). Упорядочить по убыванию числа работников
select deptId as dept_number, count(*) as employee_count from empl
group by deptId
order by count(*) desc

--получите список количества работников в каждом подразделении (номер). Упорядочить по названия городов, где располагается подразделение


--выберите список городов, содержащие букву "d" в начате слова
select *
from dept
where lower(city) like 'd%'

--выберите список всех городов, содержащих букву "" в среедине слова и соответсвующее количество работкниа напротив каджого названия.
--Учесть, что в таблице подразделений может быть город, в котором отсуствуют работник, и в таблице работнико могут быть такие,
-- для которых данные поля deptId = null
SELECT p_empl.city   AS city_name,
       Count(*) AS employee_count
FROM   empl
       JOIN (
            -- select empl with '_%p%_'
            SELECT e.id   AS id,
                   d.city AS city
             FROM   empl e
                    JOIN dept d
                      ON d.id = e.deptid
             WHERE  Lower(d.city) LIKE '_%p%_') p_empl
         ON p_empl.id = empl.id
GROUP  BY p_empl.city

--выберите список людей, имеющих однофамильцев. Упорядочить по алфавиту
SELECT firstname,
       lastname
FROM   empl
WHERE  lastname IN (SELECT lastname
                    FROM   empl
                    GROUP  BY lastname
                    HAVING Count(*) > 1)
ORDER  BY lastname

--выберите список людей, имеющих несоклько полных совпадений имени и фамилий из города "Dnipro" и упорядочить по именам