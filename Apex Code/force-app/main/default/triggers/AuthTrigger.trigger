trigger AuthTrigger on Author__c (before insert, before update, before delete) { 
    if (Trigger.isBefore) {
         if (Trigger.isInsert || Trigger.isUpdate) {
             AuthorTriggerHandler.updateDescription(Trigger.new); 
            } 
            if (Trigger.isDelete) 
            { AuthorTriggerHandler.preventDeletion(Trigger.old); 
            }
        }
     }