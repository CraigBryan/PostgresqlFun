#!/bin/bash

echo Running Tests

#TODO add some postgres configuration garbage to switch to psql 8.1
  #edit system psql conf file
  #restart psql server(s)

#TODO create appropriate db (or maybe this has to already exist)
  #This may happen within the sql. See http://www.postgresql.org/docs/9.0/static/sql-createdatabase.html
  #Actually, probably HAS to happen within the sql

#runs the test sql, assuming the database is called "testdb"
psql -d testdb -a -f testcase_sql.sql

ruby check_results.rb 

#TODO cleanup
  #erase db
  #switch db back