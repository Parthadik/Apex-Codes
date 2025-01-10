trigger CandidateTrigger on Candidate__c ( before insert ,before update,after update) {
if(Trigger.isBefore){
    if(Trigger.isInsert || Trigger.isUpdate){
       // CandidateTriggerHandler.fieldBlanlk(Trigger.new);
        //CandidateTriggerHandler.validateJobStatus(Trigger.new);
          CandidateTriggerHandler.setApplicationDate(Trigger.new);
        //CandidateTriggerHandler.applicationDate(Trigger.new);

    }
}
 if(Trigger.isInsert || Trigger.isUpdate){
    CandidateTriggerHandler.validateJobStatus(Trigger.new);
 }
}