trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {

    List<Task> taskList = new List<Task>();

    for(Opportunity opp : Trigger.new){

    if(opp.StageName=='Closed Won'){

        Task t1 = new Task();

        t1.Subject ='Follow Up Test Task';
        t1.WhatId=opp.Id;

        taskList.add(t1);
       
    }
}
if(!taskList.isEmpty()){
insert taskList;

}

}