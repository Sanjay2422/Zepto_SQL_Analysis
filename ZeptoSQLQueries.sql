

create database Zepto_SQL_Analysis

use Zepto_SQL_Analysis

drop table if exists zepto

CREATE TABLE zepto_v2 (
    sku_id INT IDENTITY(1,1) PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BIT,	
    quantity INTEGER
)

--data exploration
--count of rows

select count(*) from zepto_v2
select * from zepto_v2

--sample data

SELECT TOP 10 * FROM zepto_v2

--null values

SELECT * FROM zepto_v2
WHERE name IS NULL OR name = ''
OR category IS NULL OR category = ''
OR mrp IS NULL
OR discountPercent IS NULL
OR discountedSellingPrice IS NULL
OR weightInGms IS NULL
OR availableQuantity IS NULL
OR outOfStock IS NULL
OR quantity IS NULL;



--different product categories

SELECT DISTINCT category
FROM zepto_v2
ORDER BY category

--products in stock vs out of stock


SELECT outOfStock, COUNT(*) AS ItemCount, SUM(availableQuantity) AS TotalAvailableQuantity
FROM zepto_v2
GROUP BY outOfStock


select * from  zepto_v2

--product names present multiple times

SELECT name, COUNT(sku_id) AS "Number of SKUs"
FROM zepto
GROUP BY name
HAVING count(sku_id) > 1
ORDER BY count(sku_id) DESC

--OR

SELECT name, COUNT(*) AS NameCount
FROM zepto_v2
GROUP BY name
HAVING COUNT(*) > 1;

SELECT * 
FROM zepto_v2
WHERE name IN (
    SELECT name
    FROM zepto_v2
    GROUP BY name
    HAVING COUNT(*) > 1
)
ORDER BY name;

--data cleaning

--products with price = 0

SELECT * FROM zepto_v2
WHERE mrp = 0 OR discountedSellingPrice = 0

DELETE FROM zepto_v2
WHERE mrp = 0;

--convert paise to rupees

UPDATE zepto_v2
SET mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0

SELECT mrp, discountedSellingPrice FROM zepto_v2

--Data Analysis

-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT TOP 10 name, mrp, discountPercent
FROM zepto_v2
ORDER BY discountPercent DESC

--Q2.What are the Products with High MRP but Out of Stock


select distinct name,mrp 
from zepto_v2 
where outOfStock = 'True' and mrp>300 
order by mrp desc


--Q3.Calculate Estimated Revenue for each category

SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto_v2
GROUP BY category
ORDER BY total_revenue

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.

SELECT DISTINCT name, mrp, discountPercent
FROM zepto_v2
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC

-- Q5. Identify the top 5 categories offering the highest average discount percentage.

SELECT TOP 5 category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto_v2
GROUP BY category
ORDER BY avg_discount DESC

-- Q6. Find the price per gram for products above 100g and sort by best value.

SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto_v2
WHERE weightInGms >= 100
ORDER BY price_per_gram

--Q7.Group the products into categories like Low, Medium, Bulk.

SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto_v2

--Q8.What is the Total Inventory Weight Per Category 

SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto_v2
GROUP BY category
ORDER BY total_weight

