public class Servant {

    public Message processMessage(String message) {
        try {
            System.out.println("Servant is exec process Message.");
            Thread.sleep(1000);
            return new Message("The message was received. Original message: " + message);
        } catch (InterruptedException e) {
            throw new RuntimeException("Servant error :", e);
        }
    }
}