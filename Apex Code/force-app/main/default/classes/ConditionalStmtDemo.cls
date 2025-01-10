public with sharing class ConditionalStmtDemo {


    public static void demo(Integer num1,Integer num2){

        

        if(num1>num2){

            System.debug('num1 is greater than num2');
        }

        else {
            
            System.debug('num2 is greater than num1');
        }
    }

    public static void checkEligibility(Integer age){

        if(age >= 18){

            System.debug('Eligible for vote');
        }
        else {
            
            System.debug('Not eligible for vote');
        }


    }
    public static void checkEvenOdd(Integer num)
    {

        if(Math.mod(num,2)==0)
        {

            System.debug('Number is Even');
        }

        else{

            System.debug('Number is Odd');

        }
    }

    public static void nestedIfDemo(Integer num){

        if(num >= 0){
            if(num>0)
            {
                system.debug('Number Is Positive');
            }
            else{
                system.debug('Number Is Zero');
            }
        }
            else
            {
                system.debug('Number Is Negative');
            }

        


    }


    public static void elseifLadderDemo(Integer num){

        if(num > 0){
            system.debug('Number Is Positive');
        }
        else if(num == 0){
            system.debug('Number Is Zero');
        }
        else{
            system.debug('Number Is Negative');
        }
    }
    
}