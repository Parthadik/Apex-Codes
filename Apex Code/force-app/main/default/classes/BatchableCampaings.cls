//Assignment-4 Q3
public with sharing class BatchableCampaings implements Database.Batchable<sObject>  {

    public Database.QueryLocator start (Database.BatchableContext bc){
       return Database.getQueryLocator([ select id,Status from Campaign where Status!='Completed']);
    }

      //  List<Campaign> newCamList = new List<Campaign>();

        public void execute(Database.BatchableContext bc, List<Campaign> campList){
            List<Campaign> newCamList = new List<Campaign>();
            for(Campaign cam : campList){
                cam.Status= 'Completed';

                newCamList.add(cam); 
            }

            if(!newCamList.isEmpty()){

                update newCamList;

        }
    }
    public void finish(Database.BatchableContext bc){

        BatchableAccountField secondBatchInstance = new BatchableAccountField();
            Database.executeBatch(secondBatchInstance, 200);
    }
}