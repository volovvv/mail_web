#git clone https://github.com/volovvv/mail_web.git

sudo mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.disabled
sudo ln -s /home/box/web/etc/nginx.conf /etc/nginx/conf.d/box.conf
sudo nginx -s reload
#sudo ls -lh /etc/nginx/conf.d/
gunicorn --config /home/box/web/etc/gunicorn.conf.py ask.wsgi