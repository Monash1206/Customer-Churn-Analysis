-- churn_analysis_queries.sql

-- Assumed schema:
-- Customers(customer_id, name, join_date, email, state, age, gender, region, segment)
-- Subscriptions(subscription_id, customer_id, start_date, end_date, plan, monthly_fee, status)
-- Interactions(interaction_id, customer_id, interaction_date, channel, rating, issue_type)

-- 1. Active vs Churned customers by Region
SELECT c.region,
       SUM(CASE WHEN s.status = 'Active' THEN 1 ELSE 0 END) AS active_customers,
       SUM(CASE WHEN s.status = 'Cancelled' THEN 1 ELSE 0 END) AS churned_customers
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
GROUP BY c.region;

-- 2. Days since subscription end for cancelled customers
SELECT c.customer_id,
       DATEDIFF(CURDATE(), s.end_date) AS days_since_end
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
WHERE s.status = 'Cancelled';

-- 3. Rank customers by recency of last interaction (most recent = 1)
SELECT customer_id, last_interaction,
       RANK() OVER (ORDER BY last_interaction DESC) AS recent_rank
FROM (
    SELECT customer_id, MAX(interaction_date) AS last_interaction
    FROM Interactions
    GROUP BY customer_id
) AS recent_table;

-- 4. Within each region, rank customers by average support rating (highest rating = 1)
SELECT customer_id, region, avg_rating,
       ROW_NUMBER() OVER (PARTITION BY region ORDER BY avg_rating DESC) AS rating_rank
FROM (
    SELECT c.customer_id, c.region, AVG(i.rating) AS avg_rating
    FROM Customers c
    JOIN Interactions i ON c.customer_id = i.customer_id
    GROUP BY c.customer_id, c.region
) AS sub;

-- 5. Customer churn status classification
SELECT c.customer_id,
       CASE
           WHEN s.status = 'Active' THEN 'Retained'
           WHEN DATEDIFF(CURDATE(), s.end_date) <= 30 THEN 'Recently Churned'
           ELSE 'Churned >30 days'
       END AS churn_status
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id;

-- 6. Monthly active subscriptions count (using CTE)
WITH monthly_active AS (
    SELECT YEAR(start_date) AS year, MONTH(start_date) AS month, 
           COUNT(DISTINCT customer_id) AS active_customers
    FROM Subscriptions
    WHERE status = 'Active'
    GROUP BY YEAR(start_date), MONTH(start_date)
)
SELECT * FROM monthly_active
ORDER BY year, month;

-- 7. Count and rank churn by customer segment
WITH churn_summary AS (
    SELECT c.segment,
           COUNT(*) AS churn_count
    FROM Customers c
    JOIN Subscriptions s ON c.customer_id = s.customer_id
    WHERE s.status = 'Cancelled'
    GROUP BY c.segment
)
SELECT segment, churn_count,
       RANK() OVER (ORDER BY churn_count DESC) AS churn_rank
FROM churn_summary;

-- 8. Customer tenure and average monthly fee
SELECT c.customer_id,
       TIMESTAMPDIFF(MONTH, c.join_date, CURDATE()) AS tenure_months,
       AVG(s.monthly_fee) AS avg_monthly_fee
FROM Customers c
JOIN Subscriptions s ON c.customer_id = s.customer_id
GROUP BY c.customer_id;

-- 9. Total interactions and average rating per customer (for active customers)
SELECT i.customer_id,
       COUNT(*) AS total_interactions,
       AVG(i.rating) AS avg_rating
FROM Interactions i
GROUP BY i.customer_id
HAVING COUNT(*) > 5;

-- 10. Churn rate (%) by subscription plan
SELECT s.plan,
       SUM(CASE WHEN s.status = 'Cancelled' THEN 1 ELSE 0 END) AS churned,
       COUNT(*) AS total_customers,
       ROUND(
         SUM(CASE WHEN s.status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*) * 100
       , 2) AS churn_rate_pct
FROM Subscriptions s
GROUP BY s.plan;

-- 11. Recency-Frequency segmentation (RFM-like using CTEs)
WITH last_activity AS (
    SELECT customer_id, MAX(interaction_date) AS last_interaction
    FROM Interactions
    GROUP BY customer_id
), interaction_counts AS (
    SELECT customer_id, COUNT(*) AS interactions_count
    FROM Interactions
    GROUP BY customer_id
)
SELECT c.customer_id,
       CASE
           WHEN DATEDIFF(CURDATE(), la.last_interaction) <= 30 THEN 'Very Active'
           WHEN DATEDIFF(CURDATE(), la.last_interaction) <= 90 THEN 'Active'
           ELSE 'Dormant'
       END AS recency_segment,
       ic.interactions_count
FROM Customers c
LEFT JOIN last_activity la ON c.customer_id = la.customer_id
LEFT JOIN interaction_counts ic ON c.customer_id = ic.customer_id;

-- 12. Summary of subscriptions and interactions per customer
SELECT c.customer_id, c.name, c.segment,
       COUNT(DISTINCT s.subscription_id) AS num_subscriptions,
       COUNT(i.interaction_id) AS num_interactions
FROM Customers c
LEFT JOIN Subscriptions s ON c.customer_id = s.customer_id
LEFT JOIN Interactions i ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.name, c.segment;
