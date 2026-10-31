-- 07_date_range_checks: unusual dates on delivered orders
-- Goal: check impossible or extreme dates.
-- Result: purchases from 2016-09-15 to 2018-08-29.
--   0 delivered before purchase. 0 promised before purchase.
--   Longest delivery: 210 days. 298 orders took more than 60 days.
-- Decision: keep the 298 long orders. They are real delays, not errors.
--   To limit their effect, use the median and delay groups.

SELECT
  MIN(order_purchase_timestamp) AS first_purchase,
  MAX(order_purchase_timestamp) AS last_purchase,
  SUM(CASE WHEN order_delivered_customer_date < order_purchase_timestamp THEN 1 ELSE 0 END) AS delivered_before_purchase,
  SUM(CASE WHEN order_estimated_delivery_date < order_purchase_timestamp THEN 1 ELSE 0 END) AS promise_before_purchase,
  MAX(order_delivered_customer_date::date - order_purchase_timestamp::date) AS max_days_to_deliver,
  SUM(CASE WHEN order_delivered_customer_date::date - order_purchase_timestamp::date > 60 THEN 1 ELSE 0 END) AS over_60_days
FROM orders
WHERE order_status = 'delivered';
