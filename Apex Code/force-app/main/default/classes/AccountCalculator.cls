//Assignment 3 Q3
public with sharing class AccountCalculator {
    @future
    public static void countsContacts(List<Id> accId){

        List<Account> accList = [SELECT Id,(SELECT Id FROM Contacts) FROM Account WHERE Id IN: accId];

        for(Account acc : accList){

            acc.Number_Of_Contacts__c = acc.Contacts.size();
        }
        if(!accList.isEmpty()){
        update accList;
    }
}
}