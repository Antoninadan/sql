CREATE TABLE countries
  (
     id   SERIAL PRIMARY KEY,
     NAME CHARACTER VARYING(50)
  );

CREATE TABLE producers
  (
     id         SERIAL PRIMARY KEY,
     company    CHARACTER VARYING(50),
     country_id INT,
     CONSTRAINT fk_country FOREIGN KEY(country_id) REFERENCES countries(id)
  );

CREATE TABLE goods
  (
     id              SERIAL PRIMARY KEY,
     NAME            CHARACTER VARYING(30) UNIQUE,
     production_date DATE,
     is_fragile      BOOLEAN NOT NULL,
     price           INT,
     producer_id     INT,
     CONSTRAINT fk_country FOREIGN KEY(producer_id) REFERENCES producers(id)
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
insert into goods (name, production_date, is_fragile, price, producer_id) values('Chervonyy Mak', 'Jun-06-2020', false, 11000, 1);
insert into goods (name, production_date, is_fragile, price, producer_id) values('AN-60', 'Mar-10-2018', true, 100000000, 2);
insert into goods (name, production_date, is_fragile, price, producer_id) values('Windows 10', 'Jan-08-2020', false, 240000, 3);
insert into goods (name, production_date, is_fragile, price, producer_id) values('Skype for Business', 'Jan-08-2020', false, 5000, 3);
insert into goods (name, production_date, is_fragile, price, producer_id) values('Iphone 5', 'Jan-08-2020', true, 3200000, 4);
insert into goods (name, production_date, is_fragile, price, producer_id) values('Iphone 7', 'Jan-08-2020', true, 4500000, 4);
insert into goods (name, production_date, is_fragile, price, producer_id) values('Iphone 8', 'Feb-10-2019', true, 5500000, 4);
insert into goods (name, production_date, is_fragile, price, producer_id) values('Iphone 9', 'Sep-11-2020', true, 6600000, 4);
insert into goods (name, production_date, is_fragile, price, producer_id) values('Swimming trunks', 'Sep-01-2018', true, 45000, 6);
insert into goods (name, production_date, is_fragile, price, producer_id) values('Goggle', 'Jun-15-2020', true, 32000, 1);

select * from goods;

--1) Oдного производителя, хрупкие
select * from goods
where producer_id = 4 and is_fragile = true;


--2) Товары, произведенные между двумя датами
select * from goods
where production_date between 'Jan-08-2020' and 'Jun-15-2020'


--3) Товары, цена которых лежит в определенном промежутке.
select * from goods
where price between 240000 and 4500000

select * from goods
where price >= 240000 and price <= 4500000


--4) Выбрать товары, которые начинаются с определенной(ых) букв.
select * from goods
where lower(name) LIKE 'i%'


--5) Вывести товары, отсортированные по дате производства(сортировать по убыванию и возрастанию) и вывести только 5 первых.
select * from goods
order by production_date desc
limit 5

select * from goods
order by production_date
limit 5

--6) Вывести строку в формате " название товар -> цена $, название фирмы # страна производителя"
SELECT '"'
       || g.NAME
       || ' -> '
       || g.price
       || '$, '
       || p.company
       || ' # '
       || c.NAME
       || '"'
FROM   goods g
       JOIN producers p
         ON p.id = g.producer_id
       JOIN countries c
         ON c.id = p.country_id


-- - по одному производителю и посчитать сумму всего товара
select producer_id,  sum(price) from goods
where producer_id = 4
group by producer_id


--- по производителям, у к-рых название начинается с буквы (использовать свои варианты) и посчитать сумму всего товара
select p.company,  sum(g.price)
from goods g
join producers p on p.id = g.producer_id
where lower(p.company) like 'a%'
group by p.company


--- по одному производителю и стране и посчитать кол-во всего товара и вывести данные о производитиеле и стране где больше 2 товаров
SELECT pro.company_name,
       pro.country_name,
       Count(*)
FROM   goods g
       JOIN (SELECT p.id      AS p_id,
                    p.company AS company_name,
                    c.NAME    AS country_name
             FROM   producers p,
                    countries c
             WHERE  c.id = p.country_id
                    AND c.NAME = 'USA'
                    AND p.id = 4) pro
         ON pro.p_id = g.producer_id
GROUP  BY pro.company_name,
          pro.country_name
HAVING Count(*) >= 2


-- по хрупкости посчитать кол-во всего товара
SELECT g.is_fragile, count(*)
FROM   goods g
GROUP  BY g.is_fragile