@isTest
public with sharing class MyDataGenerationTests {
    @TestSetup
    static void MyDataGenerationTests(){
        List<SObject> accounts =Test.loadData(Account.sObjectType,'otherAccountData');
        
    }
    @isTest
    static void testmyDataGenerationTests1(){
        List<Account> acc1 =[SELECT Id From Account];
        System.assert(acc1.size() == 15 ,'expected 15 Accounts');
    }

    
}