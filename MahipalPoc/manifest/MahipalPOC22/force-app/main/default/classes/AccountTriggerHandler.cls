public class AccountTriggerHandler extends BaseTriggerHandler {

    public override void beforeInsert(List<SObject> records) {
        AccountService.validateAccounts((List<Account>) records);
    }

    public override void afterInsert(List<SObject> records) {
        AccountService.postInsertProcess((List<Account>) records);
    }
}