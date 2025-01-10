@isTest
public with sharing class AccountCalculatorTest {
    @isTest
    private static void countContactsTest(){

        List<Account> accList = new List<Account>();

        for(Integer i=0; i<250; i++){
            accList.add(new Account(Name='Test Account'+i));
        }
        
        insert accList;

        List<Contact> conList = new List<Contact>();
        List<Id> accId = new List<Id>();
        

        for(Account acc : accList){
            conList.add(new Contact(FirstName='Test Contact',LastName=acc.Name,AccountId=acc.Id));
            accId.add(acc.Id);
        }
        insert conList;

        Test.startTest();
        AccountCalculator.countsContacts(accId);
        Test.stopTest();

        List<Account> newAccList =[SELECT Id, Number_Of_Contacts__c FROM Account];

        System.assertEquals(1,newAccList[0].Number_Of_Contacts__c,'Contact Not Counted');
    }
    
}