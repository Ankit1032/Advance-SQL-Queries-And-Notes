with pivot_temp as
(select * from
(select MERCHANT,AMOUNT,PAYMENT_MODE from payments_data)
pivot (
    sum(AMOUNT) 
    for PAYMENT_MODE in ('CASH' V_CASH,'ONLINE' V_ONLINE)
)
)
select * from pivot_temp
unpivot(
    amount
    for PAYMENT_MODE_NEW IN (V_CASH,V_ONLINE)
)
;
