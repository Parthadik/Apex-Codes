trigger AccountTrigger on Account (before insert,before update,before delete, after insert,after update) {
   if(trigger.isBefore){
        if(trigger.isInsert){
            AccountTriggerHandler.billingAddressCopy(Trigger.new);
            AccountClass.updateAccountNumberField(Trigger.new);
            AccountClass.ratingChange(trigger.new);
        }

        if(Trigger.isUpdate){
            AccountClass.updatePhone(Trigger.new,Trigger.oldMap);
           AccountClass.updateIndustry(Trigger.new,Trigger.oldMap);
           AccountTriggerHandler.changeIndustry(Trigger.new,Trigger.oldMap);
        }
        
          if(Trigger.isDelete){
            AccountTriggerHandler.preventDeletion(Trigger.old);
            AccountTriggerHandler.emailSend(Trigger.old);
        }
        }
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            //AccountClass.oppRelated(Trigger.new);
            //AccountClass.accRelatedCon(Trigger.new);
            AccountTriggerHandler.annualRevenue(Trigger.new);
            }
        if(Trigger.isUpdate ){
           // AccountTriggerHandler.updateAccRelatedPhone(Trigger.new,Trigger.oldMap);
            AccountClass.updateAccRelatedPhone(Trigger.new , Trigger.oldMap);


        }

        
        }
        }