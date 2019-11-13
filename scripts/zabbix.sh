# repo install
rpm -Uvh https://repo.zabbix.com/zabbix/4.2/rhel/7/x86_64/zabbix-release-4.2-2.el7.noarch.rpm

# install packages
 yum -y install zabbix-server-pgsql zabbix-web-pgsql zabbix-agent

password="zabbix"
 # create user
 sudo -u postgres psql -c "create user zabbix password '${password}'"
 sudo -u postgres psql -c "create database zabbix with owner zabbix"

# import schema
PGPASSWORD=${password} zcat /usr/share/doc/zabbix-server-pgsql*/create.sql.gz | sudo -u zabbix psql -h localhost zabbix

sed -i 's/^DBPassword=*/DBPassword=${password}/g' /etc/zabbix/zabbix_server.conf

sed -i 's/^php_value date.timezone Europe\/Riga/php_value date.timezone Europe\/Istanbul/g' /etc/httpd/conf.d/zabbix.conf

systemctl restart zabbix-server zabbix-agent httpd
systemctl enable zabbix-server zabbix-agent httpd
