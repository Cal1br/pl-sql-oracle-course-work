alter table customer add pass_change_time date default sysdate not null;
-- 1. Разработка на модул за добавяне, премахване, променяне и
-- извеждане (CRUD) на потребители (клиенти).


-- Изисквания:
-- 1. Модулите трябва да бъдат организирани в пакети.
-- 2. Паролата на клиента да бъде хеширана.
-- 3. Паролата на клиента да изтича след 6 месеца и това да налага
-- смяната й.
-- 4. Един клиент може да има много сметки.
-- 5. Да се имплементира начин за проследяване на промените в данните
-- на един от модулите.

CREATE OR REPLACE PACKAGE customer_pkg AS

  -- CREATE operation
  PROCEDURE create_customer(
    p_username   IN customer.username%TYPE,
    p_pass       IN customer.pass%TYPE,
    p_egn        IN customer.egn%TYPE,
    p_first_name IN customer.first_name%TYPE,
    p_last_name  IN customer.last_name%TYPE,
    p_addl_name  IN customer.addl_name%TYPE,
    p_address    IN customer.address%TYPE,
    p_phone      IN customer.phone%TYPE,
    p_email      IN customer.email%TYPE
  );

  -- READ operations
  FUNCTION get_customer_by_id(
    p_cust_id IN customer.cust_id%TYPE
  ) RETURN customer%ROWTYPE;

  FUNCTION get_customer_by_username(
    p_username IN customer.username%TYPE
  ) RETURN customer%ROWTYPE;

  -- UPDATE operation
  PROCEDURE update_customer(
    p_cust_id    IN customer.cust_id%TYPE,
    p_username   IN customer.username%TYPE,
    p_pass       IN customer.pass%TYPE,
    p_egn        IN customer.egn%TYPE,
    p_first_name IN customer.first_name%TYPE,
    p_last_name  IN customer.last_name%TYPE,
    p_addl_name  IN customer.addl_name%TYPE,
    p_address    IN customer.address%TYPE,
    p_phone      IN customer.phone%TYPE,
    p_email      IN customer.email%TYPE
  );

  -- DELETE operation
  PROCEDURE delete_customer(
    p_cust_id IN customer.cust_id%TYPE
  );

END customer_pkg;
/

CREATE OR REPLACE PACKAGE BODY customer_pkg AS

  -- CREATE operation
  PROCEDURE create_customer (
    p_username   IN VARCHAR2,
    p_pass       IN VARCHAR2,
    p_egn        IN VARCHAR2,
    p_first_name IN VARCHAR2,
    p_last_name  IN VARCHAR2,
    p_addl_name  IN VARCHAR2,
    p_address    IN VARCHAR2,
    p_phone      IN VARCHAR2,
    p_email      IN VARCHAR2
  )
  IS
  BEGIN
    INSERT INTO customer (
      username,
      pass,
      egn,
      first_name,
      last_name,
      addl_name,
      address,
      phone,
      email
    ) VALUES (
      p_username,
      dbms_crypto.HASH(utl_i18n.string_to_raw(p_pass, 'AL32UTF8'), 4),
      p_egn,
      p_first_name,
      p_last_name,
      p_addl_name,
      p_address,
      p_phone,
      p_email
    );
    COMMIT;
  END create_customer;

  -- READ operation
  FUNCTION get_customer (p_cust_id IN NUMBER) RETURN customer%ROWTYPE
  IS
    l_customer customer%ROWTYPE;
  BEGIN
    SELECT * INTO l_customer FROM customer WHERE cust_id = p_cust_id;
    RETURN l_customer;
  END get_customer;

  -- UPDATE operation
  PROCEDURE update_customer (
    p_cust_id    IN NUMBER,
    p_username   IN VARCHAR2,
    p_pass       IN VARCHAR2,
    p_egn        IN VARCHAR2,
    p_first_name IN VARCHAR2,
    p_last_name  IN VARCHAR2,
    p_addl_name  IN VARCHAR2,
    p_address    IN VARCHAR2,
    p_phone      IN VARCHAR2,
    p_email      IN VARCHAR2
  )
  IS
  BEGIN
    UPDATE customer SET
      username   = p_username,
      pass = dbms_crypto.HASH(utl_i18n.string_to_raw(p_pass, 'AL32UTF8'), 4),
      egn        = p_egn,
      first_name = p_first_name,
      last_name  = p_last_name,
      addl_name  = p_addl_name,
      address    = p_address,
      phone      = p_phone,
      email      = p_email,
      pass_change_time = sysdate
    WHERE cust_id = p_cust_id;
    COMMIT;
  END update_customer;

  -- DELETE operation
  PROCEDURE delete_customer (p_cust_id IN NUMBER)
  IS
  BEGIN
    DELETE FROM customer WHERE cust_id = p_cust_id;
    COMMIT;
  END delete_customer;

END customer_pkg;

