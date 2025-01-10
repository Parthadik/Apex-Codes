trigger JobTrigger on Job_parthadik__c (before delete) {

    JobTriggerHandlerClass.jobStatus(Trigger.old);




}