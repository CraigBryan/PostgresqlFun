#!/bin/bash

echo Running Tests

#disables the other join types (Kat, check the file path and make sure these exist after you install postgresql)
sudo sed -i -e 's/enable_mergejoin = on/enable_mergejoin = off/g' /etc/postgresql/8.1/main/postgresql.conf
sudo sed -i -e 's/enable_nestloop = on/enable_nestloop = off/g' /etc/postgresql/8.1/main/postgresql.conf
#TODO cd back to proper folder! (Kat, I don't know where yours is)

#TODO add some postgres configuration garbage to switch to psql 8.1
  #edit system psql conf file
  #may require making a cluster with pg_ctl?

sudo service restart postgresql

#TODO create appropriate db (or maybe this has to already exist)
  #This may happen within the sql. See http://www.postgresql.org/docs/9.0/static/sql-createdatabase.html
  #Actually, probably HAS to happen within the sql
  #possibly use initdb?

#runs the test sql, assuming the database is called "testdb"
psql -d testdb -a -f testcase_sql.sql

ruby check_results.rb 

dropdb testdb

#TODO cleanup
  #switch db back
    #edit system psql conf file
    #restart psql server(s)