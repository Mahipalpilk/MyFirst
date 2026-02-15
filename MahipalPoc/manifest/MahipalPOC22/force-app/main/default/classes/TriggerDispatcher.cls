public class TriggerDispatcher {
    public static void run() {
        Schema.SObjectType sObjType =
    (Trigger.isDelete ? Trigger.old[0] : Trigger.new[0])
        .getSObjectType();

        BaseTriggerHandler handler =
            TriggerHandlerFactory.getHandler( sObjType);

        if (handler == null) return;
		
		// Wrap with decorator (toggleable)
        handler = new LoggingDecorator(handler);

        if (Trigger.isBefore && Trigger.isInsert)
            handler.beforeInsert(Trigger.new);

        if (Trigger.isAfter && Trigger.isInsert)
            handler.afterInsert(Trigger.new);

        if (Trigger.isBefore && Trigger.isUpdate)
            handler.beforeUpdate(Trigger.new, Trigger.oldMap);

        if (Trigger.isAfter && Trigger.isUpdate)
            handler.afterUpdate(Trigger.new, Trigger.oldMap);

        if (Trigger.isBefore && Trigger.isDelete)
            handler.beforeDelete(Trigger.old);

        if (Trigger.isAfter && Trigger.isDelete)
            handler.afterDelete(Trigger.old);
    }
}