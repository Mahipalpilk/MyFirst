public class AccountLogger implements ILogger {

    public void log(String action, String status, String message) {
        Account__c log = new Account__c();
        log.Name = action;
        log.Action__c = action;
        log.Status__c = status;
        log.Message__c = message;
        insert log;
    }
}