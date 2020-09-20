CREATE TABLE addresses
  (
     id   SERIAL PRIMARY KEY,
     city CHARACTER VARYING(50),
     street CHARACTER VARYING(50),
     house int,
     apartment int
  );


CREATE TABLE faculties
  (
     id   SERIAL PRIMARY KEY,
     name CHARACTER VARYING(50),
     foundation_date DATE
  );


CREATE TABLE universities
  (
     id   SERIAL PRIMARY KEY,
     name CHARACTER VARYING(50),
     foundation_date DATE
  );

CREATE TABLE faculties_universities
  (
     faculty_id INTEGER NOT NULL,
     CONSTRAINT fk_faculty FOREIGN KEY(faculty_id) REFERENCES faculties(id),
     university_id INTEGER NOT NULL,
     CONSTRAINT fk_university FOREIGN KEY(university_id) REFERENCES universities(id),
     PRIMARY KEY(faculty_id, university_id)
  );

CREATE TABLE groups
  (
     id   SERIAL PRIMARY KEY,
     name CHARACTER VARYING(50),
     foundation_date DATE,
     monitor_id int,
     faculty_id int,
     CONSTRAINT fk_faculty FOREIGN KEY(faculty_id) REFERENCES faculties(id)
  );

CREATE TABLE students
  (
     id   SERIAL PRIMARY KEY,
     first_name CHARACTER VARYING(50),
     last_name CHARACTER VARYING(50),
     sex BOOLEAN NOT NULL, -- male=1, female=0
     birthday DATE,
     address_id int,
     CONSTRAINT fk_address FOREIGN KEY(address_id) REFERENCES addresses(id),
     group_id int,
     CONSTRAINT fk_group FOREIGN KEY(group_id) REFERENCES groups(id)
  );

ALTER TABLE groups ADD CONSTRAINT fk_monitor FOREIGN KEY (monitor_id) REFERENCES students(id);

insert into addresses (city, street, house, apartment) values('Kyiv', 'Kashtanova', 11, 16); -- 1
insert into addresses (city, street, house, apartment) values('Kyiv', 'Donetska', 63, 3); -- 2
insert into addresses (city, street, house, apartment) values('Lviv', 'Lychakivska', 1, 10); -- 3
insert into addresses (city, street, house, apartment) values('Kharkiv', 'Shevchenko', 10, 1); -- 4
insert into addresses (city, street, house, apartment) values('Kharkiv', 'Polyova', 100, 16); -- 5
insert into addresses (city, street, house, apartment) values('Zhytomyr', 'Shevchenko', 9, 9); -- 6
insert into addresses (city, street, house, apartment) values('Kyiv', 'Kashtanova', 13, 22); -- 7
insert into addresses (city, street, house, apartment) values('Kharkiv', 'Polyova', 102, 13); -- 8

insert into faculties (name, foundation_date) values('Fizyka', 'Jan-08-1990'); -- 1
insert into faculties (name, foundation_date) values('Biology', 'Jun-06-2000'); -- 2
insert into faculties (name, foundation_date) values('Ukr language', 'Mar-10-2011'); -- 3
insert into faculties (name, foundation_date) values('English language', 'Jan-08-2005'); -- 4
insert into faculties (name, foundation_date) values('Math', 'Jan-08-2010'); -- 5
insert into faculties (name, foundation_date) values('Kosmics', 'Feb-10-2019'); -- 6

insert into universities (name, foundation_date) values('KPI', 'Jan-08-1947'); -- 1
insert into universities (name, foundation_date) values('Kyiv University', 'Jun-10-1923'); -- 2
insert into universities (name, foundation_date) values('Kyiv-Mohyla academy', 'Mar-10-1998'); -- 3

insert into faculties_universities (faculty_id, university_id) values(1, 1); -- Fizyka KPI
insert into faculties_universities (faculty_id, university_id) values(5, 1); -- Math KPI
insert into faculties_universities (faculty_id, university_id) values(6, 1); -- Kosmics KPI
insert into faculties_universities (faculty_id, university_id) values(1, 2); -- Fizyka  University
insert into faculties_universities (faculty_id, university_id) values(5, 2); -- Math  University
insert into faculties_universities (faculty_id, university_id) values(6, 2); -- Kosmics  University
insert into faculties_universities (faculty_id, university_id) values(2, 2); -- Biology  University
insert into faculties_universities (faculty_id, university_id) values(3, 2); -- Ukr language  University
insert into faculties_universities (faculty_id, university_id) values(4, 2); -- English language University
insert into faculties_universities (faculty_id, university_id) values(1, 3); -- Fizyka  Mohyla
insert into faculties_universities (faculty_id, university_id) values(5, 3); -- Math  Mohyla
insert into faculties_universities (faculty_id, university_id) values(2, 3); -- Biology  Mohyla
insert into faculties_universities (faculty_id, university_id) values(3, 3); -- Ukr language  Mohyla
insert into faculties_universities (faculty_id, university_id) values(4, 3); -- English language Mohyla

insert into groups (name, foundation_date, faculty_id) values('KA-19', 'Jan-08-1990', 1); -- 1  Fizyka
insert into groups (name, foundation_date, faculty_id) values('KB-19', 'Jan-08-1991', 1); -- 2  Fizyka
insert into groups (name, foundation_date, faculty_id) values('B-1', 'Jan-10-1991', 2); -- 3  Biology
insert into groups (name, foundation_date, faculty_id) values('B-2', 'Jan-10-1991', 2); -- 4  Biology
insert into groups (name, foundation_date, faculty_id) values('UKR-1', 'Mar-1-1990', 3); -- 5  Ukr language
insert into groups (name, foundation_date, faculty_id) values('UKR-2', 'Mar-1-1990', 3); -- 6  Ukr language
insert into groups (name, foundation_date, faculty_id) values('UKR-3', 'Mar-1-1990', 3); -- 7  Ukr language
insert into groups (name, foundation_date, faculty_id) values('ENG-1', 'Feb-1-2015', 4); -- 8  English language
insert into groups (name, foundation_date, faculty_id) values('ENG-2', 'Feb-1-1990', 4); -- 9  English language
insert into groups (name, foundation_date, faculty_id) values('Math-1', 'Feb-1-1990', 5); -- 10  Math
insert into groups (name, foundation_date, faculty_id) values('Math-2', 'Feb-1-1990', 5); -- 11  Math
insert into groups (name, foundation_date, faculty_id) values('Math-3', 'Feb-1-1990', 5); -- 12  Math
insert into groups (name, foundation_date, faculty_id) values('Math-4', 'Feb-1-1990', 5); -- 13  Math
insert into groups (name, foundation_date, faculty_id) values('Kosmics-1', 'Feb-1-1990', 6); -- 14  Kosmics

insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Ivan', 'Ivanov', true, 'Jan-18-1990', 1);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Stepan', 'Stepanov', true, 'Jan-18-1990', 2);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Kostyantyn', 'Kostyantynov', true, 'Jan-8-1991', 3);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Danylo', 'Danylov', true, 'Feb-10-1999', 4);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Nadia', 'Nadivko', false, 'Mar-1-1990', 5);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Oleg', 'Oleghkiv', true, 'Mar-3-1990', 6);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Maria', 'Mariyva', false, 'Feb-10-1999', 6);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Maria', 'Mariyva', false, 'Apr-23-1998', 6);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Larysa', 'Lasysko', false, 'Mar-8-1990', 6);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Tymifiy', 'Oleghkiv', true, 'Feb-10-1999', 6);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Kate', 'Katev', false, 'Apr-4-1998', 6);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Nadia', 'Nadiyv', false, 'Jan-08-1990', 3);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Danylo', 'Kryh', true, 'Apr-22-1998', 1);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Danylo', 'Kuhar', true, 'Apr-1-1998', 6);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Ivan', 'Ivanov', true, 'Jan-18-1990', 1, 1);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Stepan', 'Stepanov', true, 'Jan-18-1990', 2, 1);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Kostyantyn', 'Kostyantynov', true, 'Jan-8-1991', 3, 2);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Danylo', 'Danylov', true, 'Feb-10-1999', 4, 2);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Nadia', 'Nadivko', false, 'Mar-1-1990', 5, 3);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Oleg', 'Oleghkiv', true, 'Mar-3-1990', 6, 3);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Maria', 'Mariyva', false, 'Feb-10-1999', 6, 4);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Maria', 'Mariyva', false, 'Apr-23-1998', 6, 4);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Larysa', 'Lasysko', false, 'Mar-8-1990', 6, 5);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Tymifiy', 'Oleghkiv', true, 'Feb-10-1999', 6, 5);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Kate', 'Katev', false, 'Apr-4-1998', 6, 6);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Nadia', 'Nadiyv', false, 'Jan-08-1990', 3, 6);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Danylo', 'Kryh', true, 'Apr-22-1998', 1, 6);
insert into students (first_name, last_name, sex, birthday, address_id, group_id) values('Danylo', 'Kuhar', true, 'Apr-1-1998', 6, 6);

UPDATE students SET group_id = 14, first_name = 'Foma' WHERE id = 1;
UPDATE students SET group_id = 13, first_name = 'Ivan' WHERE id = 2;
UPDATE students SET group_id = 12, first_name = 'Den' WHERE id = 3;
UPDATE students SET group_id = 11, first_name = 'Anna' WHERE id = 4;
UPDATE students SET group_id = 10, first_name = 'Rose' WHERE id = 5;
UPDATE students SET group_id = 9, first_name = 'Oleg' WHERE id = 6;
UPDATE students SET group_id = 8, first_name = 'Ganna' WHERE id = 7;
UPDATE students SET group_id = 7, first_name = 'Lyudmyla' WHERE id = 8;
UPDATE students SET group_id = 6, first_name = 'Olena' WHERE id = 9;
UPDATE students SET group_id = 14, first_name = 'Ivan' WHERE id = 10;
UPDATE students SET group_id = 13, first_name = 'Olena' WHERE id = 11;
UPDATE students SET group_id = 14, first_name = 'Inna' WHERE id = 12;
UPDATE students SET group_id = 14, first_name = 'Gnat' WHERE id = 13;
UPDATE students SET group_id = 8, first_name = 'Foma' WHERE id = 14;


UPDATE groups SET monitor_id = 15 WHERE id = 1;
UPDATE groups SET monitor_id = 17 WHERE id = 2;
UPDATE groups SET monitor_id = 20 WHERE id = 3;
UPDATE groups SET monitor_id = 21 WHERE id = 4;
UPDATE groups SET monitor_id = 23 WHERE id = 5;
UPDATE groups SET monitor_id = 27 WHERE id = 6;
UPDATE groups SET monitor_id = 8 WHERE id = 7;
UPDATE groups SET monitor_id = 7 WHERE id = 8;
UPDATE groups SET monitor_id = 6 WHERE id = 9;
UPDATE groups SET monitor_id = 5 WHERE id = 10;
UPDATE groups SET monitor_id = 4 WHERE id = 11;
UPDATE groups SET monitor_id = 3 WHERE id = 12;
UPDATE groups SET monitor_id = 2 WHERE id = 13;
UPDATE groups SET monitor_id = 1 WHERE id = 14;

DELETE FROM students WHERE id in (22,24,25,26,28,9,10,16);

UPDATE students SET address_id = 7 WHERE id in (20, 6, 14);
UPDATE students SET address_id = 8 WHERE id in (23, 11);

-- university, faculty, group
select u.name as university, f.name as faculty, g.name as group
from groups g
join faculties f on f.id = g.faculty_id
join faculties_universities fu on fu.faculty_id = f.id
join universities u on u.id = fu.university_id
order by university, faculty

--всех студентов учащихся в одном университете(по названию университета).
select u.name as university, s.id as student_id, s.first_name, s.last_name
from students s
join groups g on g.id = s.group_id
join faculties f on f.id = g.faculty_id
join faculties_universities fu on fu.faculty_id = f.id
join universities u on u.id = fu.university_id and u.name = 'KPI' --'Kyiv-Mohyla academy'
order by s.id

--всех студентов учащихся в одном университете(по названию университета) и на одном факультете
select u.name as university, s.id as student_id, s.first_name, s.last_name, g.name as group
from students s
join groups g on g.id = s.group_id
join faculties f on f.id = g.faculty_id
join faculties_universities fu on fu.faculty_id = f.id and f.name = 'Math'
join universities u on u.id = fu.university_id and u.name = 'KPI'
order by s.id


-- количество студентов учащихся в каждом университете, факультете, группе.  (!) one faculty in diff university
select u.name as university, f.name as faculty, g.name as group, count(*)
from students s
join groups g on g.id = s.group_id
join faculties f on f.id = g.faculty_id
join faculties_universities fu on fu.faculty_id = f.id
join universities u on u.id = fu.university_id
group by u.name, f.name, g.name
order by u.name, f.name, g.name

--найти максимальное/минимальное количество студентов в группе (розложено по университетам)
SELECT Min(foo.count),
       Max(foo.count)
FROM   (SELECT u.name   AS university,
               f.name   AS faculty,
               g.name   AS group,
               Count(*) AS count
        FROM   students s
               join GROUPS g ON g.id = s.group_id
               join faculties f ON f.id = g.faculty_id
               join faculties_universities fu ON fu.faculty_id = f.id
               join universities u ON u.id = fu.university_id
        GROUP  BY u.name, f.name, g.name
        ORDER  BY u.name, f.name, g.name) foo

--найти максимальное/минимальное количество студентов в группе
(SELECT 'max',
        g.name   AS group,
        Count(*) AS count
 FROM   students s
        JOIN groups g ON g.id = s.group_id
 GROUP  BY g.name
 ORDER  BY Count(*) DESC
 LIMIT  1)
UNION ALL
(SELECT 'min',
        g.name   AS group,
        Count(*) AS count
 FROM   students s
        JOIN groups g ON g.id = s.group_id
 GROUP  BY g.name
 ORDER  BY Count(*)
 LIMIT  1)

--подсчитать количество студентов, которые живут по одному адресу(улица, дом)
SELECT adr2.street, adr2.house, adr1.count
FROM   (SELECT a.id     AS address_id,
               Count(*) AS count
        FROM   addresses a
               JOIN students s ON s.address_id = a.id
        GROUP  BY a.id) adr1
        JOIN addresses adr2 ON adr2.id = adr1.address_id
ORDER  BY adr2.street, adr2.house, adr1.count

--вывести даты рождения студентов в формате '30 Oct 16'
select TO_CHAR(birthday :: DATE, 'dd Mon yy')
from students

--вывести среднее количество людей в группе по университету
SELECT foo.university, Avg(foo.count)
FROM   (SELECT u.name   AS university,
               g.name   AS group,
               Count(*) AS count
        FROM   students s
               join GROUPS g ON g.id = s.group_id
               join faculties f ON f.id = g.faculty_id
               join faculties_universities fu ON fu.faculty_id = f.id
               join universities u ON u.id = fu.university_id --and u.name = 'KPI'
        GROUP  BY u.name, g.name
        ORDER  BY u.name, g.name) foo
GROUP  BY foo.university

--вывести всех старост групп
select g.name, s.first_name, s.last_name
from groups g
join students s on s.id = g.monitor_id

-- вывести университет, с наибольшим количеством факультетов, групп, студентов.
(SELECT 'max group number', ugc.university_name, Max(ugc.university_group_number) as maximum
FROM   (SELECT gc.university          AS university_name,
               Count(gc.group_number) AS university_group_number
        FROM   (SELECT u.name   AS university,
                       g.name   AS GROUP,
                       Count(*) AS group_number
                FROM   GROUPS g
                       join faculties f
                         ON f.id = g.faculty_id
                       join faculties_universities fu
                         ON fu.faculty_id = f.id
                       join universities u
                         ON u.id = fu.university_id
                GROUP  BY u.name,
                          g.name) gc
        GROUP  BY gc.university) ugc
GROUP  BY ugc.university_name
order by 2 desc
limit 1)
union
(SELECT 'max faculty number', ufc.university_name, Max(ufc.university_faculty_number) as maximum
FROM   (SELECT fc.university          AS university_name,
               Count(fc.faculty_number) AS university_faculty_number
        FROM   (SELECT u.name   AS university,
                       f.name as faculty,
                       Count(*) AS faculty_number
                FROM   faculties f
                       join faculties_universities fu
                         ON fu.faculty_id = f.id
                       join universities u
                         ON u.id = fu.university_id
                GROUP  BY u.name,
                          f.name) fc
        GROUP  BY fc.university) ufc
GROUP  BY ufc.university_name
order by 2 desc
limit 1)
union
(SELECT 'max student number', usc.university_name, Max(usc.university_student_number) as maximum
FROM   (SELECT sc.university          AS university_name,
               Count(sc.student_number) AS university_student_number
        FROM   (SELECT u.name   AS university,
                       s.id   AS student,
                       Count(*) AS student_number
                FROM   students s
				       join groups g ON g.id = s.group_id
                       join faculties f ON f.id = g.faculty_id
                       join faculties_universities fu ON fu.faculty_id = f.id
                       join universities u ON u.id = fu.university_id
                GROUP  BY u.name,
                          s.id) sc
        GROUP  BY sc.university) usc
GROUP  BY usc.university_name
order by 2 desc
limit 1)