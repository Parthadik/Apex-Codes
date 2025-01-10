public with sharing class LeadProcessor implements Database.Batchable<SObject> { 
   
       
        public Database.QueryLocator start(Database.BatchableContext BC) {
            return Database.getQueryLocator([SELECT Id FROM Lead]);
        }
    
    
        public void execute(Database.BatchableContext BC, List<SObject> scope) {
            List<Lead> leadsToUpdate = new List<Lead>();
            
            for (SObject s : scope) {
                Lead lead = (Lead) s;
                lead.LeadSource = 'Dreamforce'; 
                leadsToUpdate.add(lead);
            }
            
            if (!leadsToUpdate.isEmpty()) {
                update leadsToUpdate; 
            }
        }
        public void finish(Database.BatchableContext BC) {
           
        }
    }