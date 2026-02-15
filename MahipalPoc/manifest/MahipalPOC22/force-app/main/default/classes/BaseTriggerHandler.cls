public abstract class BaseTriggerHandler {

    // ===== BEFORE EVENTS =====

    public virtual void beforeInsert(List<SObject> newRecords) {}

    public virtual void beforeUpdate(
        List<SObject> newRecords,
        Map<Id, SObject> oldMap
    ) {}

    public virtual void beforeDelete(List<SObject> oldRecords) {}

    public virtual void beforeUndelete(List<SObject> newRecords) {}


    // ===== AFTER EVENTS =====

    public virtual void afterInsert(List<SObject> newRecords) {}

    public virtual void afterUpdate(
        List<SObject> newRecords,
        Map<Id, SObject> oldMap
    ) {}

    public virtual void afterDelete(List<SObject> oldRecords) {}

    public virtual void afterUndelete(List<SObject> newRecords) {}
}