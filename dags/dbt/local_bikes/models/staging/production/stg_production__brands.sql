SELECT
  CAST(brand_id AS INTEGER) as brand_id,
  brand_name
FROM
  {{source('production','_airbyte_brands')}}
ORDER BY
  brand_id
