@isTest
public with sharing class UpdateParentAccountTest {
    @TestSetup

    static void setup(){
        List<Account> accList = new List<Account>();
        accList.add(new Account(Name ='ABC1'));

         for(Integer i=0;i<100;i++){
            accList.add(new Account(Name = 'Test Account'+i));

         }
         insert accList;
    }

    @isTest
    private static void testQueueable(){
        Id parentId =[SELECT Id FROM Account WHERE Name ='ABC1'][0].id;

        List<Account> accList = [SELECT Id,Name FROM Account WHERE Name Like:'Test Account%'];

        UpdateParentAccount updateJob = new UpdateParentAccount(accList , parentId);
        Test.startTest();
         System.enqueueJob(updateJob);
         Test.stopTest();
         System.assertEquals(100, [SELECT COUNT() FROM Account WHERE parentId =:ParentId]);

    }
        
       
         }