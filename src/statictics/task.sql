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