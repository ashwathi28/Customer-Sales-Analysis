/* Inspecting data */
SELECT * FROM sales_data_sample;

/* Checking for unique values */

SELECT DISTINCT status FROM sales_data_sample;

SELECT DISTINCT year_id FROM sales_data_sample;

SELECT DISTINCT productline FROM sales_data_sample;

SELECT DISTINCT country FROM sales_data_sample;

SELECT DISTINCT dealsize FROM sales_data_sample;

SELECT DISTINCT territory FROM sales_data_sample;

/* Analysis */

/* Grouping sales by productline */
SELECT productline, SUM(sales) AS Revenue
FROM sales_data_sample 
GROUP BY productline
ORDER BY 2 DESC;

/* Grouping sales with year_id */
SELECT year_id, SUM(sales) AS Revenue
FROM sales_data_sample 
GROUP BY year_id
ORDER BY 2 DESC;

/* Grouping sales with dealsize */
SELECT dealsize, SUM(sales) AS Revenue
FROM sales_data_sample 
GROUP BY dealsize
ORDER BY 2 DESC;

/* Total revenue earned and the number of orders in each month for the year 2003 */
SELECT month_id, SUM(sales) AS Revenue, COUNT(ordernumber) AS Frequency
FROM sales_data_sample
WHERE year_id = 2003
GROUP BY month_id
ORDER BY 2 DESC;
/* November seems to be the best month for sales in the year 2003. */

/* What products were popular in the month of November for the year 2003? */
SELECT month_id, productline, SUM(sales) AS Revenue, COUNT(ordernumber) AS Frequency
FROM sales_data_sample
WHERE year_id = 2003 AND month_id = 11
GROUP BY month_id, productline
ORDER by 3 DESC;
/* 'Classic Cars', 'Vintage Cars' and 'Trucks and Buses' were some of the most popular product lines in the month of November fro the year 2003. */

/* Total revenue earned and the number of orders in each month for the year 2004 */
SELECT month_id, SUM(sales) AS Revenue, COUNT(ordernumber) AS Frequency
FROM sales_data_sample
WHERE year_id = 2004
GROUP BY month_id
ORDER BY 2 DESC;
/* November seems to be the best month for sales in the year 2004. */

/* What product lines were popular in the month of November for the year 2004? */
SELECT month_id, productline, SUM(sales) AS Revenue, COUNT(ordernumber) AS Frequency
FROM sales_data_sample
WHERE year_id = 2004 AND month_id = 11
GROUP BY month_id, productline
ORDER by 3 DESC;
/* 'Classic Cars', 'Vintage Cars' and 'Motorcycles' were the most popular product lines in the month of November for the year 2004. */

/* Total revenue earned and the number of orders in each month for the year 2005 */
SELECT month_id, SUM(sales) AS Revenue, COUNT(ordernumber) AS Frequency
FROM sales_data_sample
WHERE year_id = 2005
GROUP BY month_id
ORDER BY 2 DESC;
/* May seems to be the best month for sales in the year 2005. */

/* Which product lines were the most popular in the month of May for the year 2005? */
SELECT month_id, productline, SUM(sales) AS Revenue, COUNT(ordernumber) AS Frequency
FROM sales_data_sample
WHERE year_id = 2005 AND month_id = 5
GROUP BY month_id, productline
ORDER by 3 DESC;
/* The top 3 product lines were 'Classic Cars, 'Trucks and Buses and 'Vintage Cars' in the month of May for the year 2005. */

/* Most frequent customer and thier monetary value, average monetary value, most recent order date and the maximum order date */
SELECT
	customername, 
	SUM(sales) MonetaryValue,
	AVG(sales) AvgMonetaryValue,
	COUNT(ordernumber) Frequency,
	MAX(orderdate) last_order_date,
	(SELECT MAX(orderdate) FROM sales_data_sample) max_order_date
FROM sales_data_sample
GROUP BY customername
ORDER BY Frequency DESC;
/* 'Euro Shopping Channel' seems to have the highest frequency in terms of orders. */

/* Which country has the highest sales? */
SELECT country, SUM(sales) AS Revenue
FROM sales_data_sample
GROUP BY country
ORDER BY 2 DESC;
/* It is evident that the USA has the highest sales amongst all the other countries. */

/* Which city in the United States has the highest sales? */
SELECT city, SUM(sales) AS Revenue
FROM sales_data_sample
WHERE country = 'USA'
GROUP BY city
ORDER BY 2 DESC;
/* San Rafael has the highest sales in the USA. */

/* What is the most popular productline in the United States? */
SELECT country, year_id, productline, SUM(sales) AS Revenue
FROM sales_data_sample
WHERE country = 'USA'
GROUP BY  country, year_id, productline
ORDER BY 4 DESC;
/* Classic Cars is the most popular productline in the USA. */

/* Which territory has the highest sales? */
SELECT territory, SUM(sales) AS Revenue
FROM sales_data_sample
GROUP BY territory
ORDER BY 2 DESC;
/* Territory EMEA seems to have the highest revenue. */

/* How many orders were cancelled in the United States? */
SELECT country, year_id, customername, productline, dealsize, status, COUNT(ordernumber) AS Frequency
FROM sales_data_sample
WHERE country = 'USA' AND status = 'Cancelled'
GROUP BY country, year_id, customername, productline, dealsize, status
ORDER BY 7 DESC;
/* It is interesting to note that all the orders that were cancelled in the USA were from the customer 'Land of Toys Inc.'. 
Also, all the orders that were cancelled took place in the year 2004 and thenone of the deal sizes were large. */



