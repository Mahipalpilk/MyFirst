public class EmailService implements IEmailService {

    public void sendAccountCreatedEmail(Account acc) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[]{userinfo.getUserEmail()});
        mail.setSubject('Account Created');
        mail.setPlainTextBody('Account ' + acc.Name + ' created.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }
}