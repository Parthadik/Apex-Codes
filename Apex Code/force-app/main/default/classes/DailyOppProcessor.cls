public with sharing class DailyOppProcessor implements Schedulable {

    public void execute(SchedulableContext cxt){

        List<Opportunity> oppList =[SELECT Id , LeadSource FROM Opportunity WHERE LeadSource=null LIMIT 100];

        for(Opportunity opp : oppList){

            opp.LeadSource ='Web';
        }

        if(!oppList.isEmpty()){
            update oppList;
        }
    }
    
}