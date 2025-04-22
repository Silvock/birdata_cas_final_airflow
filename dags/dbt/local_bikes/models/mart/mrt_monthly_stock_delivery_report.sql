WITH
  orders_summary AS (
  SELECT
    SUM(quantity_sold) AS total_product_qty_sold,
    product_id,
    DATE_TRUNC(order_created_at, MONTH) AS month_order
  FROM
  {{ref('int_sales__order_items')}}
  WHERE
    order_created_at BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 7 YEAR)
    AND CURRENT_DATE()
  GROUP BY
    product_id,
    month_order )
SELECT
  brand_name,
  product_name,
  stock_of_product,
  total_product_qty_sold,
  month_order
FROM
    {{ref('int_prod__products_in_stock')}} sp
INNER JOIN
  orders_summary os
ON
  os.product_id = sp.product_id
