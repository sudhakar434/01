#### MySQL


    # Filtering MySQL Table
    SELECT * FROM my_table WHERE <field> LIKE '%query%' LIMIT 10;

    # Backup MySQL
    mysqldump -u root -p database > database.sql
    mysqldump -u root -p database table > table.sql

    # Show tables begin with b
    show tables like 'b%';

    # show all tables, table row count
    SELECT TABLE_NAME, TABLE_ROWS FROM `information_schema`.`tables` WHERE `table_schema` = '<db name>';

    # show status of all tables
    SHOW TABLE STATUS [FROM <database>] [LIKE <pattern>]
