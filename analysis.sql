-- Total Revenue
SELECT SUM(payment_value) AS total_revenue
FROM olist_order_payments;

-- Average Order Value (AOV)
SELECT AVG(payment_value) AS avg_order_value
FROM olist_order_payments;

-- Top 10 Customers by Revenue
SELECT customer_id, SUM(payment_value) AS total_spent
FROM olist_orders o
JOIN olist_order_payments p
ON o.order_id = p.order_id
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- Top Selling Categories
SELECT product_category_name, COUNT(*) AS total_sales
FROM olist_order_items oi
JOIN olist_products p
ON oi.product_id = p.product_id
GROUP BY product_category_name
ORDER BY total_sales DESC;

-- Regional Revenue
SELECT customer_state, SUM(payment_value) AS revenue
FROM olist_orders o
JOIN olist_customers c
ON o.customer_id = c.customer_id
JOIN olist_order_payments p
ON o.order_id = p.order_id
GROUP BY customer_state
ORDER BY revenue DESC;

-- Delivery Time Analysis
SELECT AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)) AS avg_delivery_days
FROM olist_orders;