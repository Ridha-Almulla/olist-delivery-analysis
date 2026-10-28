-- 02_review_checks: duplicate reviews
-- Goal: check if one order has more than one review.
-- Result: 99,224 rows, 98,410 unique review_id, 98,673 unique orders.
-- Finding: 551 extra reviews (some orders have more than one review).
-- Decision: keep the latest review for each order (by review_answer_timestamp).

SELECT COUNT(*)                  AS all_reviews,
       COUNT(DISTINCT review_id) AS unique_review_ids,
       COUNT(DISTINCT order_id)  AS unique_orders
FROM order_reviews;
