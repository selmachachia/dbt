
select 
    product_id,
    date_date,
    orders_id,
    revenue,
    quantity,
    CAST(purchase_price as FLOAT64),
    ROUND(s.quantity*CAST(purchase_price as FLOAT64),2) AS purchase_cost,
    s.revenue - ROUND(s.quantity*CAST(purchase_price as FLOAT64),2) AS margin,
from {{ ref('stg_raw__sales')}} s
LEFT JOIN {{ ref('stg_raw_product')}} p
    USING(products_id)