require 'bunny'
require 'grpc'
require 'services_services_pb'
require 'messages_pb'

QUEUE_NAME = 'repository_enrollments'

class EnrollmentsController < ApplicationController
  def index
    @repos = []

    conn = Bunny.new
    conn.start

    ch = conn.create_channel
    queue = ch.queue(QUEUE_NAME, :auto_delete => false, :durable => true)

    queue.subscribe do |delivery_info, metadata, payload|
      decoded_repository = Mx::Jovannypcg::Grpcserver::Messages::Repository.decode(payload)

      puts decoded_repository.inspect

      @repos << decoded_repository
    end

    conn.close
  end
end
