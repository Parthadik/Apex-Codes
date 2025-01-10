public with sharing class acClass {
  public static void accmethod( List<Account> accList,map<id,Account> oldmap){
      List<Contact> conList = new List<Contact>();
      set<id> sid = new set<id>();
      for( Account acc: accList){
         Account oldac= oldmap.get( acc.id);
         if( acc.Phone != oldac.Phone){
            sid.add( acc.id);
         }
      }
       List<Contact> conl=[ select id,AccountId,Phone from Contact where AccountId IN: sid];
       if( !conl.isEmpty()){
          for( Contact con: conl){
             Account oldac = oldmap.get( con.AccountId);
             con.Phone = oldac.Phone;
             conList.add(con);
          }
       }
        if( !conList.isEmpty()){
            update conList;
        }
  }

  public static void relatedContactCreate(List<Account> accList){

   List<Contact> conList = new List<Contact>();

   for(Account acc : accList){

      Contact con = new Contact();
      con.LastName='Anna kale Karan';
      con.AccountId = acc.id;
      conList.add(con);
   }

   if(!conList.isEmpty()){

      insert conList;
   }
  }

  //Update Account Related contact Field Same as Account field
  public static void matchValue(List<Account> accList, Map<Id,Account > oldMap, Map<Id, Account> newMap){

   List<Contact> conList = new List<Contact>();
   Set<Id> sid = new Set<Id>();
   
        for(Account acc : accList){

           Account oldVal =oldMap.get( acc.Id);    

         if(acc.Industry != oldVal.Industry){
             Sid.add(acc.id);
         }
        }
        List<Contact> conL=[SELECT Id, Industry__c,AccountId FROM Contact WHERE AccountId IN:sid];

        if(!conL.isEmpty()){

         for(Contact con:ConL){

          Account newVal = newMap.get( con.AccountId);
         con.Industry__c = newVal.Industry;
         conList.add(con);
         }
         if(!conList.isEmpty()){

            update conList;
         }
        }
      }
      }