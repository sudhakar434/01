#!/usr/bin/env python
import pika

credentials = pika.PlainCredentials('guest', 'guest')
parameters = pika.ConnectionParameters('0.0.0.0', 5672, '/', credentials)

connection = pika.BlockingConnection(parameters)

channel = connection.channel()

channel.queue_declare(queue='test')

channel.basic_publish(exchange='', routing_key='test', body='Test message!')
print("Sent 'Test message!'")
connection.close()
