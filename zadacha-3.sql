alter table employee
    add status varchar2(25) default 'NORMAL' not null;

alter table employee
    add status_changed date;

--честно казано сигурно не е най-добрата идея да го правя с trigger
CREATE OR REPLACE TRIGGER update_status_changed
    BEFORE UPDATE
    ON employee
    FOR EACH ROW
BEGIN
    IF :NEW.status <> :OLD.status THEN
        :NEW.status_changed := SYSDATE;
    END IF;
END;

--Да се реализира листинг показващ всички служители които са били
--уволнени от компанията

select *
from employee
where status = 'FIRED';

-- Да се реализира листинг на всички служители които са в майчинство
-- в момента.


select *
from employee
where status = 'MATERNITY';

-- Да се реализира листинг на всички служители които са в отпуска
-- / болничен в момента

select *
from employee
where status = 'LEISURE_LEAVE'
   or status = 'SICK_LEAVE';

--4. Намерете всички служители които нямат ръководител

select *
from employee
where mng_id is null;
--
-- 5. Намерете всички старши служители които получават заплата по висока
-- от 5000 лв. Подредете ги в обратен азбучен ред, като се има предвид
-- тяхното първо име.

-- преизползваме query-to от задача 1

SELECT (first_name || ' ' || last_name) AS "Names",
       salary                           as "Salary"
from employee
where date_started < add_months(current_date, -5 * 12)
  AND salary > 5000
order by first_name asc;


-- Намерете петимата най-високоплатени служители във всеки отдел.
-- Групирайте ги по отдели.

select "Names", "Salary", dep_id
from (select (first_name || ' ' || last_name) as "Names", salary as "Salary", dep_id,
             rank() over (partition by dep_id order by salary desc) salary_rank from employee)
where salary_rank = 1;