public with sharing class JobTriggerHandlerClass {

    public static void jobStatus(List<Job_parthadik__c> jobList){

        for(Job_parthadik__c job : jobList ){

            if(job.Status__c == 'Active'){
                job.addError('This Job is active andcannot be deleted');
            }
        }

    }
    
}