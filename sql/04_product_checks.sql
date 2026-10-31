-- 04_product_checks: product categories
-- Goal: check products with no category or no English name.
-- Result: 32,951 products.
--   610 have no category.
--   13 have a category with no English name.
-- Decision: keep these products. Delay questions do not need the category.
--   If I group by category, empty ones are labeled 'unknown'.

SELECT
  COUNT(*) AS all_products,
  SUM(CASE WHEN p.product_category_name IS NULL THEN 1 ELSE 0 END) AS no_category,
  SUM(CASE WHEN p.product_category_name IS NOT NULL
            AND t.product_category_name IS NULL THEN 1 ELSE 0 END) AS no_english_name
FROM products p
LEFT JOIN category_translation t
  ON t.product_category_name = p.product_category_name;
