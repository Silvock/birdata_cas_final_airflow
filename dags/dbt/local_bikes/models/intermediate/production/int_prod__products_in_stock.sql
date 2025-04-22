WITH
  stock_of_products AS (
  SELECT
    product_id,
    SUM(quantity_in_stock) AS stock_of_product
  FROM
    {{ ref('stg_production__stocks' )}}
    GROUP BY 
    product_id )
SELECT
  p.product_id,
  br.brand_name,
  catalogue_price,
  model_year,
  cat.category_name
  product_name,
  stock_of_product
FROM
  {{ ref('stg_production__products' )}} p 
LEFT JOIN {{ ref('stg_production__brands' )}} br 
ON p.brand_id = br.brand_id
LEFT JOIN {{ ref('stg_production__categories' )}} cat 
ON cat.category_id = p.category_id
INNER JOIN stock_of_products sp ON 
p.product_id = sp.product_id
