{{
  config(
    materialized = "table",
    cluster_by = "order_id,product_id",
  )
}}

SELECT
  TO_HEX(MD5(CONCAT(order_id,product_id))) as transaction_id,
  CAST(discount AS DECIMAL) as discount,
  CAST(order_id AS INTEGER) as order_id,
  CAST(quantity AS INTEGER) as quantity_sold,
  CAST(list_price AS DECIMAL) as gross_unit_price,
  CAST(product_id AS DECIMAL) as product_id,
  ROUND(CAST(quantity AS INTEGER) * CAST(list_price AS DECIMAL) * (1- CAST(discount AS DECIMAL)),2) AS total_sale
FROM
  {{source('sales','_airbyte_order_items')}}
