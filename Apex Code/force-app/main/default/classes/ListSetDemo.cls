public with sharing class ListSetDemo {

    public static void demoSObjectWithSet(){

        Set<Id> accIds = new Set<Id>();
        
        List<Account> accList = new List<Account>();

        accList=[SELECT Id,Name FROM Account LIMIT 5];

        for(Account acc : accList){

            accIds.add(acc.Id);
        }

        System.debug('Id ='+accIds);

    }
    
}