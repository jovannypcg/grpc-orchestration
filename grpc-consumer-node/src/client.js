'use strict';

const debug = require('debug')('grpc-client');

const PROTO_PATH = __dirname + '/../proto/services.proto';

const AMQP_QUEUE = 'repository_enrollments';
const AMQP_TAG = " [AMQP *] ===>";

let grpc = require('grpc');
let amqp = require('amqplib/callback_api');

let services = grpc.load(PROTO_PATH).services;
let messages = grpc.load(PROTO_PATH).mx.jovannypcg.grpcserver.messages;

console.log(services);
console.log(messages);

function read() {
  debug(AMQP_TAG + "Connecting to RabbitMQ...");
  amqp.connect('amqp://localhost', function(err, conn) {
    conn.createChannel(function(err, ch) {
      ch.assertQueue(AMQP_QUEUE, { durable: true });

      debug(AMQP_TAG + "Waiting for messages in " + AMQP_QUEUE + ". To exit press CTRL+C");
      ch.consume(AMQP_QUEUE, function(msg) {
        let buffer = new Buffer(msg.content);
        let decoded_repository = messages.Repository.decode(buffer);

        debug(" ===> Decoded repository: " + decoded_repository.name + "; " + decoded_repository.starts + "; " + decoded_repository.description);
      }, {noAck: true});
    });
  });
}

read();
