nsert
into department(dep_name, dep_desc)
values ('Операции','Операции');
insert into department(dep_name, dep_desc)
values ('Кредитен анализ', 'Кредитен анализ');
insert into department(dep_name, dep_desc)
values ('Картови разплащания', 'Картови разплащания');


TRUNCATE TABLE employee;

insert into employee(egn, first_name, last_name, addl_name, address, phone, email, job_desc, dep_id, date_started, salary, mng_id)
values ('9515156545', 'Angel', 'Georgiev', '', 'Bulgaria', '0895465456', 'angelbgpl@gmail.com', 'Operator', 1, TO_DATE('20080101','YYYYmmDD'), 2000, null);

insert into employee (egn, first_name, last_name, addl_name, address, phone, email, job_desc, dep_id, date_started, salary, mng_id)
values ('9515356545', 'Vasil', 'Grigorov', '', 'Italy', '0895546456', 'vas@gmail.com', 'Cards', 3, TO_DATE('20100523','YYYYmmDD'), 3000, 1);

insert into employee (egn, first_name, last_name, addl_name, address, phone, email, job_desc, dep_id, date_started, salary, mng_id)
values ('9713156145', 'Petar', 'Angelov', '', 'Bulgaria', '0895454556', 'Pet@gmail.com', 'Credit operator', 2 , sysdate - 10, 1000, 2);

insert into employee (egn, first_name, last_name, addl_name, address, phone, email, job_desc, dep_id, date_started, salary, mng_id)
values ('0040044004', 'Atilla', 'Mehmed', '', 'Bulgaria', '0888888888', 'am@gmail.com', 'The fullest stack', 1 , to_date('20051017','YYYYmmDD'), 6000, null);

insert into customer (egn, username, pass ,first_name, last_name, addl_name, address, phone, email)
values ('9213156145','Ivan','hasedpassword', 'Ivan', 'Ivanov', '', 'France', '0892165', 'iv@gmail.com');

insert into customer (egn, username, pass ,first_name, last_name, addl_name, address, phone, email)
values ('9313156145','Georgi','hasedpassword', 'Georgi', 'Petrov', '', 'Bulgaria', '089216655', 'gi@gmail.com');

insert into customer (egn, username, pass ,first_name, last_name, addl_name, address, phone, email)
values ('9613156145','Silvia','hasedpassword', 'Silvia', 'Ivanova', '', 'Germany', '089215465', 'siv@gmail.com');

