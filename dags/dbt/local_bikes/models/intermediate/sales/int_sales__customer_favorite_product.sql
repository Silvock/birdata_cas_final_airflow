SELECT
customer_id,
product_id AS favorite_product_id
FROM {{ ref('int_sales__order_items') }}
GROUP BY
customer_id,
product_id
QUALIFY ROW_NUMBER() OVER (
  PARTITION BY customer_id
  ORDER BY SUM(quantity_sold) DESC
) = 1
