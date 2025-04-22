SELECT
  store_id,
  store_name,
  ROUND(AVG(avg_estimated_time_delivery),2) as store_avg_estimated_time_delivery,
  DATE_TRUNC(order_created_at,MONTH) as month_order
FROM
{{ref('int_sales__orders')}}
 GROUP BY
   store_id,
  store_name,
  month_order
ORDER BY store_avg_estimated_time_delivery ASC
