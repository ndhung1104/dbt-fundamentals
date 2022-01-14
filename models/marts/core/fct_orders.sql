with orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (
    select * from {{ ref('stg_payments') }}
),

fct_orders as (
    select 
        order_id,
        order_date,
        customer_id,
        coalesce(amount,0) as amount
    from orders 
    left join payments on order_id = orderid 
)

select * from fct_orders