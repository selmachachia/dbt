SELECT 
date_date
,operational_margin - ads_cost as ads_margin
,average_basket as average_basket
,operational_margin as operational_margin
FROM {{ref("int_campaigns_day")}} 
LEFT JOIN {{ref("finance_days")}} 
USING (date_date)