public with sharing class AccountTriggerHandler {

    //Assignment 1 Question 1

    public static void billingAddressCopy(List<Account> accList){

        for(Account acc : accList){

            
            acc.ShippingCity = acc.BillingCity;
            acc.ShippingCountry = acc.BillingCountry;
            acc.ShippingStreet = acc.BillingStreet;
            acc.ShippingPostalCode = acc.BillingPostalCode;

            acc.Industry ='Engineering';
        }
    }

    //Assignment 1 Question 2

    public static void changeIndustry(List<Account> accList , Map<Id , Account> accOldMap){

        

        for(Account acc : accList){

            accOldMap.get(acc.Id);

            if(accOldMap != null && accOldMap.get(acc.Id).Industry =='Engineering' && acc.Industry == 'Finance'){

                acc.Active__c ='Yes';

            }
        }


    }

   // Assignment 1 Question  3


  /* public static void preventDeletion(List<Account> accList){
    //Account ad;
         set<id> sid = new set<id>();
       for( Account acc: accList){
           sid.add( acc.id);
      }
          List<Opportunity> oppList=[ select id from Opportunity where AccountId IN: sid];
    

                for( Account acc:accList){
                    if (!oppList.isEmpty() || acc.Status__c=='Active') {
                        acc.addError(' beforce delete please cheak is ther any oppournity related or any  accoutn is active');

                
             }
        }


    }*/

    //Assignment 1 Question 3
    public static void preventDeletion(List<Account> accList){


        List<Opportunity> oppList = [SELECT Id,AccountId FROM Opportunity];


        for(Account acc : accList){

            for(Opportunity opp : oppList ){

            if( acc.Status__c =='Active'  || opp.AccountId == acc.Id){

                 acc.addError('You can not delete an active account');
            }
        }
    }
        
        
}


   //Assignment 5 Question 4
public static void annualRevenue(List<Account> accList){

    List<Task> taskList= new List<Task>();

    for(Account acc : accList){

        if(acc.AnnualRevenue >= 50000){

            Task t1 = new Task();

            t1.Status='In Progress';
            t1.Subject='Other';
            t1.OwnerId=acc.OwnerId;
            t1.WhatId=acc.Id;
            t1.ActivityDate=Date.today();
            t1.Priority='High';
            t1.ActivityDate= System.today()+5;

            taskList.add(t1);
        }
    }

    insert taskList;
}
    //Assignment 5 Question 5
    public static void updateAccRelatedPhone(List<Account> accList, Map<Id, Account> accOldMap) {  
        Map<Id, Contact> contactMap = new Map<Id, Contact>([SELECT AccountId, OtherPhone, HomePhone FROM Contact WHERE AccountId IN :accList]); 

        List<Contact> newConList = new List<Contact>();
    
            for (Account acc : accList) {  

                if (accOldMap != null && acc.Phone != null && accOldMap.get(acc.Id).Phone != acc.Phone) { 

                Contact relatedContact = contactMap.get(acc.Id); 

                    if(relatedContact != null) { 
                        relatedContact.OtherPhone = accOldMap.get(acc.Id).Phone; 
                        relatedContact.HomePhone = acc.Phone; 
                        newConList.add(relatedContact); 
    } 
       } 
            } 
        if (!newConList.isEmpty()) { 
            update newConList; 
        } 
    } 

     //Assignment 5 Question 6
    public static void emailSend(List<Account> accList){

        for (Account acc : accList) {
           
            String recipientEmail = acc.Email__c; 
            
            if (recipientEmail != null) {
                // Construct email body
                String emailBody = 'The following account has been deleted:\n\n' +
                                   'Account Name: ' + acc.Name + '\n' +
                                   'Account ID: ' + acc.Id;
    
            
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(new String[] { recipientEmail });
                mail.setSubject('Account Deletion Notification');
                mail.setPlainTextBody(emailBody);
    
             
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            }
        }
    }

    
}