// NotificationStrategy.cls

public class NotificationStrategy {
    public interface Notification {
        void sendNotification(String message);
    }

    public class EmailNotification implements Notification {
        public void sendNotification(String message) {
            System.out.println("Email sent with message: " + message);
        }
    }

    public class SMSNotification implements Notification {
        public void sendNotification(String message) {
            System.out.println("SMS sent with message: " + message);
        }
    }

    public class PushNotification implements Notification {
        public void sendNotification(String message) {
            System.out.println("Push notification sent with message: " + message);
        }
    }

    private Notification notification;

    public void setNotification(Notification notification) {
        this.notification = notification;
    }

    public void notifyUser(String message) {
        if (notification != null) {
            notification.sendNotification(message);
        } else {
            System.out.println("No notification method set.");
        }
    }
}