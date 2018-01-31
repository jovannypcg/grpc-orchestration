package mx.jovannypcg.grpcserver.amqp;

import com.google.protobuf.GeneratedMessageV3;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Component;

import java.util.Arrays;

@Component
public class Publisher<T extends GeneratedMessageV3> {
    private static final Logger LOGGER = LoggerFactory.getLogger(Publisher.class);

    private RabbitTemplate rabbitTemplate;

    public Publisher(RabbitTemplate rabbitTemplate) {
        this.rabbitTemplate = rabbitTemplate;
    }

    public void publish(T data) {
        byte[] repositoryBytes = data.toByteArray();

        LOGGER.info("Byte representation: " + Arrays.toString(repositoryBytes));

        rabbitTemplate.convertAndSend(repositoryBytes);
    }
}
