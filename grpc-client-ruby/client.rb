this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'services_services_pb'
require 'messages_pb'
require 'pry'
require 'bunny'

STDOUT.sync = true

PORT = 5000
HOST = 'localhost'

def enroll_internal()
  stub = Services::RepositoryEnrollerService::Stub.new("#{HOST}:#{PORT}", :this_channel_is_insecure)

  repository = Mx::Jovannypcg::Grpcserver::Messages::Repository.new(
        "name" => 'protocol-ruby',
        "description" => "gRPC ruby example",
        "starts" => 234521,
        "code_frequency" => 5.45,
        "language_contributions" => {"go" => 54, "rust" => 23})

  puts "Sending #{repository.name}..."
  response = stub.enroll(repository)

  puts "Response: #{response.inspect}"
end

loop do
  enroll_internal
  sleep 2
end
