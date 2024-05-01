select
o.orders_id
,o.date_date,ROUND(o.margin + s.shipping_fee - (s.log.cost + s.ship_cost),2) AS operational_margin
,o.quantity
,o.revenue
,o.purchase_cost
,o.margin
,s.shipping_fee
,s.logcost
,s.ship_cost
FROM {{ref("int_sales_margin")}} o
LEFT JOIN {{ref("stg_raw_ship")}} s
    USING(orders_id)
ORDER BY orders_id DESC