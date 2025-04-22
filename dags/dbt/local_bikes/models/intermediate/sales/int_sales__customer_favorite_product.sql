SELECT
customer_id,
oi.product_id AS favorite_product_id,
p.product_name AS favorite_product_name
FROM {{ ref('int_sales__order_items') }} oi
LEFT JOIN {{ ref('int_prod__products_in_stock') }} p
ON  oi.product_id = p.product_id
GROUP BY
customer_id,
oi.product_id,
p.product_name
QUALIFY ROW_NUMBER() OVER (
  PARTITION BY customer_id
  ORDER BY SUM(quantity_sold) DESC
) = 1
