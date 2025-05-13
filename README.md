# 📊 Customer Churn Analysis

This project is part of a Business Analyst portfolio that analyzes customer churn behavior using SQL and Excel. The objective is to identify trends, build insights, and recommend data-driven strategies to improve customer retention.

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

**Highlight Features:**
- `JOIN` operations across 3 tables  
- `CTE` usage for complex filters  
- `CASE WHEN`, `DATE_DIFF`, and `RANK()`  
- Aggregations: `COUNT()`, `SUM()`, `AVG()`  
- Window functions  

---

## 📊 Excel Dashboard

**Visuals Included:**
- Monthly churn trend chart  
- Region-wise churn %  
- Gender-wise churn distribution  
- Transaction volume heatmap  
- Top 10 churned customers by spend  
- Pivot tables to drill down by region & gender  

---

##  📈 Key Insights
Churn Rate: 20% of total customers churned

High-Risk Segments: Age 18–25, East region

Low Engagement: 40% of churners made < 3 transactions

Revenue Impact: Churned customers contributed 25% to revenue

---
## ✅ Recommendations
Launch retention offers for East region

Improve engagement campaigns for new joiners

Introduce loyalty programs for high spenders

Predict churn risk using cohort-based scoring

---
