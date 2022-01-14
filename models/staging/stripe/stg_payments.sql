with stg_payments as (
    select
        orderid,
        amount
    from raw.stripe.payment
    where status = 'success'
)

select * from stg_payments