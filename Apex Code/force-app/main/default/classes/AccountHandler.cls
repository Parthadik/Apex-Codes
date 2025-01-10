public with sharing class AccountHandler {
    

    /*public static void insertNewAccount(Integer insertAccount){

        List<Account> addAccounts=new List<Account>();

        Integer n=1;

        while(n<= insertAccount){

            Account acc = new Account(Name = 'Acme Inc ' + n,AccountNumber = 'A000N' + n);

            addAccounts.add(acc);
            n++;
        }

        insert addAccounts;


    }*/

        public static Account insertNewAccount(String accountName) {
            // Check for empty account name
            if (accountName == null) {
                return null;
            }
            
            Account acc = new Account(Name = accountName);
            
            try {
                insert acc;
                //Return account if successful
                return acc;
            } catch (DmlException e) {
                //Catch DML exceptions and return null
                System.debug('A DML exception has occurred: ' + e.getMessage());
                return null;
            }
        }
    }