#git clone https://github.com/volovvv/mail_web.git

sudo rm -rf /etc/nginx/sites-enabled/default
sudo ln -s /home/box/web/ask/etc/nginx.conf /etc/nginx/sites-enabled/box.conf
sudo nginx -s reload
sudo ls -lh /etc/nginx/sites-enabled/
gunicorn --config /home/box/web/ask/etc/gunicorn.conf.py ask.wsgi