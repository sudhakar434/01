#### MySQL

    # Help
    ? RET
    \h RET

    # Filtering MySQL Table
    SELECT * FROM my_table WHERE <field> LIKE '%query%' LIMIT 10;

    # Show tables begin with b
    show tables like 'b%';

    # show all tables, table row count
    SELECT TABLE_NAME, TABLE_ROWS FROM `information_schema`.`tables`
                                  WHERE `table_schema` = '<db name>';

    # show status of all tables
    SHOW TABLE STATUS [FROM <database>] [LIKE <pattern> | WHERE <expression>]


#### joins

    SELECT * FROM tableA INNER JOIN tableB ON tableA.name = tableB.name


#### Backup MySQL

    mysqldump -u root -p database > database.sql
    mysqldump -u root -p database table > table.sql
    mysqldump -h 192.168.0.100 -u root -p pearl paypal_ipn > paypal_ipn.sql


### Pager

    # show page by page
    pager less

    # enable vertical mode
    pager less -SFX
    <query> \G

    # disable pager
    nopager RET
    \n RET
