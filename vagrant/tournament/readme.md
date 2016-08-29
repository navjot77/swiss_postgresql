** Author Navjot Singh **
** ProjectL: Tournament Results **

Environment Used: Vagrant and virtual box
Command Line Tool Used: Git Bash
Python version: 2.7

The folder tournament contains 3 files which are required for project
to be executed and tested.
->tournament.py : This file contains list of function definitions required
                by application code. These function execute the psql database
                queries.
->tournament.sql : This file containes the database table and views.
->tournament_test.py: This file is used to run and test the output of project.

One can use vagrant and command line psql commands to execute the whole
database. Some important commands to execute process.
vagrant up : this takes few minutes.
vagrant ssh : this will login into Ubuntu terminal
Go to /vagrant/tournament folder.
psql : This will open psql command line tool for executing database related
        queries.Inside psql, one can try these command:
\i file_name.sql  : This will create table, views for database
ctrl+d to exit pqsl.
\? : for help
Here we can use direct sql command to check database; but use ; at end of
    command.
\c database_name: to connect to database.
After exit psql, one can test the code by using following command.
python tournament_test.py

git hub: https://github.com/navjot77/swiss_postgresql
