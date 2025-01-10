public with sharing class SoqlParentChild {

    public static void parentChild(){

    

    List<Account> accList = new List<Account>();
    
    accList=[SELECT Id,Name,(SELECT Id,FirstName,Lastname FROM Contacts)FROM Account WHERE Rating='Hot'];



    for(Account acc : accList){

        (System.debug('Account Name'+acc.Name));

           for(Contact con : acc.Contacts){

               System.debug(con.FirstName +' '+con.LastName);
    }
    }
    }
}