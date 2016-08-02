## mongodb

```
    # basics
    show dbs
    use <db>
    db
    show collections

    new Date
    new ObjectId


    # queries

    <query>.forEach(printjson)

    db.collection.count()

    db.<collection>.insert(<doc>);
    db.<collection>.insert({ _id : 3})
    db.<collection>.insert({"_id": getNextSequence("<collection"), "<field>": "<value>"})

    db.<collection>.find();
    db.<collection>.find().forEach(printjson)
    db.<collection>.find({'<field>': '<value>'})
    db.<collection>.find({'<field>': '</.*a.*>'})  #values start with 'a'
    db.<collection>.find()[0]._id.getTimestamp()

    db.<collection>.findOne({ <field>: <value> })
    db.<collection>.findOne({ <field>.<field>: <value> })
    db.<collection>.findOne({ <field>: <value> }).<field>
    db.<collection>.findOne({ <field>: <value> }, {<field>: 1, <field>:0 })


    # auto increment field
    function getNextSequence(name) {
    var ret = db.counters.findAndModify(
          {
              query: { _id: name },
              update: { $inc: { seq: 1 } },
              new: true,
              upsert: true
          }
      );
    return ret.seq;
    }


    # import export

    mongo <host>/<db> <file>.js

    mongoimport --db <db> --collection <collection> <file>.json

    mongoimport --db <db> --collection <collection> <file>.json --jsonArray

    mongoexport --db <db> --collection <collection> --out <file>.json

    mongoexport --db <db> --collection <collection> --out <file>.json --jsonArray
```



## MySQL


```
    # Help
    ? RET
    \h RET

SHOW DATABASES;
SHOW TABLES;
SHOW TABLES LIKE 'b%';  # Show tables begin with b

# show status of all tables
SHOW TABLE STATUS [FROM <database>] [LIKE <pattern> | WHERE <expression>]

SHOW FULL PROCESSLIST;  # show process

SHOW TABLE STATUS WHERE Name = <table>; # show engine type
```


select
------

    # Filtering MySQL Table
    SELECT * FROM my_table WHERE <field> LIKE '%query%' LIMIT 10;


    # show all tables, table row count
    SELECT TABLE_NAME, TABLE_ROWS FROM `information_schema`.`tables`
                                  WHERE `table_schema` = '<db name>';


update
-----

    UPDATE <table> SET <field>=<value>, <field2>=<value2> [WHERE clause]


join
----

    SELECT * FROM tableA INNER JOIN tableB ON tableA.name = tableB.name


delete
-----


### backup & restore


```sh
mysqldump -u root -p database > database.sql
mysqldump -u root -p database table > table.sql


mysqldump -u root -p <database> < database.sql


mysql> create database mydb;
mysql> use mydb;
mysql> source db_backup.dump;
```


pager
=====

    # show page by page
    pager less

    # enable vertical mode
    pager less -SFX
    <query> \G

    # disable pager
    nopager RET
    \n RET


truncate
---------

```
truncate <table name>; # make table empty
```

### reset root password

```sh
sudo service mysql stop

mysqld_safe --skip-grant-tables

mysql -u root
```

```sql
mysql> use mysql;
mysql> update user set password=PASSWORD("foo") where User='root';
mysql> flush privileges;
mysql> quit
```


## SQLite

### Install

```shell
wget http://www.sqlite.org/2016/sqlite-tools-linux-x86-3110100.zip
tar xzvf sqlite-tools-linux-x86-3110100.zip
```


### Basic commands

```shell
# connect to db
$ sqlite3 test.db

# show databases
sqlite> .database

# show tables
sqlite> .tables

# create table
sqlite> create table test(id integer, name varchar(10));

# drop table
sqlite> drop table test;
```


## postgres


### install
```
# uninstall
sudo apt-get --purge remove postgresql postgresql-doc postgresql-common

# install
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib

# restart
sudo service postgresql restart
```


### users

```
# for password less login
sudo -u user_name psql db_name

# change to "postgres" Linux user
sudo su - postgres

# start the psql shell
psql

# check connection
postgres-# \conninfo

# create user
CREATE USER mycroft WITH PASSWORD 'mycroft';

# to reset the password if you have forgotten
ALTER USER "user_name" WITH PASSWORD 'new_password';

# give permissions to createdb
sudo -u postgres psql -c 'alter user kuser with createdb' postgres

#upgrade a user to be a superuser
ALTER USER myuser WITH SUPERUSER;
```

### databases

```psql
# create
create database <foo>;

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

# drop database
drop database <foo>;
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
