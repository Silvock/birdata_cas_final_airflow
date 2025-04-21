SELECT
  CAST(product_id AS INTEGER) as product_id,
  CAST(brand_id AS INTEGER) as brand_id,
  CAST(list_price AS DECIMAL) as catalogue_price,
  model_year,
  CAST(category_id AS INTEGER) as category_id,
  product_name
FROM
  {{source('production','_airbyte_products')}}
  ORDER BY product_id
