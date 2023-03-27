--arrays
DECLARE
    TYPE namesarray IS varay(5) OF
    varchar2(10);
    TYPE grades IS varray(5) OF integer;
    names namesarray;
    marks grades;
    total integer;
BEGIN
    names := namesarray('Angel', 'Ivan', 'Georgi', 'Vasili', 'Atilla');
    marks := grades(5, 6, 7, 8, 9);

    names(1) := 'Hello';
    total := names.count;
    dbms_output.out_line('Total ' || total || ' Students');

END

--last


PROCEDURE pr_add_cust_row customer%ROWTYPE
AS --DECLARE e nujen samo pri anonymous blocks
l_cust_row customer%ROWTYPE := p_cust_row;
DECLARE customer_not_found_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT (customer_not_found_exception, 1001);
    DECLARE customer_password_expired_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT (customer_password_expired_exception, 1002);
BEGIN

    l_cust_row.pass := dbms_crypto.HASH(util_i18n.string_to_raw(l_cust_row.pass, "AL32UTF8"), 4)
        FROM dual;
    INSERT INTO customer VALUES p_cust_row;
END;

PROCEDURE pr_login(p_cust_id NUMBER, p_pass varchar2)
			AS

l_customer customer%ROWTYPE;

SELECT *
INTO l_customer
FROM customer
WHERE cust_id = p_cust_id;

IF l_customer IS NULL THEN
					RAISE 
				END IF;


l_pass varchar2(100) := dbms_crypto.HASH(util_i18n.string_to_raw(p_pass, "AL32UTF8"), 4)
				FROM dual;

END


ALTER TABLE customer
    ADD username varchar2(100);

ALTER TABLE customer
    ADD pass varchar2(1000);


CREATE
OR
REPLACE
pacakge BODY cust_pkg AS

PROCEDURE pr_add_cut(p_cust_row customer%ROWTYPE)
			AS
BEGIN


    BEGIN
    END


-- loop

    DECLARE l_egn customer.EGN%TYPE;
    BEGIN
        SELECT egn
        INTO l_egn
        FROM customer
        WHERE cust_id = 1;

        dbms_output.put_line(l_egn);
    END;


    -- CURSOR


    BEGIN
        FOR i IN (SELECT * FROM customer)
            LOOP
                dbms_output.put_line(i.egn);
            END LOOP;
    END;

-- 

    DECLARE
        l_text varchar2(255);
        l_num  NUMBER;
    BEGIN
        --anonymous block
        l_text := 'Hello';
        l_num := 2;
        l_num := l_num + 1;
        IF l_num < 1 THEN
            dbms_output.put_line('Wazaa');
        ELSE
            dbms_output.put_line('Whowww');
        END IF;
        dbms_output.put_line(l_text || ' ' || l_num);
    END;

    BEGIN
        FOR i IN 1..10
            LOOP
                dbms_output.put_line('asd');
            END LOOP
            END

        BEGIN
            FOR i IN reverse 1..10
                LOOP
                    dbms_output.put_line('asd');
                END LOOP
                END


