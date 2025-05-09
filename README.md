# Customer-Churn-Analysis

## 📚 Table of Contents

- Program Description  
- Project 1: Customer Churn Analysis  
- Tools & Techniques Used  

## 🔎 Program Description

This portfolio highlights real-world business analytics skills applied across customer retention, service efficiency, and product strategy. I have used Excel for data wrangling and dashboard creation, SQL for querying structured datasets, and demonstrated how data-driven decisions can improve customer loyalty and reduce churn.

## 📁 Customer Churn Analysis (Excel + SQL)

### 🧠 Problem Statement

A subscription-based company was experiencing a rise in customer churn. The goal was to analyze churn patterns, identify high-risk segments, and suggest actionable strategies to reduce churn and improve service efficiency.

### 🗂️ Dataset Description

The project uses 3 interconnected tables:

- Customers Table: Contains demographic and subscription start information.
- Subscriptions Table: Tracks subscription plans, charges, and payment methods.
- Interactions Table: Logs customer service interactions, types, and resolution times.

This project uses three relational tables:

#### 🧍 Customers Table

Basic customer info and demographics.
**Columns:**

* `CustomerID` – Unique customer ID
* `FirstName`, `LastName` – Customer name
* `Gender`, `Age`, `Region` – Demographics
* `JoinDate` – Subscription start date
* `IsActive` – 1 = Active, 0 = Churned

#### 💳 Subscriptions Table

Tracks plan, billing, and contract details.
**Columns:**

* `SubscriptionID` – Unique plan ID
* `CustomerID` – Foreign key
* `PlanType` – Basic / Standard / Premium
* `ContractType` – Monthly / Yearly
* `MonthlyCharges` – Plan cost
* `PaymentMethod` – Card / Bank / UPI
* `SubscriptionStatus` – Active / Cancelled

#### 🛠️ Interactions Table

Service-related complaints and resolutions.
**Columns:**

* `InteractionID` – Ticket ID
* `CustomerID` – Foreign key
* `InteractionDate` – Date of interaction
* `IssueType` – Billing / Technical / General
* `ResolutionTimeMins` – Time taken to resolve
* `AgentName` – Support staff
* `IsResolved` – 1 = Resolved, 0 = Open

---

### 🛠️ Tools & Techniques Used

- Microsoft Excel (Data Cleanup, Pivot Tables, Dashboard)
- SQL (Joins, CTEs, Aggregates, CASE, DATE functions)
- Business Intelligence and Problem Solving
- Data-Driven Insights and Recommendations

### 📈 Excel Dashboard Highlights

- Churn Rate Overview: Pie and trend charts to track churn over time.
- Customer Demographics: Age distribution, contract types, and plan segmentation.
- Service Effectiveness: Avg. resolution time by interaction type.
- Revenue Metrics: Monthly charges by contract type and plan.

### 🧾 SQL Queries Used
1. Churned Customers by Plan Type (with JOIN & CASE)
2. Avg. Monthly Charges by Contract Type (using GROUP BY)
3. Top 5 Customers with Most Interactions (with JOIN & ORDER)
4. Customers with Churn and Long Resolution Times (CASE & JOIN)
5. CTE for Repeat Complaints (using CTE & Window Function)
6. Monthly Churn Trend (DATE & COUNT)
7. Average Resolution Time by Agent (GROUP BY)
8. Customer Retention Score (CASE + Aggregates)

## 🎯 Key Business Insights

- Premium Plan users had a higher churn rate compared to Basic and Standard.
- Monthly contracts resulted in significantly higher churn than Yearly ones.
- Customers with multiple complaints had 60%+ probability of churn.
- Average resolution time above 80 mins correlated strongly with churn.

## 📌 Outcomes & Impact

- Built a robust Excel dashboard to present churn patterns clearly.
- Used advanced SQL techniques to extract key performance indicators.
- Provided actionable insights to improve service delivery and contract structure.
- Demonstrated hands-on capability to solve real-world retention problems.

## 🧰 Tools and Techniques Summary

- Microsoft Excel: Data cleaning, formulas, Pivot Tables, Charts, Dashboarding  
- SQL: Joins, CASE, CTEs, Aggregates, DATE functions, Filtering  
- Faker Library: Used to simulate real-world business datasets  
- Business Problem Solving: KPI building, retention scoring, stakeholder-friendly reporting
