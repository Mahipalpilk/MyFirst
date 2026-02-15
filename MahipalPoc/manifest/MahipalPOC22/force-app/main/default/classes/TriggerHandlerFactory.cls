public class TriggerHandlerFactory {

    public static BaseTriggerHandler getHandler(Schema.SObjectType sObjType) {

        if (sObjType == Account.SObjectType) {
            return new AccountTriggerHandler();
        }

        return null;
    }
}