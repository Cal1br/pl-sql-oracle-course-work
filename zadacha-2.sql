CREATE TABLE employee_department_change
(
    id         number GENERATED AS IDENTITY,
    changed_on DATE default sysdate NOT NULL,
    emp_id     number               not null,
    old_val    VARCHAR2(105),
    new_val    VARCHAR2(105)
);

--Да се реализират примерни inserta в тази таблица

CREATE
    OR REPLACE TRIGGER department_change_trg
    BEFORE
        UPDATE OF dep_id
    ON employee
    FOR EACH ROW
BEGIN
    IF
        :OLD.dep_id != :NEW.dep_id THEN
        INSERT INTO employee_department_change (emp_id, old_val, new_val)
        VALUES (:new.emp_id, :OLD.dep_id, :NEW.dep_id);
    END IF;
END;

--Да се реализира листинг на служителите, които са работили в повече
-- от един отдел в рамките на последните два месеца

select *
from employee emp
         left join
     (select *
      from (select *, rank() over (partition by emp_id order by changed_on desc) chng_rank
            from employee_department_change)
      where chng_rank = 1) chg
     on emp.emp_id = chg.emp_id
where (chg.emp_id is null and sysdate - emp.date_started > 60) -- никога не е сменял
   OR (
            chg.new_val = emp.dep_id
        and
            sysdate - chg.changed_on > 60
    );


--Да се реализира листинг на служителите които са работили само в
--един отдел откакто са част от структурата на компанията.

select *
from employee emp
         left join employee_department_change chg
                   on emp.emp_id = chg.emp_id where
                                                  chg.emp_id is null;