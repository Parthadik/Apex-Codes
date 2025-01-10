public with sharing class DmlDemo1 {

    public static void dmlUpdate(){

        List<Account> acclist=[SELECT Id,Name,Industry
                               FROM Account];

        if(!accList.isEmpty()){

            for(Account acc : accList){

                acc.Industry='Media';
            }
            update accList;
        }
    }
    
}