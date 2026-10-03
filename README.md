# E-Commerce Sales Analytics using MySQL

* Project Overview

This project analyses e-commerce sales data using MySQL to understand sales performance, customer behavior, product performance, revenue trends, and payment patterns.

The project uses multiple relational tables and SQL queries to perform business-oriented data analysis.

* Project Objectives

- Analyse total revenue and completed orders
- Calculate Average Order Value (AOV)
- Identify top-selling products
- Analyse category-wise revenue
- Analyse city-wise and customer-wise revenue
- Understand payment methods and payment status
- Analyse cancelled orders
- Identify product and category performance
- Practice SQL joins, aggregation, filtering, and business analysis

* Tools & Technologies

- MySQL
- MySQL Workbench
- SQL
- GitHub

* Database Structure

The project contains the following tables:

- `customers` — Customer information
- `categories` — Product categories
- `products` — Product details and prices
- `orders` — Order information and status
- `order_items` — Products and quantities in each order
- `payments` — Payment details and status

### Table Relationships

```text
customers
    |
    | customer_id
    ↓
orders
    |
    ├── order_items ─── products ─── categories
    |
    └── payments
```

* Business Analysis Performed

1. Total Revenue
2. Total Completed Orders
3. Average Order Value
4. Highest Order Value
5. Lowest Order Value
6. Order Status Analysis
7. Monthly Revenue
8. Top-Selling Products
9. Top 5 Products
10. Category-Wise Revenue
11. City-Wise Revenue
12. Customer-Wise Revenue
13. Payment Method Analysis
14. Payment Status Analysis
15. Cancelled Order Analysis
16. Category and Product Performance

* SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- LIMIT
- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()
- INNER JOIN
- Multiple-table JOINs
- Aggregate Functions
- Date Functions
- Business-oriented SQL analysis

* Project Structure

```text
Ecommerce-Sales-Analytics-MySQL/
│
├── database_setup.sql
├── business_analysis.sql
└── README.md
```

##  How to Run the Project

### 1. Create the Database

Open `database_setup.sql` in MySQL Workbench and execute the setup script.

### 2. Run the Analysis

Open `business_analysis.sql` and execute the queries to generate the business analysis results.

##  Key Learning Outcomes

Through this project, I practised working with relational databases and writing SQL queries to answer real-world business questions.

The project helped me improve my understanding of:

- Data aggregation
- Relational database design
- SQL joins
- Sales analysis
- Customer analysis
- Product performance analysis
- Business problem solving using SQL

##  Author

**Deepanshu Bhirmaan**

BCA (AIML) | Data Analytics & Data Science Enthusiast