SELECT 
customers.customer_name AS 'Customer', 
printf('$%.2f',SUM(subscription_length * price_per_month)) AS 'Amount Due'
FROM orders
JOIN customers
    on customers.customer_id = orders.customer_id
JOIN subscriptions
    on subscriptions.subscription_id = orders.subscription_id
WHERE orders.order_status = 'unpaid' AND subscriptions.description = 'Fashion Magazine'
GROUP BY customers.customer_name;