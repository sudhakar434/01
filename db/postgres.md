## PSQL



```
# for password less login
sudo -u user_name psql db_name

# to reset the password if you have forgotten
ALTER USER "user_name" WITH PASSWORD 'new_password';
```


```
# show databases
\l
SELECT datname FROM pg_database;

# connect to database
\c <dbname>

# show all tables in all dbs
\dt *.*

# show all tables in current db
\dt

# describe table
\d+ <tablename>

```

### tables

```
# show all rows
SELECT * FROM <table>;

# update rows
UPDATE table
SET column1 = value1,
    column2 = value2
WHERE
 condition;
```
