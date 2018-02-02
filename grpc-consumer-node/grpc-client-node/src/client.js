'use strict';

const debug = require('debug')('grpc-client');

const PORT = 5000;
const HOST = 'localhost';
const PROTO_PATH = __dirname + '/../proto/services.proto';

const DESCRIPTION = "In addition to using jOOQ as a standalone SQL builder, you can also use jOOQ's code generation features in order to compile your SQL statements using a Java compiler against an actual database schema. This adds a lot of power and expressiveness to just simply constructing SQL using the query DSL and custom strings and literals, as you can be sure that all database artefacts actually exist in the database, and that their type is correct"

let grpc = require('grpc');

let services = grpc.load(PROTO_PATH).services;
let messages = grpc.load(PROTO_PATH).messages;

function enroll_internal() {
  let stub = new services.RepositoryEnrollerService((HOST + ':' + PORT), grpc.credentials.createInsecure());

  let repository = {
    name: "worker_ui_node",
    description: DESCRIPTION,
    starts: 13451,
    code_frequency: 13.52,
    language_contributions: {
      "ada": 45,
      "smalltalk": 9,
      "elm": 435,
      "js": 124512
    },
    avatar: "https://avatars0.githubusercontent.com/u/26068798?s=460&v=4",
    url: "https://github.com/anthonyikeda-cf/angular-dashboard"
  };

  debug('Sending repository with name: ' + repository.name);

  stub.enroll(repository, function(err, response) {
    debug("Error: " + err);
    debug("Response: " + JSON.stringify(response));
  });
}

setInterval(enroll_internal, 2000);
