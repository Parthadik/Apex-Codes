public with sharing class CandidateTriggerHandler {

    //Assignment 4 Q 1

    public static void fieldBlanlk(List<Candidate__c> candList){

        for(Candidate__c can : candList){

            if(can.Expected_Salary__c == null){

                can.addError('Expected Salary field is missing');
            }
        }
    }

   
   
         //Assignment 4 Q3

        public static void setApplicationDate(List<Candidate__c> candidates) {
            List<Candidate__c> candidatesToUpdate = new List<Candidate__c>();
            
            for (Candidate__c can : candidates) {
                if(can.Application_Date__c == null || can.Application_Date__c != null ) {
                    can.Application_Date__c = System.today();
                  
                }
            }
            
          //  if (!candidatesToUpdate.isEmpty()) {
               // update candidatesToUpdate;
           // }
        }

        

       //Assignment 4 Q 2
 
        public static void validateJobStatus(List<Candidate__c> candidates) {
            Set<Id> jobIds = new Set<Id>();
            
            for (Candidate__c candidate : candidates) {
                jobIds.add(candidate.Job__c);
            }
    
            List<Job_parthadik__c> jobs = [SELECT Id, Status__c FROM Job_parthadik__c WHERE Id IN :jobIds];

            for (Candidate__c candidate : candidates) {

                for (Job_parthadik__c job : jobs) {
                    if (candidate.Job__c == job.Id && job.Status__c == 'Not Active') {
                        candidate.addError('This Job is not active. You cannot apply for this job.');
                        
                    }
                }
            }
        }
    }