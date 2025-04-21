SELECT oi.order_id,
    total_sale,
    quantity_sold,
    product_id,
    o.customer_id,
    o.staff_id,
    o.store_id,
    o.order_status,
    o.order_created_at,
    o.shipped_date,
    o.estimated_time_delivery
FROM
{{ ref('stg_sales__order_items') }} AS oi
INNER JOIN
{{ ref('stg_sales__orders') }} o
ON oi.order_id = o.order_id
