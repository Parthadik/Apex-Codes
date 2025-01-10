@isTest
public with sharing class AddPrimaryContactTest {
    @isTest
    static void testAddPrimaryContact() {
        // Insert 50 Account records for BillingState CA
        List<Account> accountsCA = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            accountsCA.add(new Account(Name = 'Account CA ' + i, BillingState = 'CA'));
        }
        insert accountsCA;

        // Create a Contact to be inserted
        Contact testContact = new Contact(FirstName = 'John', LastName = 'Doe');

        // Create an instance of AddPrimaryContact for state CA
        AddPrimaryContact addContactJob = new AddPrimaryContact(testContact, 'CA');

        // Enqueue the job
        Test.startTest();
        System.enqueueJob(addContactJob);
        Test.stopTest();

        // Verify that Contacts were inserted for Accounts with BillingState CA
        List<Contact> insertedContacts = [SELECT Id, AccountId FROM Contact WHERE Account.BillingState = 'CA'];
        
        System.assertEquals(50, insertedContacts.size(), 'There should be 50 Contacts inserted for Accounts in CA.');
    }
}