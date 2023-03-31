create table balance
(
    balance_id        NUMBER GENERATED ALWAYS AS IDENTITY,
    owner_customer_id number           not null,
    balance           number default 0 not null,
    balance_type      varchar2(20)     not null,
    balance_name      varchar2(255)
);


alter table balance
    add constraint balance_client_fk foreign key (owner_customer_id) references customer (cust_id);

insert into balance (owner_customer_id, balance, balance_type)
values (1, 20000, 'BGN');
insert into balance (owner_customer_id, balance, balance_type)
values (1, 10000, 'EUR');
insert into balance (owner_customer_id, balance, balance_type)
values (2, 5000, 'BGN');
insert into balance (owner_customer_id, balance, balance_type)
values (21, 15555, 'EUR');

-- Да се изведат всички клиенти които имат сметки във валута. ( различна
-- от BGN )

select owner_customer_id, listagg(balance_type)
from balance
group by owner_customer_id
having listagg(balance_type, ',') not like '%BGN%';

-- 2. Да се изведат всички клиенти които имат сметки с нулево парично
-- салдо. Напълно празни.

SELECT owner_customer_id
FROM balance
GROUP BY owner_customer_id
HAVING SUM(balance) = 0;

-- 3. Да се добави название на сметката на всеки клиент. Названието на
-- сметката му, е името на клиента последвано от думата сметка и
-- валутата на сметката. Актуализирайте всички клиенти.

MERGE INTO balance bal
USING
    (
-- For more complicated queries you can use WITH clause here
        SELECT *
        FROM customer) cust
ON (bal.owner_customer_id = cust.cust_id)
WHEN MATCHED THEN
    UPDATE
    SET bal.balance_name = cust.first_name || '-' || cust.last_name || '-' || bal.balance_type;