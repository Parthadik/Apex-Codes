@isTest
public class AsynchApexTaskTest {
    
    @isTest
    static void testExecute() {
        // Create test data with required fields
        Job_parthadik__c job1 = new Job_parthadik__c(
            Name__c = 'Test Job 1', 
            Status__c = 'Active', 
            Expires_ON__c = System.today().addDays(-1), 
            Total_positions__c = 5,
            Manager__c = '003dM0000094fKLQAY' // Replace with a valid User Id
        );
        Job_parthadik__c job2 = new Job_parthadik__c(
            Name__c = 'Test Job 2', 
            Status__c = 'Active', 
            Expires_ON__c = System.today().addDays(-1), 
            Total_positions__c = 10,
            Manager__c = '003dM0000094fKLQAY' // Replace with a valid User Id
        );
        Job_parthadik__c job3 = new Job_parthadik__c(
            Name__c = 'Test Job 3', 
            Status__c = 'Not Active', 
            Expires_ON__c = System.today().addDays(-1), 
            Total_positions__c = 8,
            Manager__c = '003dM0000094fKLQAY' // Replace with a valid User Id
        );
        insert new List<Job_parthadik__c>{job1, job2, job3};
        
        // Execute the scheduled job
        Test.startTest();
        String jobId = System.schedule('TestJob', '0 0 0 1 1 ? 2040', new AsynchApexTask());
        Test.stopTest();
        
        // Verify the results
        Job_parthadik__c updatedJob1 = [SELECT Status__c FROM Job_parthadik__c WHERE Id = :job1.Id];
        Job_parthadik__c updatedJob2 = [SELECT Status__c FROM Job_parthadik__c WHERE Id = :job2.Id];
        Job_parthadik__c updatedJob3 = [SELECT Status__c FROM Job_parthadik__c WHERE Id = :job3.Id];
        
        System.assertEquals('Not Active', updatedJob1.Status__c);
        System.assertEquals('Not Active', updatedJob2.Status__c);
        System.assertEquals('Not Active', updatedJob3.Status__c); // This should remain 'Not Active'
    }
}