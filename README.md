# Retail Sales Analysis (SQL Project)

## Project Overview

This project involves analyzing retail sales data using **SQL (MySQL)** to uncover insights into customer behavior, sales performance, category trends, and time-based patterns. The goal is to simulate a real-world business scenario where raw transactional data is cleaned, explored, and analyzed to support data-driven decisions.

---

## Database & Table Structure

A dedicated database **`Sales_Project`** is created with a primary table:

### `retail sales analysis`

| Column Name     | Description                   |
| --------------- | ----------------------------- |
| transactions_id | Unique transaction identifier |
| sale_date       | Date of sale                  |
| sale_time       | Time of sale                  |
| customer_id     | Unique customer ID            |
| gender          | Customer gender               |
| age             | Customer age                  |
| category        | Product category              |
| quantiy         | Quantity sold                 |
| price_per_unit  | Price per unit                |
| cogs            | Cost of goods sold            |
| total_sale      | Total transaction value       |

---

Data Cleaning Steps

* Renamed corrupted column names after import
* Identified and removed records with NULL values
* Disabled safe update mode to allow controlled deletions
* Ensured dataset consistency before analysis

---

Data Exploration & Business Questions

The analysis answers key business-driven questions such as:

1. Total number of sales transactions
2. Total number of unique customers
3. Sales on a specific date
4. High-volume clothing sales in Nov 2022
5. Category-wise total sales
6. High-value transactions (>1800)
7. Gender-wise transaction distribution
8. Best-selling month per year based on average sales
9. Average customer age for Beauty category
10. Top 5 customers by total sales
11. Unique customers per category
12. Shift-wise order distribution (Morning, Afternoon, Evening)

---

SQL Concepts & Techniques Used

* Database and table creation
* Data cleaning using DELETE and NULL checks
* Aggregate functions (SUM, COUNT, AVG)
* GROUP BY with ROLLUP
* CASE statements
* Common Table Expressions (CTEs)
* Window functions (RANK)
* Date and time functions

---

Key Insights

* Certain categories contribute more significantly to overall sales
* Peak order volumes vary by time of day
* Customer purchasing behavior differs across categories and age groups
* A small group of customers generates higher sales value

---

Tools & Technologies

* **Database:** MySQL
* **Language:** SQL
* **Concepts:** Data Cleaning, Exploratory Data Analysis, Business Analytics

---

 Project Files

* `retail_sales_analysis.sql` – SQL script containing schema, cleaning, and analysis queries
* `README.md` – Project documentation

---

Conclusion

This project demonstrates practical SQL skills including data cleaning, exploratory analysis, and business-focused querying. It reflects the ability to convert raw transactional data into meaningful insights—an essential skill for a **Data Analyst** role.

---

📬 *Feel free to explore, fork, or provide feedback!*

