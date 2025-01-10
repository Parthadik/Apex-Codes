public with sharing class LoopDemo {


    public static void sumOfRealNumbers(Integer n){

        Integer i,sum=0;

        for(i=1;i<=n;i++){

            sum= sum+i;

            
        }
        system.debug('real Numbers='+sum);




    }


    public static void showList(){

        List<Account> accList = new List<Account>();
        Set<Id> accIds = new Set<Id>();

        accList=[SELECT Id,Name From Account Limit 5];

        if(accList.size()>0){
            
            for(Account acc : accList){

          //  System.debug(acc.Id + '-'+ acc.Name);
            accIds.add(acc.Id);
            //System.debug(accIds);

            

            //Display Id Through Set
            if(!accIds.isEmpty()){
                for(Id accId : accIds){

                    system.debug(accId);
                }
            }

            }
        }
    }



    public static void whileLoopDemo(Integer n){


        Integer i=1;
        while(i<=10)
        {
            System.debug(n + '*' + i +'=' + i*n);
            i++;
        }
    }

    public static void demo(Integer n){

        for(Integer i = 1 ; i < = 10; i++ )
        { 
            System.debug('Table Is='+i*n);
        }
    }
    
}