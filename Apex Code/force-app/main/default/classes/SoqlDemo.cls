/*public with sharing class SoqlDemo {

public static void getData(){

    List<Account> accList = [SELECT Id, Name, Industry
                                FROM Account
                                WHERE Active__c='Yes'];

    for(Account acc :accList)
    {
        System.debug(acc);
    }

}

}*/

public with sharing class SoqlDemo {
    
    /*public static void getDemo(){
        Integer Paisaaa=100000000;

    Set<Id> accIds = new Set <Id>();

    List<Account> accList = [SELECT Id
                            FROM Account
                            LIMIT 5];

        for(Account acc :accList)
            {
            accIds.add(acc.Id);
        }

        List<Account> accList1=[SELECT Id,Name,Industry,AnnualRevenue
                                FROM Account 
                                WHERE Id IN: accIds];

                                for(Account acc1:accList1)
                                {
                                    System.debug(acc1);
                                }
                                    
}

*/

public static void demo(){


    AggregateResult[] groupedResults=[SELECT Account.Name, Sum(Amount) 
                                      FROM Opportunity 
                                      Group by Account.Name];

    System.debug(groupedResults);

    for(AggregateResult ar: groupedResults)
    {
        System.debug('Account ID'+ ar.get('Name'));
        System.debug('Sum Of Account'+ ar.get('expr0'));
    }
}

public static void demo11(){

    for(Account acc:[SELECT Id,Name From Account WHERE Rating='Hot']){
        System.debug(acc);
    }
}
}