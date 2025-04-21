SELECT
  TO_HEX(MD5(CONCAT(store_id,product_id))) as association_id,
  CAST(quantity AS INTEGER) as quantity_in_stock,
  CAST(store_id AS INTEGER) as store_id,
  CAST(product_id AS INTEGER) as product_id
FROM
  {{source('production','_airbyte_stocks')}}
