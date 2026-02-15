public class LoggingDecorator extends BaseTriggerHandler {

    private BaseTriggerHandler wrapped;

    public LoggingDecorator(BaseTriggerHandler handler) {
        this.wrapped = handler;
    }

    public override void beforeInsert(List<SObject> records) {
        System.debug('LOG: beforeInsert - ' + records.size());
        wrapped.beforeInsert(records);
    }

    public override void afterInsert(List<SObject> records) {
        System.debug('LOG: afterInsert - ' + records.size());
        wrapped.afterInsert(records);
    }

    public override void beforeUpdate(
        List<SObject> records,
        Map<Id, SObject> oldMap
    ) {
        System.debug('LOG: beforeUpdate - ' + records.size());
        wrapped.beforeUpdate(records, oldMap);
    }

    // Override only what you want to log
}