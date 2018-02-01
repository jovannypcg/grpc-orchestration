# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: services.proto for package 'services'

require 'grpc'
require 'services_pb'

module Services
  module RepositoryEnrollerService
    class Service

      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'services.RepositoryEnrollerService'

      rpc :enroll, Mx::Jovannypcg::Grpcserver::Messages::Repository, Mx::Jovannypcg::Grpcserver::Messages::EnrollmentResponse
    end

    Stub = Service.rpc_stub_class
  end
  module PingPongService
    class Service

      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'services.PingPongService'

      rpc :play, stream(Mx::Jovannypcg::Grpcserver::Messages::Ping), stream(Mx::Jovannypcg::Grpcserver::Messages::Pong)
    end

    Stub = Service.rpc_stub_class
  end
end
