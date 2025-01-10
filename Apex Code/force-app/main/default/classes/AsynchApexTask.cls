public with sharing class AsynchApexTask implements Schedulable {
    
        public void execute(SchedulableContext context) {
            
            List<Job_parthadik__c> expiredJobs = [SELECT Id, Status__c FROM Job_parthadik__c WHERE Expires_ON__c <= :System.today() AND Status__c != 'Not Active'];
    
            for(Job_parthadik__c job : expiredJobs) {
                job.Status__c = 'Not Active';
            }
              if (!expiredJobs.isEmpty()) {
                update expiredJobs;
                }
        }
    }