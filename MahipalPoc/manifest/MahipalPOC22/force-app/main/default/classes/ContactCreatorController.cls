public with sharing class ContactCreatorController {

    @AuraEnabled
    public static List<Contact> createContacts(
        Id accountId,
        List<Contact> contactsToCreate
    ) {

        // 1️⃣ Validate Account
        Account acc = [
            SELECT Id, Name
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];

        if (acc == null) {
            throw new AuraHandledException('Account not found.');
        }

        // 2️⃣ Assign AccountId safely
        List<Contact> contacts = new List<Contact>();

        for (Contact c : contactsToCreate) {

            Contact newContact = new Contact(
                FirstName = c.FirstName,
                LastName = c.LastName,
                Email = c.Email,
                AccountId = accountId
            );

            contacts.add(newContact);
        }

        // 3️⃣ Bulk DML
        insert contacts;

        return contacts;
    }
}