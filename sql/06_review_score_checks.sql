-- 06_review_score_checks: review scores
-- Goal: check empty scores and the score range.
-- Result: 99,224 rows, 99,224 with a score. Scores from 1 to 5.
-- Finding: no empty scores, and all scores are valid.
-- Decision: none needed.

SELECT
  COUNT(*)            AS all_rows,
  COUNT(review_score) AS rows_with_score,
  MIN(review_score)   AS min_score,
  MAX(review_score)   AS max_score
FROM order_reviews;
