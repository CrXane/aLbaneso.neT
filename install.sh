#!/bin/bash

confdir="/etc/apache2/sites-available"
vhostdir="/var/www"
name="albaneso.net"

mkdir $vhostdir/$name
chmod 775 $vhostdir/$name
mkdir $vhostdir/$name/public_html
chmod 775 $vhostdir/$name/public_html

cat <<EOF > /etc/apache2/sites-available/$name.conf
<VirtualHost *:80>
   ServerAdmin webmaster@$name
   ServerName $name
   ServerAlias www.$name
   DocumentRoot /var/www/$name/public_html
   ErrorLog ${APACHE_LOG_DIR}/error.log
   CustomLog ${APACHE_LOG_DIR}/access.log combined
   <Directory $vhostdir/$name>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride All
                Order allow,deny
                allow from all
   </Directory>
</virtualhost>
EOF

sudo a2ensite $name.conf
service apache2 restart

mv LICENSE $vhostdir/$name/public_html
mv index.html $vhostdir/$name/public_html
mv versace.png $vhostdir/$name/public_html
mv versace_logo.png $vhostdir/$name/public_html
