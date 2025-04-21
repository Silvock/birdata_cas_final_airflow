WITH
  manager_list AS (
  SELECT
    DISTINCT manager_id
  FROM
  {{source('sales','_airbyte_staffs')}}
  WHERE
    manager_id IS NOT NULL )
SELECT
  CAST(staff_id AS INTEGER) AS staff_id,
  CAST(store_id AS INTEGER) AS store_id,
  email      as staff_email,
  phone      as staff_phone,
IF(
  active = '1',true,false)     as is_active,
  last_name  as staff_last_name,
  first_name as staff_first_name,
  SAFE_CAST(staffs.manager_id AS INTEGER) AS manager_id,
IF
  (manager_list.manager_id IS NULL, FALSE, TRUE) is_manager
FROM
  {{source('sales','_airbyte_staffs')}} staffs
LEFT JOIN
  manager_list
ON
  manager_list.manager_id = staffs.staff_id
ORDER BY
  staff_id
