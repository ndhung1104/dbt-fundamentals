with stg_payments as (
    select
        orderid,
        amount
    from {{ source('stripe', 'payment') }}
    where status = 'success'
)

select * from stg_payments