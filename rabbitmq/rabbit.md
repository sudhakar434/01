Rabbitmq Server
==============

```
sudo apt-get install rabbitmq-server
```


rabbitmqctl
-----------

```
sudo rabbitmqctl list_users
sudo rabbitmqctl add_user <user> <pass>

sudo rabbitmqctl list_vhosts
sudo rabbitmqctl add_vhost <my_host>

sudo rabbitmqctl set_permissions -p <vir_host> <user> ".*" ".*" ".*"

sudo rabbitmqctl list_queues
sudo rabbitmqctl list_exchanges

sudo rabbitmqctl stop_app
sudo rabbitmqctl reset
sudo rabbitmqctl start_app
```


rabbitmq-plugins
---------------

```
rabbitmq-plugins list
rabbitmq-plugins enable rabbitmq_management
```
