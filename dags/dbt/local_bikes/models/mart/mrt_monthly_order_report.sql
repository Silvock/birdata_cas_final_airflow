
WITH
    total_monthly_user_from_california as (
        select
            date_trunc(order_created_at, month) as order_month,
            count(distinct orders.customer_id) as total_monthly_users_from_california
        from {{ ref('int_sales__orders') }} orders
        where store_state = 'CA'
        group by order_month

    )

SELECT DATE_TRUNC(order_created_at, MONTH) AS reporting_date,
    staff_last_name,
    staff_first_name,
    store_state,
    COUNT(DISTINCT order_id) AS total_orders,
    count(distinct orders.customer_id) as total_monthly_users,
    total_monthly_users_from_california
FROM {{ ref('int_sales__orders') }} AS orders
left join total_monthly_user_from_california as ca on ca.order_month = DATE_TRUNC(orders.order_created_at, MONTH)
GROUP BY reporting_date,
    staff_last_name,
    staff_first_name,
    store_state,
    total_monthly_users_from_california
