## PSQL



```
# for password less login
sudo -u user_name psql db_name

# to reset the password if you have forgotten
ALTER USER "user_name" WITH PASSWORD 'new_password';
```


```
\l   # show databases
SELECT datname FROM pg_database;

\c <dbname>  # connect to database

\d+ <tablename>  # describe table
```
