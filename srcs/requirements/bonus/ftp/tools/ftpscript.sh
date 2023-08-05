
adduser $FTP_USER --gecos "" --disabled-password
echo "$FTP_USER:$PASSWORD" | chpasswd
printf '%s\n' toor toor | pure-pw useradd -m $WP_USER -u 1001 -g 1001 -d /var/www/html/wordpress/
pure-pw mkdb
sed -i 's/# Bind                         127.0.0.1,21/Bind 0.0.0.0,2121/g' /etc/pure-ftpd/pure-ftpd.conf 

exec pure-ftpd -p 2121:2121 -l puredb:/etc/pure-ftpd/pureftpd.pdb
