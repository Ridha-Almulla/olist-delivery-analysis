-- 05_foreign_keys: links between tables
-- Goal: check that every link points to a real row.
-- Result: success. All 6 foreign keys were added.
-- Finding: no orphan rows. Every order has a customer,
--   and every item has a real order, product and seller.

ALTER TABLE orders
  ADD CONSTRAINT fk_orders_customer
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id);

ALTER TABLE order_items
  ADD CONSTRAINT fk_items_order
  FOREIGN KEY (order_id) REFERENCES orders (order_id);

ALTER TABLE order_items
  ADD CONSTRAINT fk_items_product
  FOREIGN KEY (product_id) REFERENCES products (product_id);

ALTER TABLE order_items
  ADD CONSTRAINT fk_items_seller
  FOREIGN KEY (seller_id) REFERENCES sellers (seller_id);

ALTER TABLE order_payments
  ADD CONSTRAINT fk_payments_order
  FOREIGN KEY (order_id) REFERENCES orders (order_id);

ALTER TABLE order_reviews
  ADD CONSTRAINT fk_reviews_order
  FOREIGN KEY (order_id) REFERENCES orders (order_id);
