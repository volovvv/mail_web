#git clone https://github.com/volovvv/mail_web.git

#sudo mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.disabled
#sudo ln -s /home/box/web/etc/nginx.conf /etc/nginx/conf.d/box.conf
#sudo nginx -s reload
#sudo ls -lh /etc/nginx/conf.d/

#cd /home/box
#gunicorn --daemon --bind "0.0.0.0:8080" web.hello:hello
sudo apt update
sudo apt install python3.5 -y
sudo apt install python3.5-dev -y
sudo unlink /usr/bin/python3
sudo ln -s /usr/bin/python3.5 /usr/bin/python3
sudo python3 -m pip install gunicorn
sudo python3 -m pip install django==2.0
sudo python3 -m pip install mysqlclient

sudo /etc/init.d/mysql start

mysql -uroot -e "CREATE DATABASE web;"
mysql -uroot -e "create user 'box'@'localhost' identified by '1234';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON web.* TO 'box'@'localhost' WITH GRANT OPTION;"

cd ~/web/ask

python3 manage.py makemigrations qa

python3 manage.py migrate
 

#cd /home/box/web/ask
#gunicorn --config /home/box/web/etc/gunicorn.conf.py ask.wsgi