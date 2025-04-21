SELECT
  CAST(category_id AS INTEGER) AS category_id,
  category_name
FROM
  {{source('production','_airbyte_categories')}}
ORDER BY
  category_id
