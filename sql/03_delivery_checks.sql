-- 03_delivery_checks: delivery dates on delivered orders
-- Goal: check missing or illogical dates before measuring delays.
-- Result: 96,478 delivered orders.
--   8 have no customer delivery date.
--   2 have no carrier date.
--   23 have carrier date after customer delivery date.
-- Decision 1: exclude the 8 orders with no customer date from delay analysis.
-- Decision 2: keep the 25 orders with a wrong carrier date for the delay rate,
--   but exclude them from the seller vs carrier question.

SELECT
  COUNT(*) AS delivered_orders,
  SUM(CASE WHEN order_delivered_customer_date IS NULL THEN 1 ELSE 0 END) AS no_customer_date,
  SUM(CASE WHEN order_delivered_carrier_date IS NULL THEN 1 ELSE 0 END) AS no_carrier_date,
  SUM(CASE WHEN order_delivered_carrier_date > order_delivered_customer_date THEN 1 ELSE 0 END) AS carrier_after_customer
FROM orders
WHERE order_status = 'delivered';
