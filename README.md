# 📊 Customer Churn Analysis

This project is part of a Business Analyst portfolio focused on analyzing customer churn behavior using SQL and Excel. The objective is to identify trends, build insights, and recommend data-driven strategies to improve customer retention.

---

## 🧠 Project Summary

A company noticed a drop in customer engagement and suspects churn. As a Business Analyst, I extracted and analyzed customer data from three tables using MySQL. I built key visualizations using Excel and presented insights into the churn patterns, factors contributing to churn, and proposed actionable recommendations.

---

## 🗃️ Dataset Overview

The dataset is split into 3 tables:

| Table Name    | Description                                      |
|---------------|--------------------------------------------------|
| `customers`   | Contains demographic and profile info of users   |
| `transactions`| Contains transaction history                     |
| `churn`       | Stores churn flag for each customer              |

### 1. `customers` Table

| Column Name | Description       |
|-------------|-------------------|
| CustomerID  | Unique ID         |
| Gender      | Male / Female     |
| Age         | Customer's age    |
| Region      | North/South/etc.  |
| JoinDate    | Date joined       |

### 2. `transactions` Table

| Column Name      | Description             |
|------------------|-------------------------|
| TransactionID    | Unique transaction ID   |
| CustomerID       | Foreign key             |
| TransactionDate  | Date of transaction     |
| Amount           | Purchase amount         |

### 3. `churn` Table

| Column Name | Description                    |
|-------------|--------------------------------|
| CustomerID  | Unique customer ID             |
| Churned     | Yes/No – whether they churned  |

---

## 🔍 Tools Used

- **MySQL** – for querying relational data  
- **Microsoft Excel** – for dashboards, pivots, charts  
- **PowerPoint / PDF** – to summarize findings  

---

## 💡 Business Goals

- Identify who is churning and why  
- Segment churners by demographics and behavior  
- Recommend retention strategies  

---

## 🧮 SQL Queries Used

Stored in `sql/churn_analysis_queries.sql`

**Highlight Features:**
- `JOIN` operations across 3 tables  
- `CTE` usage for complex filters  
- `CASE WHEN`, `DATE_DIFF`, and `RANK()`  
- Aggregations: `COUNT()`, `SUM()`, `AVG()`  
- Window functions  

**Sample Queries Include:**
1. Total number of churned vs retained customers  
2. Avg transaction amount by churn status  
3. Churn rate by region and gender  
4. Most recent transaction date per customer  
5. Active vs inactive users in last 30 days  
6. Customer lifetime value (CLV) approximation  
7. Churn trend by cohort (joining year)  
8. Ranking top spenders who churned  

---

## 📊 Excel Dashboard

Stored in `excel/churn_data_analysis.xlsx`

**Visuals Included:**
- Monthly churn trend chart  
- Region-wise churn %  
- Gender-wise churn distribution  
- Transaction volume heatmap  
- Top 10 churned customers by spend  
- Pivot tables to drill down by region & gender  

---

## 📁 Folder Structure

```bash
customer-churn-analysis/
│
├── README.md
├── sql/
│   └── churn_analysis_queries.sql
├── excel/
│   └── churn_data_analysis.xlsx
├── data/
│   └── cleaned/
│       ├── customers.csv
│       ├── transactions.csv
│       └── churn.csv
├── visuals/
│   └── dashboard_screenshot.png
├── reports/
│   └── churn_analysis_summary.pdf
