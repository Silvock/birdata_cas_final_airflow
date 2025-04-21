SELECT
  CAST(customer_id AS INTEGER) AS customer_id,
  city as      customer_city,
  email as     customer_email,
  phone as     customer_phone,
  state as     customer_state,
  street as    customer_street,
  zip_code as  customer_zip_code,
  last_name as  customer_last_name,
  first_name as customer_first_name
FROM
  {{source('sales','_airbyte_customers')}}
ORDER BY
  customer_id
