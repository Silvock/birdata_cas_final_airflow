-- Refunds have a negative amount, so the total amount should always be >= 0.
-- Therefore return records where total_amount < 0 to make the test fail.
select
    order_id,
from  {{ ref('stg_sales__order_items.sql') }}
where quantity_sold < 0
