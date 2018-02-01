package mx.jovannypcg.grpcclient;

import com.google.protobuf.InvalidProtocolBufferException;
import mx.jovannypcg.grpcclient.messages.EnrollmentResponse;
import mx.jovannypcg.grpcclient.messages.Repository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.HashMap;
import java.util.Map;

@SpringBootApplication
public class Application implements CommandLineRunner {
    private static final Logger LOGGER = LoggerFactory.getLogger(Application.class);

    private static final String HOST = "localhost";
    private static final int PORT = 5000;
    private static final String DESCRIPTION = "SMS Long code service is primarily used for lead generation " +
            "or receiving feedbacks from the customers. In a shared long code environment every company " +
            "which wants to avail this service will be provided with a Keyword (Keyword is an unique identifier " +
            "for your company on our shared Long code. e.g. if, your companies name is ABC Ltd and you took a " +
            "keyword say ABCL on our long code then every message which starts with ABCL and a blank space will " +
            "be forwarded to your panel. In short we recognize the incoming messages on the basis of keywords and " +
            "forward it to the respective companies account).";

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Override
    public void run(String... args) throws InterruptedException, InvalidProtocolBufferException {
        while (true) {
            enrollInternal();
            Thread.sleep(3000);
        }
    }

    private void enrollInternal() throws InterruptedException, InvalidProtocolBufferException {
        Client client = new Client(HOST, PORT);

        Map<String, Integer> languageContributions = new HashMap<>();
        languageContributions.put("Java", 123);
        languageContributions.put("Ruby", 543);
        languageContributions.put("Elixir", 6234);

        Repository request = Repository.newBuilder()
                .setName("protocol-server-java")
                .setDescription(DESCRIPTION)
                .setCodeFrequency(5.4f)
                .putAllLanguageContributions(languageContributions)
                .setStarts(2345341L)
                .setAvatar("https://avatars2.githubusercontent.com/u/7593599?s=460&v=4")
                .setUrl("https://github.com/jovannypcg/grpc-orchestration")
                .build();

        try {
            EnrollmentResponse response = client.enroll(request);
            LOGGER.info("Response from gRPC Server: " + response.toString());
        } finally {
            client.shutdown();
        }
    }
}
