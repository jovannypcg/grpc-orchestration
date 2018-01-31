package mx.jovannypcg.grpcserver.services.impl;

import io.grpc.stub.StreamObserver;
import mx.jovannypcg.grpcserver.messages.Ping;
import mx.jovannypcg.grpcserver.messages.Pong;
import mx.jovannypcg.grpcserver.services.PingPongServiceGrpc;
import org.springframework.stereotype.Service;

@Service
public class PingPongServiceImpl extends PingPongServiceGrpc.PingPongServiceImplBase {
    @Override
    public StreamObserver<Ping> play(StreamObserver<Pong> responseObserver) {
        return super.play(responseObserver);
    }
}
