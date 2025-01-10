public with sharing class DeleteLeads implements Database.Batchable<SObject> , Database.Stateful {

    public Database.QueryLocator start (Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id,Status FROM Lead WHERE Status='Closed - Not Converted']);

    }
   
    public void execute(Database.BatchableContext bc,List<Lead> leadList){
        
        if(!leadList.isEmpty()){
            delete leadList; 
        }
    }
    public void finish(Database.BatchableContext bc){
    }
    
    
}