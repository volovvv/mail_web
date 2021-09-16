git clone https://github.com/volovvv/mail_web.git

sudo mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.disabled
sudo ln -s /home/box/web/etc/nginx.conf /etc/nginx/conf.d/box.conf
sudo nginx -s reload
sudo ls -lh /etc/nginx/conf.d/

#cd /home/box
#gunicorn --daemon --bind "0.0.0.0:8080" web.hello:hello

sudo /etc/init.d/mysql start

mysql -uroot -e "create database web;"

mysql -uroot -e "create user 'box'@'localhost' identified by '1234';"

mysql -uroot -e "grant all privileges on stepic_web.* to 'box'@'localhost' with grant option;"

cd ~/web/ask

#python3 manage.py makemigrations qa

#python3 manage.py migrate

#cd /home/box/web/ask
#gunicorn --config /home/box/web/etc/gunicorn.conf.py ask.wsgi