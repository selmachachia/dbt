SELECT 
date_date
,SUM(ads_cost) as ads_cost
,SUM(impression) as ad_imp
,SUM(click) as ad_clicks
FROM {{ref("int_campaigns")}}
GROUP BY date_date
