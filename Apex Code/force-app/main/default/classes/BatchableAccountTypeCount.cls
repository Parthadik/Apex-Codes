//Assignment-4 Q5
public with sharing class BatchableAccountTypeCount implements Database.Batchable<sObject> , Database.stateful {  
    Integer Count=0;
    public Database.QueryLocator start (Database.BatchableContext bc){

        return Database.getQueryLocator([SELECT Id,Type FROM Account WHERE Type ='Installation Partner']);
    }

    public void execute(Database.BatchableContext bc,List<Account> accList){

                Count = count + accList.size();
                System.debug('Total Counted'+ Count);
            }
        
    public void finish(Database.BatchableContext bc){

        System.debug('Total Counted'+ Count);

       


    }
    
}