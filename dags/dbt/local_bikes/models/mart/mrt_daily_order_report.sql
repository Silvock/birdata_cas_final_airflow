

WITH
    total_daily_user_from_california as (
        select
            date_trunc(order_created_at, day) as order_day,
            count(distinct orders.customer_id) as total_daily_users_from_california
        from {{ ref('int_sales__orders') }} orders
        where store_state = 'CA'
        group by order_day

    )

SELECT DATE_TRUNC(order_created_at, DAY) AS reporting_date,
    staff_last_name,
    staff_first_name,
    store_state,
    COUNT(DISTINCT order_id) AS total_orders,
    count(distinct orders.customer_id) as total_daily_users,
    total_daily_users_from_california
FROM {{ ref('int_sales__orders') }} AS orders
left join total_daily_user_from_california as ca on ca.order_day =
DATE_TRUNC(orders.order_created_at, DAY)
GROUP BY reporting_date,
    staff_last_name,
    staff_first_name,
    store_state,
    total_daily_users_from_california
