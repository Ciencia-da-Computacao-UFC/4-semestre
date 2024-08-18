import java.util.concurrent.*;

public class ActiveObject<Message> implements Proxy<Message>{

    private final BlockingQueue<Future<Message>> dispatchQueue = new LinkedBlockingQueue<>();

    private final ExecutorService scheduler = Executors.newScheduledThreadPool(5);

    private Callable<Message> createMessageRequest(String message) {
        return () -> {
            Servant servant = new Servant();
            return (Message) servant.processMessage(message);
        };
    }

    private void enqueue(Callable<Message> messageRequest) throws InterruptedException{
        dispatchQueue.put(scheduler.submit(messageRequest));
    }

    @Override
    public Future<Message> processMessage(final String message) {
        try {
            // converte a chamada de método em solicitação de método
            Callable<Message> messageRequest = createMessageRequest(message);

            // passa para o agendador e enfileira a solicitação do método
            enqueue(messageRequest);

            // retorna future para o client
            return dispatchQueue.take();
        } catch (InterruptedException e) {
            throw new RuntimeException("Active Object error: ", e);
        }
    }
}