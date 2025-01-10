@isTest
public with sharing class OppProcessorTest {
    @isTest
      private static void testBatchClass(){
        List<Opportunity> oppList = new List<Opportunity>();

        for(Integer i=0;i<100;i++){

            Opportunity opp = new Opportunity();

            opp.Name='Test'+i;
            opp.CloseDate=System.today();
            opp.StageName='Prospecting';
            oppList.add(opp);

        }

        Test.startTest();
        insert oppList;
        OppProcessor oppProcess = new OppProcessor();
        Id batchId = Database.executeBatch(oppProcess,100);
        Test.stopTest();

        List<Opportunity> newOppList = [SELECT Id FROM Opportunity WHERE LeadSource='Other'];

        System.assertEquals(100, newOppList.size());
      }
    
}