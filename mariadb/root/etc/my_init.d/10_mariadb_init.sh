#!/bin/bash
RUN_DIR="/var/run/mysqld"
mkdir -p $RUN_DIR
chown mysql $RUN_DIR

VOLUME_HOME=${DB_DATADIR}

if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> An empty or uninitialized MariaDB volume is detected in $VOLUME_HOME"
    echo "=> Installing MariaDB ..."
    mysql_install_db
    echo "=> Done!"  
else
    echo "=> Using an existing volume of MariaDB"
fi

# Start the MySQL daemon in the background.
/usr/sbin/mysqld &
mysql_pid=$!

echo "Waiting for MariaDB"
until mysqladmin ping &>/dev/null; do
    echo -n "."; sleep 0.2
done
echo "DONE"

if ! mysql -u${DB_USER} -p{DB_PASSWORD} -e 'use ${DB_NAME}' ; then
    echo "=> Adding new database '${DB_NAME}' and user '${DB_USER}' identified by '${DB_PASSWORD}' ..."
    mysql -uroot -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%' WITH GRANT OPTION"
    mysql -uroot -e "FLUSH PRIVILEGES"
    mysql -uroot -e "CREATE SCHEMA IF NOT EXISTS ${DB_NAME}"

    echo "=> Done!"

    echo "========================================================================"
    echo "You can now connect to this MariaDB Server using:"
    echo ""
    echo "    mysql -u${DB_USER} -p${DB_PASSWORD} --protocol=TCP -P3306 ${DB_NAME}"
    echo ""
    echo "Please remember to change the above password as soon as possible!"
    echo "MariaDB user 'root' has no password but allows only local connections."
    echo "========================================================================"
else
    echo "=> Requested database and database user already existing."
fi

# Tell the MySQL daemon to shutdown.
mysqladmin -uroot shutdown

# Wait for the MySQL daemon to exit.
wait $mysql_pid