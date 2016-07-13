# mariadb
Simple container with running instance of MariaDB. I hihly recommend you to mount $DB_DATADIR outside of this container!

## Volumes
One volume same as $DB_DATADIR

## Ports
3306

## Environment variables

### DB_USER
User with this name will be created at new database. Default 'user'.

### DB_PASSWORD
User will be identified with this password. Default 'secret'.

### DB_NAME
Database with this name will be created. Default 'db'.

### DB_DATADIR
Path of MariaDB data dir. Default '/var/lib/mysql' and I don't recommend you to change it.