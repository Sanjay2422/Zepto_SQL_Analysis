# Zepto_SQL_Analysis
SQL data analysis of retail grocery inventory. Cleans raw pricing data and evaluates out-of-stock patterns, discount efficiency, and category revenue potential.


# Zepto Retail SQL Analysis 🛒

## 📌 Project Overview
This project performs an exploratory data analysis (EDA) and business intelligence extraction on a rapid-delivery retail dataset. Using SQL, the project cleans raw inventory data, standardizes pricing structures, and uncovers actionable insights regarding stock health, discounting strategies, and revenue forecasting.

## 📂 Dataset Summary
The analysis is based on the `zepto_v2` dataset containing over 3,700 active product SKUs distributed across 14 categories. 

**Key Metrics Extracted:**
* **Total Inventory Units:** ~14,959 
* **Out of Stock Items:** 453
* **Estimated Total Inventory Value:** ₹2.24 Million
* **Average Product Discount:** 7.62%

## 🛠️ Tech Stack
* **Language:** SQL
* **Database:** SQL Server (T-SQL)
* **Key Techniques:** Data Cleaning, Aggregation, Subqueries, Conditional Logic (`CASE` statements), and Arithmetic Transformations.

## 📊 Key Analytical Queries
1. **Data Cleaning:** Filtering out invalid records (e.g., MRP = 0) and converting monetary values from paise to standard rupees.
2. **Stockout Analysis:** Identifying high-value items (MRP > ₹300) that are currently out of stock, highlighting immediate missed revenue opportunities.
3. **Revenue Projection:** Calculating estimated total revenue potential grouped by product category.
4. **Discount Efficiency:** Identifying the top 5 categories offering the highest average discount percentages.
5. **Value Metrics:** Calculating the precise price-per-gram for products over 100g to determine optimal customer value.
6. **Logistics Segmentation:** Grouping products into `Low`, `Medium`, and `Bulk` weight categories to assist with delivery logistics planning.

## 🚀 How to Run
1. Create a database named `Zepto_SQL_Analysis`.
2. Import the `zepto_v2.csv` file into a table named `zepto_v2`.
3. Execute the provided SQL script to perform the data cleaning and extraction queries.
