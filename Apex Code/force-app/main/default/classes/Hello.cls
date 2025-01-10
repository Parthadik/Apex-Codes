public class Hello {
    
    public static void simpleDemo(){
        
        List<Account> accList =[SELECT Id,Name FROM Account LIMIT 10];
        
        for(Account acc:accList){
            system.debug(acc);
        }
    }
}