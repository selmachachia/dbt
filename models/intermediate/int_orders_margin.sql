select  
    orders_id,
    date_date,
    ROUND(SUM(revenue),2) as revenue,
    ROUND(SUM(quantity),2) as quantity,
    ROUND(SUM(purchase_cost),2) as purchase_cost,
    ROUND(SUM(margin),2) as margin
FROM {{ref("int_sales_margin")}}
GROUP BY orders_id, date_date
ORDER BY orders_id DESC

select
    orders_id,
    max(date_date) as date_date,
    ROUND(SUM(revenue),2) as revenue,
    ROUND(SUM(quantity),2) as quantity,
    ROUND(SUM(purchase_cost),2) as purchase_cost,
    ROUND(SUM(margin),2) as margin
FROM {{ref("int_sales_margin")}}
GROUP BY orders_id
ORDER BY orders_id DESC

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
LEFT JOIN FROM {{ref("stg_raw_ship")}} s
    USING(orders_id)
ORDER BY orders_id DESC