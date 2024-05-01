SELECT
DATE_TRUNC(date_date,MONTH) as datemonth,
sum(ads_margin) AS ads_margin,
ROUND(sum(average_basket),2) AS average_basket,
ROUND(sum(operational_margin),2) AS operational_margin,
FROM {{ref("finance_campaigns_day")}}
GROUP BY datemonth
ORDER BY datemonth desc