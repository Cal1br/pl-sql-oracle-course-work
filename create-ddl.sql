--DROP TABLE employee;

CREATE TABLE employee
(
    emp_id     NUMBER GENERATED ALWAYS AS IDENTITY,
    egn        varchar2(20) UNIQUE NOT NULL,
    first_name varchar2(255)       NOT NULL,
    last_name  varchar2(255)       NOT NULL,
    addl_name  varchar2(255),
    address    varchar2(255),
    phone      varchar2(35)        NOT NULL,
    email      varchar2(40)        NOT NULL,
    job_desc   varchar2(255),
    dep_id     NUMBER              NOT NULL,
    salary     NUMBER default 1000 not null,
    mng_id     NUMBER
);

ALTER TABLE EMPLOYEE
    ADD CONSTRAINT employee_pk PRIMARY KEY (emp_id);

ALTER TABLE EMPLOYEE
    ADD salary NUMBER DEFAULT 1000 NOT NULL;
ALTER TABLE EMPLOYEE
    ADD date_started DATE DEFAULT sysdate NOT NULL;


UPDATE EMPLOYEE
SET date_started = to_date('2015-02-1', 'yyyy-mm-dd')
WHERE EMP_ID = 1;

--DROP TABLE DEPARTMENT;
CREATE TABLE department
(
    dep_id   NUMBER GENERATED ALWAYS AS IDENTITY,
    dep_name varchar2(255) NOT NULL,
    dep_desc varchar2(255)
);

ALTER TABLE department
    ADD CONSTRAINT department1_pk PRIMARY KEY (dep_id);

ALTER TABLE employee
    ADD CONSTRAINT department_fk FOREIGN KEY (dep_id) REFERENCES department (dep_id);

CREATE TABLE customer
(
    cust_id    NUMBER GENERATED ALWAYS AS IDENTITY,
    username   varchar2(50) UNIQUE NOT NULL,
    pass       varchar2(2048)      NOT NULL,
    egn        varchar2(20) UNIQUE NOT NULL,
    first_name varchar2(255)       NOT NULL,
    last_name  varchar2(255)       NOT NULL,
    addl_name  varchar2(255),
    address    varchar2(255),
    phone      varchar(35)         NOT NULL,
    email      varchar2(40)        NOT NULL
);

ALTER TABLE customer
    ADD CONSTRAINT customer_pk PRIMARY KEY (cust_id);



SELECT *
FROM USER_CONSTRAINTS;