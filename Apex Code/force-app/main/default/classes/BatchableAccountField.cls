//Assignment-4 Q2
public with sharing class BatchableAccountField implements Database.Batchable<sObject> , Database.stateful {

    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id,Status__c,Industry FROM Account]);
    }

        List<Account> newAccList = new List<Account>();

        public void execute(Database.BatchableContext bc,List<Account> accList){

            for(Account acc : accList){

                if(acc.Industry =='Media'){
                    acc.Status__c = 'Active';
                    newAccList.add(acc);
                }


            }
            if(!newAccList.isEmpty()){
                update newAccList;
            }

        }
        public void finish(Database.BatchableContext bc){

            
            

        }
    }