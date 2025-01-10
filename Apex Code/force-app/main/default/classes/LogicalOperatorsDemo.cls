public with sharing class LogicalOperatorsDemo {




    public static void leapYear(Integer y  ){


        if(Math.mod(y, 4)==0 && Math.mod(y,100)!=0 && Math.mod(y, 400)==0)
        {
            System.debug('Leap Year');
        }

        else{
            System.debug('Not Leap Year');
        }

    }




    public static void demoList(){

        List<Account> accList = new List<Account>();

        accList=[SELECT Id FROM Account LIMIT 5];

        if(!accList.isEmpty()){

            System.debug('AccList Contain='+accList);
        }
        else{
            System.debug('AccList is empty');
        }


    }



    public static void operatorsDemo( Integer num1,Integer num2){

        
        
        Integer result;
        result = num1 > num2 ? num1 : num2;
        System.debug('Maximum=='+result);

       // if(num1 > 100 || num2 > 20 )
        //{
           // System.debug('True');
        //}P
       // else {
         //   {
            //    System.debug('False');
          //  }
        //}
    }
    
}