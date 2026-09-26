
drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
Category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(8,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

-- DATA EXPLORATION
SELECT * FROM zepto;

--1.count of rows
SELECT COUNT(*) FROM zepto;


--2.sample data
SELECT * FROM zepto
LIMIT 10;

--3. Null Value
SELECT * FROM zepto
WHERE name IS NULL 
OR
Category is null
or
mrp is null
or
discountPercent is null
or
availableQuantity is null
or

discountedSellingPrice is null
or
weightinGms is null
or

outOfStock is null
or
quantity is null
;

-- 4.Different Product Category
SELECT DISTINCT category
FROM zepto
ORDER BY category;

-- 5. product name present multiple times

SELECT name , COUNT(sku_id) as "Name of SKUs"
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;


--DATA CLEANUIG 

-- 6.Products with price = 0
SELECT * FROM zepto
WHERE mrp = 0 
OR 
discountedSellingPrice = 0;

--7. 
DELETE FROM zepto where mrp =0;

-- convert pais to rupyes

UPDATE zepto
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

SELECT * FROM zepto;




-- "{ Some busness Question Sovle }" --

-- Q1. Find the top 10 best-value products based on the discount percentage.
-- Me
SELECT name , discountpercent FROM zepto
ORDER BY  discountpercent DESC 
LIMIT 10;

-- Tuitorial
SELECT DISTINCT name , mrp , discountpercent
FROM zepto
ORDER BY  discountpercent DESC
LIMIT 10;

-- Q2. what are the Products with MRP but Out of Stock
-- ME
SELECT  name ,mrp , outofstock
FROM zepto
WHERE outofstock = True 
ORDER BY mrp DESC;

-- Totorial
SELECT name , mrp 
FROM zepto
WHERE outofstock = TRUE and mrp > 300
ORDER BY mrp DESC;


-- Q3.Calculate Estimate Revenue for each category
-- ME
SELECT name , COUNT(category) as "Estimate Category Revenue"
FROM zepto
GROUP BY name
ORDER BY COUNT(category) DESC
;


-- Tuitorial

SELECT category ,
SUM(discountedSellingPrice * availablequantity) AS total_revenue 
FROM zepto
GROUP BY category ORDER BY total_revenue;


--Q4. Find all Products where MRP is greater than 500 and discount is less than 10%
-- ME
SELECT name,mrp,discountpercent FROM zepto
WHERE mrp > 500 and discountpercent < 10
ORDER BY mrp DESC;

-- Tuitorial
SELECT DISTINCT name , mrp ,discountpercent  
FROM zepto
WHERE mrp > 500 AND discountpercent  <10
ORDER BY mrp DESC , discountpercent  DESC;

-- Q.5 Identity the top 5 category offering the highest average discount percentage.
-- ME 
SELECT DISTINCT category , AVG(discountpercent) AS average_discount 
FROM zepto
GROUP BY category
ORDER BY average_discount DESC LIMIT 5;


-- Tuitorial
SELECT category ,
ROUND(AVG(discountpercent),2) AS average_discount
FROM zepto
GROUP BY category
ORDER BY average_discount DESC 
LIMIT 5;





















SELECT avg(mrp) FROM zepto;


SELECT sum(mrp) FROM zepto;


SELECT min(mrp) FROM zepto;


SELECT max(mrp) FROM zepto;


SELECT name , mrp FROM zepto
WHERE mrp >(SELECT AVG(mrp) FROM zepto) LIMIT(10);

SELECT avg(mrp) FROM zepto;

SELECT * FROM zepto ASC;()

drop table if exists zepto;


--count of rows

SELECT COUNT(*) FROM zepto;

--sample data

SELECT * FROM zepto
LIMIT 10;


SELECT avg(mrp) FROM zepto;


SELECT sum(mrp) FROM zepto;


SELECT min(mrp) FROM zepto;


SELECT max(mrp) FROM zepto;


SELECT name , mrp FROM zepto
WHERE mrp >(SELECT AVG(mrp) FROM zepto) LIMIT(10);

SELECT avg(mrp) FROM zepto;

SELECT * FROM zepto 

where name is null
or
Category is null
or
mrp is null
or
discountPercent is null
or
availableQuantity is null
or

discountedSellingPrice is null
or
weightinGms is null
or

outOfStock is null
or
quantity is null
;


