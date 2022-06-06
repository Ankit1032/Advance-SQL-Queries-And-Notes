=========== QUESTION =========
Table: Accounts
+----------------+------+
| Column Name | Type |
+----------------+------+
| account_id | int |
| max_income | int |
+----------------+------+
account_id is the primary key for this table.
Each row contains information about the maximum monthly income for one bank account.
 
Table: Transactions
+----------------+----------+
| Column Name | Type |
+----------------+----------+
| transaction_id | int |
| account_id | int |
| type | ENUM |
| amount | int |
| day | datetime |
+----------------+----------+
transaction_id is the primary key for this table.
Each row contains information about one transaction.
type is ENUM ('Creditor','Debtor') where 'Creditor' means the user deposited money into their account and 'Debtor' means the user withdrew money from their account.
amount is the amount of money deposited/withdrawn during the transaction.
 
A bank account is suspicious if the total income exceeds the max_income for this account for two or more consecutive months. The total income of an account in some month is the sum of all its deposits in that month (i.e., transactions of the type 'Creditor').
Write an SQL query to report the IDs of all suspicious bank accounts.
Return the result table ordered by account_id in ascending order.
The query result format is in the following example.


===== CREATION OF TABLES AND INPUTS OF DATA =====
CREATE TABLE accounts_table(
    account_id int,
    PRIMARY KEY (account_id),
    max_income int
);

INSERT INTO accounts_table VALUES(3,21000);
INSERT INTO accounts_table VALUES(4,10400);

CREATE TABLE transactions_table(
    transaction_id int,
    account_id int,
    type_of_account varchar2(50) NOT NULL,
    amount int NOT NULL,
    day TIMESTAMP,
    PRIMARY KEY(transaction_id),
    FOREIGN KEY(account_id) REFERENCES accounts_table(account_id)
);

INSERT INTO transactions_table values(2,3,'Creditor',107100,TO_TIMESTAMP('2021-06-02 11:38:14','YYYY-MM-DD HH24:MI:SS'));

INSERT INTO transactions_table values(4,4,'Creditor',10400,TO_TIMESTAMP('2021-06-20 12:39:18','YYYY-MM-DD HH24:MI:SS'));

INSERT INTO transactions_table values(11,4,'Debtor ',58800,TO_TIMESTAMP('2021-07-23 12:41:55','YYYY-MM-DD HH24:MI:SS'));

INSERT INTO transactions_table values(1,4,'Creditor',49300,TO_TIMESTAMP('2021-05-03 16:11:04','YYYY-MM-DD HH24:MI:SS'));

INSERT INTO transactions_table values(15,3,'Debtor ',75500,TO_TIMESTAMP('2021-05-23 14:40:20','YYYY-MM-DD HH24:MI:SS'));

INSERT INTO transactions_table values(10,3,'Creditor',102100,TO_TIMESTAMP('2021-06-15 10:37:16','YYYY-MM-DD HH24:MI:SS'));

INSERT INTO transactions_table values(14,4,'Creditor',56300,TO_TIMESTAMP('2021-07-21 12:12:25','YYYY-MM-DD HH24:MI:SS'));

INSERT INTO transactions_table values(19,4,'Debtor ',101100,TO_TIMESTAMP('2021-05-09 15:21:49','YYYY-MM-DD HH24:MI:SS'));

INSERT INTO transactions_table values(8,3,'Creditor',64900,TO_TIMESTAMP('2021-07-26 15:09:56','YYYY-MM-DD HH24:MI:SS'));

INSERT INTO transactions_table values(7,3,'Creditor',90900,TO_TIMESTAMP('2021-06-14 11:23:07','YYYY-MM-DD HH24:MI:SS'));



==== SOLUTION ====
select * from accounts_table;

select * from transactions_table;

with temp_table as (
select ACCOUNT_ID,USER_MONTH,sum(CREDITOR) as credit_amount,sum(max_income) as max_income,
sum(CREDITOR) - sum(max_income) as excess
from(
    select tra.account_id,extract(month from tra.DAY) as user_month,
    tra.type_of_account,tra.amount,acc.max_income as max_income
    from transactions_table tra,accounts_table acc
    where acc.account_id = tra.account_id
)
pivot(
        sum(amount) for type_of_account in ('Creditor' as Creditor,'Debtor ' as Debtor)
    )
group by ACCOUNT_ID,USER_MONTH
order by ACCOUNT_ID,USER_MONTH
)
select account_id
from temp_table tt1
join temp_table tt2
on tt2.user_month = tt1.user_month + 1
and tt1.account_id = tt2.account_id
where tt1.excess <> 0 and tt2.excess <> 0;


---Easier Solution
WITH Temp as 
(SELECT account_id, SUM(amount) as monthlyincome, 
extract(month from day) as user_month
FROM transactions_table
WHERE type_of_account = 'Creditor'
GROUP BY account_id, extract(month from day))

SELECT DISTINCT a.account_id
FROM Temp a
JOIN Temp b
ON b.user_month = a.user_month + 1
AND a.account_id = b.account_id
JOIN accounts_table ac
ON ac.account_id = a.account_id
WHERE a.monthlyincome > ac.max_income
AND b.monthlyincome > ac.max_income
ORDER BY a.account_id;


=== OUTPUT AFTER QUERY ===
ACCOUNT_ID
| 3 |
