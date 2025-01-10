public with sharing class DmlDemo {
    
    public static void insertDemo(){

        List<Account> accList = new List<Account>();
        //List<Contact> conList = new List<Contact>();


        /*for(Integer i=0; i<=200; i++){
        Account acc = new Account();
        acc.Name='Test Records 1'+i;
        acc.Active__c='Yes';

        accList.add(acc);
        //accList.add(acc);
        }
        insert accList;*/

        accList=[SELECT Id,Name From Account
                ORDER By LastModifiedDate DESC LIMIT 200];

                delete accList;
    }
}

        /*Account acc1 = new Account();
        acc1.Name='ABC6';
        acc1.Active__c='Yes';
        accList.add(acc1);


        

        insert accList;

        System.debug(accList.get(0));
        System.debug(accList.get(1));

        Contact con = new Contact();
        con.FirstName=acc.Name;
        con.LastName=acc.Name;
        con.AccountId=accList[0].Id;
        conList.add(con);


        Contact con1 = new Contact();
        con1.FirstName=acc1.Name;
        con1.LastName=acc1.Name;
        con.AccountId=accList[1].Id;
        conList.add(con1);

       
        insert conList;

      
    }*/