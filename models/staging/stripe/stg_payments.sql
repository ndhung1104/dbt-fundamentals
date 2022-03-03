with stg_payments as (
    select
        orderid,
        {{ cents_to_dollars('payment_amount', 4) }} as amount
    from {{ source('stripe', 'payment') }}
    where status = 'success'
)

select * from stg_payments