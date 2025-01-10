@isTest
public with sharing class AccountProcessorTest {
    

    @isTest
    static void testCountContacts() {
        // Create a single Account
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        // Create 2 Contacts for the Account
        Contact contact1 = new Contact(FirstName = 'John', LastName = 'Doe', AccountId = testAccount.Id);
        Contact contact2 = new Contact(FirstName = 'Jane', LastName = 'Doe', AccountId = testAccount.Id);
        insert new List<Contact>{contact1, contact2};

        // Call the future method to count Contacts
        Test.startTest();
        AccountProcessor.countContacts(new List<Id>{testAccount.Id});
        Test.stopTest();

        // Verify that the Number_Of_Contacts__c field is updated correctly
        testAccount = [SELECT Number_Of_Contacts__c FROM Account WHERE Id = :testAccount.Id];
        System.assertEquals(2, testAccount.Number_Of_Contacts__c, 'The contact count should be 2.');
    }
}