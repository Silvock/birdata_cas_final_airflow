with order_item_grouped_by_order as (

select 
    order_id,
    customer_id,
    staff_id,
    store_id,
    order_status,
    order_created_at,
    shipped_date,
    avg(estimated_time_delivery) as avg_estimated_time_delivery,
    sum(total_sale) as total_order_amount,
    sum(quantity_sold) as total_items,
    count(distinct product_id) as total_distinct_items
from {{ ref('int_sales__order_items') }}
group by 
    order_id,
    customer_id,
    staff_id,
    store_id,
    order_status,
    order_created_at,
    shipped_date

)

select oi.order_id,
    oi.customer_id,
    c.customer_city,
    c.customer_state,
    oi.staff_id,
    e.staff_last_name,
    e.staff_first_name,
    oi.store_id,
    s.store_name,
    s.store_state,
    oi.order_status,
    oi.order_created_at,
    oi.shipped_date,
    coalesce(oi.avg_estimated_time_delivery,0) as avg_estimated_time_delivery,
    coalesce(oi.total_order_amount,0) as total_order_amount,
    coalesce(oi.total_items,0) as total_items,
    coalesce(oi.total_distinct_items,0) as total_distinct_items
from order_item_grouped_by_order as oi 
left join {{ ref('stg_sales__customers' )}} as c on c.customer_id = oi.customer_id
left join {{ ref('stg_sales__staffs' )}} as e on e.staff_id = oi.staff_id
left join {{ ref('stg_sales__stores' )}} as s on s.store_id = oi.store_id

