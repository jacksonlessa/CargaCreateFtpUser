user="$1"
pass="$2"
basepath=/home/ftp/
userpath=$basepath"$user"

mkdir $userpath
useradd --home $userpath --group ftp-users --shell /bin/dummy "$user";
echo "$user:$pass" | chpasswd
chown "$user" $userpath
chmod -R 777 $userpath
service vsftpd restart
