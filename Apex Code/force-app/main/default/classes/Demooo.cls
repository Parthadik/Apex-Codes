public with sharing class Demooo {
    public static void demo(){

List<Account> accList=[SELECT Id,Industry,Rating
                       FROM Account
                       WHERE Rating='Hot'];
List<Account> newAccList = new List<Account>();

for(Account acc : accList){
    
    acc.Industry ='Agriculture';
    newAccList.add(acc);
        
}

if(!newAccList.isEmpty()){
    
    update newAccList;
}
    }
}