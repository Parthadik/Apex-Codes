@isTest
public class DailyLeadProcessorTest {
    @isTest
    static void testDailyLeadProcessor() {

        List<Lead> testLeads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            testLeads.add(new Lead(FirstName = 'Test', LastName = 'Lead ' + i, Company = 'Test Company', LeadSource = null));
        }
        insert testLeads;

        String cronExp = '0 0 * * * ?'; 
        DailyLeadProcessor leadProcessorJob = new DailyLeadProcessor();
        
        Test.startTest();
        System.schedule('Daily Lead Processor Job', cronExp, leadProcessorJob);
        Test.stopTest();


        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE Id IN :testLeads];
        
        for (Lead lead : updatedLeads) {
            System.assertEquals('Dreamforce', lead.LeadSource, 'The LeadSource should be updated to Dreamforce.');
        }
    }
}