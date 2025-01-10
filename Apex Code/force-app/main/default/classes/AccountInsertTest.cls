@isTest
public with sharing class AccountInsertTest {

    
    @isTest
    static void testInsertAccount() {
        // Test data
        String accountName = 'Test Account';
        String accountRating = 'Hot';
        String accountActive = 'Yes';
        
        // Call the method to insert an account
        Test.startTest();
        Id accountId = AccountInsert.insertAccount(accountName, accountRating, accountActive);
        Test.stopTest();
        
        // Assert that an account is created and the id is returned
        Account insertedAccount = [SELECT Id, Name, Rating, Active__c FROM Account WHERE Id = :accountId];
        System.assertEquals(accountName, insertedAccount.Name, 'Account name does not match');
        System.assertEquals(accountRating, insertedAccount.Rating, 'Account rating does not match');
        System.assertEquals(accountActive, insertedAccount.Active__c, 'Account Active__c value does not match');
    }
    
    @isTest
    static void testInsertContact() {
        // Test data for account
        String accountName = 'Test Account for Contact';
        String accountRating = 'Cold';
        String accountActive = 'No';
        
        // Call the method to insert an account and contact
        Test.startTest();
        AccountInsert.insertContact();
        Test.stopTest();
        
        // Verify that the contact is inserted with correct account association
        Contact insertedContact = [SELECT Id, FirstName, LastName, AccountId FROM Contact WHERE FirstName = 'Parth' AND LastName = 'Adik' LIMIT 1];
        System.assertNotEquals(insertedContact, null, 'Contact should be inserted');
        System.assertEquals(insertedContact.AccountId, [SELECT Id FROM Account WHERE Name = :accountName LIMIT 1].Id, 'Contact is not linked to the correct account');
    }
}