CREATE TABLE countries
(
    id SERIAL PRIMARY KEY,
    name CHARACTER VARYING(50)
);

CREATE TABLE producers
(
    id SERIAL PRIMARY KEY,
    company CHARACTER VARYING(50),
    country_id INT,
    CONSTRAINT fk_country
      FOREIGN KEY(country_id)
	      REFERENCES countries(id)
);

CREATE TABLE goods
(
    Id SERIAL PRIMARY KEY,
    name CHARACTER VARYING(30),
    production_date DATE,
    is_fragile BOOLEAN NOT NULL,
    price INT,
    producer_id INT,
    CONSTRAINT fk_country
      FOREIGN KEY(producer_id)
	      REFERENCES producers(id)
);



insert into countries (name) values('Ukraine');
insert into countries (name) values('USA');
insert into countries (name) values('GB');
select * from countries;

insert into producers (company, country_id) values('Roshen', 1);
insert into producers (company, country_id) values('Antonov', 1);
insert into producers (company, country_id) values('Microsoft', 2);
insert into producers (company, country_id) values('Apple', 2);
insert into producers (company, country_id) values('Burberry', 3);
insert into producers (company, country_id) values('Speedo', 3);
select * from producers;

insert into goods (name, production_date, is_fragile, price, producer_id) values('Romashka', 'Jan-08-2020', false, 9800, 1);
insert into goods (name, production_date, is_fragile, price, producer_id) values('Romashka', 'Jan-08-2020', false, 9800, 1);
insert into goods (name, production_date, is_fragile, price, producer_id) values('Romashka', 'Jan-08-2020', false, 9800, 1);
insert into goods (name, production_date, is_fragile, price, producer_id) values('Romashka', 'Jan-08-2020', false, 9800, 1);
insert into goods (name, production_date, is_fragile, price, producer_id) values('Romashka', 'Jan-08-2020', false, 9800, 1);
insert into goods (name, production_date, is_fragile, price, producer_id) values('Romashka', 'Jan-08-2020', false, 9800, 1);
insert into goods (name, production_date, is_fragile, price, producer_id) values('Romashka', 'Jan-08-2020', false, 9800, 1);
insert into goods (name, production_date, is_fragile, price, producer_id) values('Romashka', 'Jan-08-2020', false, 9800, 1);
insert into goods (name, production_date, is_fragile, price, producer_id) values('Romashka', 'Jan-08-2020', false, 9800, 1);

select * from goods;