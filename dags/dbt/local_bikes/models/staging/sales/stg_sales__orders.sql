SELECT
  CAST(order_id as INTEGER) as order_id,
  CAST(staff_id as INTEGER) as staff_id,
  CAST(store_id as INTEGER) as store_id,
  SAFE_CAST(order_date AS DATE) as order_created_at,
  CAST(customer_id as INTEGER) as customer_id,
  order_status,
  SAFE_CAST(shipped_date AS DATE) as shipped_date,
  SAFE_CAST(required_date AS DATE) as delivery_target_date,
  SAFE_CAST(shipped_date AS DATE) - SAFE_CAST(required_date AS DATE) as
estimated_time_delivery
FROM
  {{source('sales','_airbyte_orders')}}
ORDER BY order_id
