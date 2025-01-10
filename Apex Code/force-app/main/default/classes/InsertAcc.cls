public with sharing class InsertAcc {

        /*public static void insertAccount(){

            List <Account> accList = new List <Account>();

            Account acc1 = new Account(Name='',Active__c='');
        
            accList.add(acc1);



            Account acc2 = new Account();

            acc2.Name='';
            acc2.Active__c='';

            accList.add(acc2);

            insert accList;

        }*/

        
            public static void createAccountAndContact() {
                
                    // Create an Account without providing the required 'Name' field
                    Account acc = new Account();
                    acc.Industry = 'Technology';  // Only providing one non-required field
                    insert acc; // This will throw an exception because 'Name' is required
        
                    // Create a Contact without providing the required 'LastName' field
                    Contact con = new Contact();
                    con.Email = 'test@example.com';  // Only providing one non-required field
                    insert con; // This will throw an exception because 'LastName' is required
                try {
                } catch (DmlException e) {
                    // Handle the exception
                    System.debug('An error occurred while inserting the records: ' + e.getMessage());
                } catch (Exception e) {
                    // General exception handling (if needed)
                    System.debug('Unexpected error: ' + e.getMessage());
                }
            }
        }