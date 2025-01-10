public with sharing class ApexScenario {
    

    public static void apexScenario1(){


        List<Account> accList = new List<Account>();

        accList=[SELECT Id,Name,(SELECT Id,LastName FROM Contacts) FROM Account
                WHERE Phone !=null];
                
                if(!accList.isEmpty()){

                for(Account acc : accList){

                    System.debug(acc.Name +' has   ' + acc.Contacts.size()+'  Related Contacts');


            }

         } 

            
    }

    public static void apexScenario2(){

        Decimal total=0;

        List<Account> accList = new List<Account>();

        accList=[SELECT Id,Name,(SELECT Id,Amount FROM Opportunities)FROM Account WHERE Phone !=null];

        if(!accList.isEmpty()){
            for(Account acc : accList){
                for(Opportunity opp : acc.Opportunities){
                    if(opp.Amount != null){
                        total = total + opp.amount;
                    }
                }
                System.debug(acc.Name+' has  '+ total +'  Worth Of Opportunity  ');

                
            }
        }


    }



    public static void apexScenario3(){

        List<Opportunity> oppList= new List<Opportunity>();

        oppList=[SELECT Id,StageName
                 FROM Opportunity
                 WHERE CreatedDate=THIS_YEAR];

          if(!oppList.isEmpty()){

            for(Opportunity opp : oppList){

                if(opp.StageName=='Closed Won'){
                    opp.Description='Opportunity Is Closed Won';

                }else if(opp.StageName=='Closed Lost'){
                    opp.Description='Opportunity Is Closed Lost';
                }
                else{
                    opp.Description='Opportunity Is Open';
                }
            }
          }
          update oppList;
    }


    public static void apexScenario4(){

        List<Account> accList = new List<Account>();

        accList=[SELECT Id,Number_Of_Contacts__c,(SELECT Id FROM Contacts)FROM Account WHERE CreatedDate=THIS_YEAR];

        if(!accList.isEmpty()){

            for(Account acc: accList){

                acc.Number_Of_Contacts__c = acc.Contacts.size();
            }
        }

        update accList;
    }
    

    public static void apexScenario5(){

        List<Contact> conList = new List<Contact>();

        conList=[SELECT ID,MobilePhone,Account.Phone FROM Contact WHERE CreatedDate=THIS_YEAR];

        if(!conList.isEmpty()){

            for(Contact con : conList){

                if(Contact.MobilePhone==Null || con.Account.Phone != Null){

                    con.MobilePhone = con.Account.Phone;
                }
            }

            update conList;
        }
    }
}