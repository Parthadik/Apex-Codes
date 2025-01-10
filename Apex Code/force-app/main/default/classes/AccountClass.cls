public with sharing class AccountClass {
    public static void accountmethod(List<Account> accList){
      for( Account acc: accList) {

           if( acc.Active__c =='Yes'&& acc.Industry!= NUll){
               acc.AccountNumber='23223';

           }
      }

    }

    public static void updateIndustry(List<Account> accList,Map<Id , Account> oldAccMap){

      for(Account acc : accList){

          System.debug('Value From Math'+oldAccMap.get(acc.Id));

          if(oldAccMap != null && acc.Industry != oldAccMap.get(acc.Id).Industry
          && acc.isAvailable__c == true){

              acc.AccountNumber = '2230';
          }else{
              acc.AccountNumber = '1234';
          }
      }
  }

  public static void accRelatedCon(List<Account> accList){

      List<Contact> conList = new List<Contact>();

      for(Account acc : accList){
          Contact con = new Contact();

          con.AccountId = acc.Id;
          con.LastName = acc.Name;
          conList.add(con);
      }
      if(!conList.isEmpty()){
          insert conList;
      }
  }

  public static void updateAccountNumberField(List<Account> accList){

      for(Account acc : accList){

          if(acc.Active__c == 'Yes'  && acc.Industry != null){

              acc.AccountNumber='9307667102';
          }
      }
  }

  public static void updatePhone(List<Account> accList, Map<Id,Account> accOldMap){

      for(Account acc : accList){

          if(acc.Phone != accOldMap.get(acc.Id).Phone){

              acc.Description='Phone Is Updated  | Old Value = '+accOldMap.get(acc.Id).Phone+'  New Value is= '+acc.Phone;
          }
      }
  }

  public static void oppRelated(List<Account> accList){

      List<Opportunity> oppList = new List<Opportunity>();

      for(Account acc : accList){

          Opportunity opp = new Opportunity();

          opp.Name = acc.Name;
          opp.StageName='Prospecting';
          opp.CloseDate=System.today();
          opp.AccountId = acc.Id;

          oppList.add(opp);
      }

      if(!oppList.isEmpty()){

          insert oppList;
      }
  }

  
  public static void ratingChange(List<Account> accList){

      for(Account acc : accList){

          if(acc.Industry != NULL && acc.Industry =='Media'){

              acc.Rating='Hot';
          }
      }
  }

  public static void updateAccRelatedPhone(List<Account> accList , Map<Id , Account> accOldMap){

   set<Id> sid = new Set<Id>();
    List<Contact> conList1 = new List<Contact>();

    for(Account acc : accList){
        Account cac =accOldMap.get(acc.Id);
        if(cac.Phone != cac.Phone && acc.Rating =='Hot'){
            sid.add(acc.id); 
        }  
    }
    List<Contact> newConList=[SELECt Id,Name, AccountId From Contact WHERE AccountId IN :sid];
    for(Contact con : newConList){
        Contact conObj = new Contact();
        Account cac =accOldMap.get(conObj.AccountId);

            conObj.Phone = cac.Phone;
            conList1.add(conObj);
    }
    update conList1;
  }
}