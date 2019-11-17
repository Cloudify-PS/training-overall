#!/bin/bash
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/9.3/main/postgresql.conf
sudo sh -c "echo \"host     all   all   0.0.0.0/0   md5\" >> /etc/postgresql/9.3/main/pg_hba.conf"
sudo sh -c "echo \"hostssl     all   all   0.0.0.0/0   md5\" >> /etc/postgresql/9.3/main/pg_hba.conf"
sudo update-rc.d postgresql enable
sudo service postgresql restart
sudo echo -e "postgres\npostgres" | (sudo passwd postgres)
sudo -H -u postgres bash -c  "psql -c \"create database pools;\""
sudo -H -u postgres bash -c  "psql -c \"create user $1 with password '$2';\""
sudo -H -u postgres bash -c  "psql -c \"grant all privileges on database pools to $1;\""