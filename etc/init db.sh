sudo /etc/init.d/mysql start

mysql -uroot -e "CREATE DATABASE web;"
mysql -uroot -e "create user 'box'@'localhost' identified by '1234';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON web.* TO 'box'@'localhost' WITH GRANT OPTION;"

cd ~/web/ask

python3 manage.py makemigrations qa

python3 manage.py migrate
