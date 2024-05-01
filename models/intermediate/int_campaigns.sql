WITH subquery as (
SELECT *
FROM {{ref('stg_raw__adwords')}}
UNION ALL 
SELECT *
FROM {{ref('stg_raw__bing')}}
UNION ALL
SELECT *
FROM {{ref('stg_raw__criteo')}}
UNION ALL
SELECT *
FROM {{ref('stg_raw__facebook')}})

SELECT *
, CONCAT(date_date,campaign_key) as key
FROM subquery