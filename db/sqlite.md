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
