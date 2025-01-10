public with sharing class AccountInsert {
    public static ID insertAccount(String name , String rating , String active){
        Account acc = new Account();

        acc.Name=name;
        acc.Rating=rating;
        acc.Active__c=active;

        insert acc;

        return acc.Id;
    }

    public static void insertContact(){
        Id accId;
        accId=insertAccount('','','');
        Contact con = new Contact(Firstname='Parth',Lastname='Adik');
        con.accountId=accId;
        insert con;
    }
   


}