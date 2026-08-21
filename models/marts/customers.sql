-- Joins customers with their orders and payments
select
    customers.customer_id,
    customers.first_name,
    customers.last_name,
    orders.order_date,
    orders.status,
    payments.amount
from {{ ref('stg_customers') }} as customers
left join {{ ref('stg_orders') }} as orders
    on customers.customer_id = orders.customer_id
left join {{ ref('stg_payments') }} as payments
    on orders.order_id = payments.order_id