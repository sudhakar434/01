## Rabbitmq Server

   sudo apt-get install rabbitmq-server

   sudo rabbitmqctl add_user user pass
   sudo rabbitmqctl add_vhost my_host
   sudo rabbitmqctl set_permissions -p vir_host user ".*" ".*" ".*"

   sudo rabbitmqctl list_users
   sudo rabbitmqctl list_queues
   sudo rabbitmqctl list_exchanges
   sudo rabbitmqctl list_vhosts

   sudo rabbitmq-plugins enable rabbitmq_management

   sudo rabbitmqctl stop_app
   sudo rabbitmqctl reset
   sudo rabbitmqctl start_app
