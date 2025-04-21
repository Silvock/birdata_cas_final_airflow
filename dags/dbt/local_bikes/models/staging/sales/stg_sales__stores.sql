SELECT
  CAST(store_id AS INTEGER) as store_id,
  city      as store_city,
  email     as store_email,
  phone     as store_phone,
  state     as store_state,
  street    as store_street,
  zip_code  as store_zip_code,
  store_name as store_store_name
FROM
  {{source('sales','_airbyte_stores')}}
