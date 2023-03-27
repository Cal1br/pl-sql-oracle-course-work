-- 1. Да се създаде листинг на имената на всички отдели в банката

SELECT dep_name as "Department name" FROM DEPARTMENT;


-- 2. Да се създаде листинга на месечните възнаграждения на всички
-- служители, в листинга е необходимо да присъстват двете имена
-- на служителя и неговата заплата

SELECT (first_name || ' ' || last_name) as "Names", salary as "Salary" from employee;

-- 3. Да се създаде листинг на всички служители в банката в листинга
-- трябва да присъстват двете имена на служителите и новогенерирани
-- имейли, които да се състоят от конкатенирани първото и второ име
-- на служителя разделени с точка. Имената на служителите трябва да
-- бъдат с малки букви в имейла. Домейна на компанията е
-- bankoftomorrow.bg

SELECT (first_name || ' ' || last_name) as "Names", LOWER(first_name || '.' || last_name || '@bankoftomorrow.bg') as "EMail" from employee;

-- 4. Намерете всички служители които банката дефинира като старши
-- служители. Старши служители са всички които работят в компанията
-- от 5 години.

SELECT (first_name || ' ' || last_name) AS "Names",
       trunc(sysdate) - trunc(date_started) as "Experience: Days"
from employee where date_started < add_months(current_date, -5*12);

-- 5. Намерете всички служители, чиито имена (първо / второ или
-- допълнително съдържат буквата l)

select (first_name || ' ' || last_name) AS "Names" from employee where (first_name || last_name) like '%l%'
--where lower(first_name || last_name) like '%l%' -- ако искаме да не е case sensitive