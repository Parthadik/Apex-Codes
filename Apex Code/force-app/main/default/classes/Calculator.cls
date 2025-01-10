public with sharing class Calculator {
  
    public static void addition(){
        Integer var1=10,var2=30,sum;
        sum=var1+var2;
        System.debug('Addition::'+sum);
    }

    public static void subtraction(){
        Integer var1=50,var2=30,subtract;
        subtract=var1-var2;
        System.debug('Subtraction::'+subtract);
    }
    public static void multiplication(Integer var1,Integer var2){
        Integer multi;
        multi=var1*var2;
        System.debug('Multiplication is='+multi);
    }
    public static void division(Integer var1,Integer var2){
        Integer divid;
        divid=var1/var2;
        System.debug('Division is='+divid);
    }
}