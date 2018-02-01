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

DESCRIPTION = "Use deinit to create a deinitializer if you need to perform some cleanup before the object is deallocated. Subclasses include their superclass name after their class name, separated by a colon. There is no requirement for classes to subclass any standard root class, so you can include or omit a superclass as needed. Methods on a subclass that override the superclass’s implementation are marked with override—overriding a method by accident, without override, is detected by the compiler"

def enroll_internal()
  stub = Services::RepositoryEnrollerService::Stub.new("#{HOST}:#{PORT}", :this_channel_is_insecure)

  repository = Mx::Jovannypcg::Grpcserver::Messages::Repository.new(
        "name" => 'protocol-ruby',
        "description" => DESCRIPTION,
        "starts" => 234521,
        "code_frequency" => 5.45,
        "language_contributions" => {"go" => 54, "rust" => 23},
        "avatar" => "https://avatars1.githubusercontent.com/u/130124?s=460&v=4",
        "url" => "https://github.com/onewland/blog")

  puts "Sending #{repository.name}..."
  response = stub.enroll(repository)

  puts "Response: #{response.inspect}"
end

loop do
  enroll_internal
  sleep 2
end
