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
     faculty_id int,
     CONSTRAINT fk_faculty FOREIGN KEY(faculty_id) REFERENCES faculties(id),
     university_id int,
     CONSTRAINT fk_university FOREIGN KEY(university_id) REFERENCES universities(id)
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