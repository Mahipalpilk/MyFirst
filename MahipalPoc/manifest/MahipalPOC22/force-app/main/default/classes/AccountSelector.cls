public class AccountSelector {

    public static List<Account> getByIds(Set<Id> accountIds) {
        return [
            SELECT Id, Name, Rating
            FROM Account
            WHERE Id IN :accountIds
        ];
    }

    public static List<Account> getTopAccounts(Integer limitSize) {
        return [
            SELECT Id, Name
            FROM Account
            ORDER BY CreatedDate DESC
            LIMIT :limitSize
        ];
    }
}