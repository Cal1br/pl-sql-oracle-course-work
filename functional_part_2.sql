CREATE OR REPLACE PACKAGE balance_pkg AS
    -- Create a new balance
    PROCEDURE create_balance (
        owner_customer_id IN NUMBER,
        balance           IN NUMBER,
        balance_type      IN VARCHAR2,
        balance_name      IN VARCHAR2
    );

    -- Read a balance by ID
    FUNCTION read_balance (
        balance_id IN NUMBER
    ) RETURN balance%ROWTYPE;

    -- Update a balance
    PROCEDURE update_balance (
        balance_id   IN NUMBER,
        balance      IN NUMBER,
        balance_type IN VARCHAR2,
        balance_name IN VARCHAR2
    );

    -- Delete a balance
    PROCEDURE delete_balance (
        balance_id IN NUMBER
    );
END balance_pkg;
/

CREATE OR REPLACE PACKAGE BODY balance_pkg AS
    -- Create a new balance
    PROCEDURE create_balance (
        owner_customer_id IN NUMBER,
        balance           IN NUMBER,
        balance_type      IN VARCHAR2,
        balance_name      IN VARCHAR2
    ) AS
    BEGIN
        INSERT INTO balance (owner_customer_id, balance, balance_type, balance_name)
        VALUES (owner_customer_id, balance, balance_type, balance_name);

        COMMIT;
    END create_balance;

    -- Read a balance by ID
    FUNCTION read_balance (
        balance_id IN NUMBER
    ) RETURN balance%ROWTYPE AS
        balance_record balance%ROWTYPE;
    BEGIN
        SELECT * INTO balance_record FROM balance WHERE balance_id = read_balance.balance_id;

        RETURN balance_record;
    END read_balance;

    -- Update a balance
    PROCEDURE update_balance (
        balance_id   IN NUMBER,
        balance      IN NUMBER,
        balance_type IN VARCHAR2,
        balance_name IN VARCHAR2
    ) AS
    BEGIN
        UPDATE balance SET balance = update_balance.balance, balance_type = update_balance.balance_type, balance_name = update_balance.balance_name
        WHERE balance_id = update_balance.balance_id;

        COMMIT;
    END update_balance;

    -- Delete a balance
    PROCEDURE delete_balance (
        balance_id IN NUMBER
    ) AS
    BEGIN
        DELETE FROM balance WHERE balance_id = delete_balance.balance_id;

        COMMIT;
    END delete_balance;
END balance_pkg;