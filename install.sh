~/.composer/vendor/bin/laravel new temp-app
mv temp-app/* /var/www/laravel-app
rm temp-app/ -R
chmod a+rw /var/www/laravel-app/storage -R