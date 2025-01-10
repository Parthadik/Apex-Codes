public with sharing class AccountUtility {

    public static void viewAnnualRevenue(){

        List<Account> accountsList = new List<Account>();

        accountsList=[Select Name,AnnualRevenue From Account];

        for(Account acc : accountsList)
        {
            String acctRev=acc.Name+':'+acc.AnnualRevenue;
            
            system.debug(acctRev);
        }


    }


   
}