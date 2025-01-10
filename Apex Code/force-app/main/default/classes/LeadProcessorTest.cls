@isTest
public with sharing class LeadProcessorTest {
    @isTest
    static void testLeadProcessor() {
     
        List<Lead> testLeads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            testLeads.add(new Lead(FirstName = 'Test', LastName = 'Lead ' + i, Company = 'Test Company'));
        }
        insert testLeads;

       
        List<Lead> insertedLeads = [SELECT Id, LeadSource FROM Lead WHERE Id IN :testLeads];
        System.assertEquals(200, insertedLeads.size(), '200 Leads should be inserted.');

      
        Test.startTest();
        LeadProcessor leadBatch = new LeadProcessor();
        Database.executeBatch(leadBatch);
        Test.stopTest();

        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE Id IN :testLeads];
        
        for (Lead lead : updatedLeads) {
            System.assertEquals('Dreamforce', lead.LeadSource, 'LeadSource should be updated to Dreamforce.');
        }
    }
}