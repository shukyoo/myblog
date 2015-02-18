APP="myblog"
ROOT="/var/www/$APP/current"
sudo cp $ROOT/config/nginx.conf /etc/nginx/conf.d/$APP.conf
sudo cp $ROOT/config/unicorn_init.sh /etc/init.d/unicorn_$APP
sudo cp $ROOT/config/log_rotate.conf /etc/logrotate.d/

sudo chkconfig --add unicorn_$APP 
sudo chkconfig --level 345 unicorn_$APP on
sudo service nginx restart

sudo cp $ROOT/config/resque_init.sh /etc/init.d/unicorn_resque
sudo chkconfig --add unicorn_resque
sudo chkconfig --level 345 unicorn_resque on
