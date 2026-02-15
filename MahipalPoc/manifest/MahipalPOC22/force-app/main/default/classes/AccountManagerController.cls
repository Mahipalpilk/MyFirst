public with sharing class AccountManagerController {

    // SEARCH (Read-only, cacheable)
    @AuraEnabled(cacheable=true)
    public static List<Account> searchAccounts(String searchKey) {

        if (String.isBlank(searchKey)) {
            return new List<Account>();
        }

        searchKey = '%' + searchKey + '%';

        return [
            SELECT Id, Name, Industry, Phone
            FROM Account
            WHERE Name LIKE :searchKey
            ORDER BY CreatedDate DESC
            LIMIT 50
        ];
    }


//     // UPSERT (Async DML)
//     @AuraEnabled
//     public static void upsertAccountsAsync(List<Account> accountsToUpsert) {
//         upsertFuture(accountsToUpsert);
//     }

//    @future
//     private static void upsertFuture(List<Account> accountsToUpsert) {
//         if(accountsToUpsert == null || accountsToUpsert.isEmpty()) return;
//         upsert accountsToUpsert;
//     }


    @AuraEnabled
        public static void upsertAccountsAsync(List<Account> accountsToUpsert) {

            if (accountsToUpsert == null || accountsToUpsert.isEmpty()) {
                return;
            }

            String jsonString = JSON.serialize(accountsToUpsert);
            upsertFuture(jsonString);
        }
        @future
        private static void upsertFuture(String jsonString) {

            if (String.isBlank(jsonString)) {
                return;
            }

            List<Account> accountsToUpsert =
                (List<Account>) JSON.deserialize(jsonString, List<Account>.class);

            upsert accountsToUpsert;
        }


}