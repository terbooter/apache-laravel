cd / && ~/.composer/vendor/bin/laravel new temp-app -vvv
mv /temp-app/* /var/www/laravel-app
rm /temp-app/ -R
chmod a+rw /var/www/laravel-app/storage /var/www/laravel-app/bootstrap/cache/ -R