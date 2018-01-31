# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: messages.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "mx.jovannypcg.grpcserver.messages.Repository" do
    optional :name, :string, 1
    optional :description, :string, 2
    optional :starts, :int64, 3
    optional :code_frequency, :float, 4
    map :language_contributions, :string, :int32, 5
  end
  add_message "mx.jovannypcg.grpcserver.messages.EnrollmentResponse" do
    optional :ack, :bool, 1
  end
  add_message "mx.jovannypcg.grpcserver.messages.Ping" do
    optional :ball, :int32, 1
  end
  add_message "mx.jovannypcg.grpcserver.messages.Pong" do
    optional :ball, :int32, 1
  end
end

module Mx
  module Jovannypcg
    module Grpcserver
      module Messages
        Repository = Google::Protobuf::DescriptorPool.generated_pool.lookup("mx.jovannypcg.grpcserver.messages.Repository").msgclass
        EnrollmentResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("mx.jovannypcg.grpcserver.messages.EnrollmentResponse").msgclass
        Ping = Google::Protobuf::DescriptorPool.generated_pool.lookup("mx.jovannypcg.grpcserver.messages.Ping").msgclass
        Pong = Google::Protobuf::DescriptorPool.generated_pool.lookup("mx.jovannypcg.grpcserver.messages.Pong").msgclass
      end
    end
  end
end
