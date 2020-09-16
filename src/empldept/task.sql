CREATE TABLE Dept
  (
     Id   SERIAL PRIMARY KEY,
     City CHARACTER VARYING(50)
  );

CREATE TABLE Empl
  (
     Id   SERIAL PRIMARY KEY,
     FirstName CHARACTER VARYING(50)
     LastName CHARACTER VARYING(50)
     CONSTRAINT fk_dept FOREIGN KEY(DeptId) REFERENCES Dept(Id)
  );


insert into Dept (City) values('Kyiv');
insert into Dept (City) values('Lviv');
insert into Dept (City) values('Kharkiv');
insert into Dept (City) values('Dnipro');
insert into Dept (City) values('Dobropillya');
select * from Dept


