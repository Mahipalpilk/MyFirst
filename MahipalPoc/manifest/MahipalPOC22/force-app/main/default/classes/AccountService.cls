public class AccountService {

    public static void validateAccounts(List<Account> accounts) {
        for (Account acc : accounts) {
            if (String.isBlank(acc.Name)) {
                acc.addError('Account Name is mandatory');
            }
        }
    }

    public static void setDefaultValues(List<Account> accounts) {
        for (Account acc : accounts) {
            if (acc.Rating == null) {
                acc.Rating = 'Warm';
            }
        }
    }

    public static void postInsertProcess(List<Account> accounts) {
        // Example: Fetch accounts via selector
        List<Account> freshAccounts =
            AccountSelector.getByIds(
                new Map<Id, Account>(accounts).keySet()
            );

        System.debug('Post insert accounts: ' + freshAccounts.size());
    }
}