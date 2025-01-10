public with sharing class DatabaseClassDemo {

    /*public static void databaseDemo(){


        List<Account> accList = new List<Account>();{

        new Account(Name='PARTH'),
        new Account(Name='ADITYAA'),
        new Account(Name='VISHAL'),
        new Account(Name='VIKRANT'),

        new Account()};

        Database.SaveResult[] srList = Database.insert(accList ,false);

        for(Database.SaveResult sr : srList){

            if(sr.isSuccess()){

                System.debug('Succesfully Inserted Accounts. Account Id'+sr.getId());
            } else{

                for(Database.Error err : sr.getError()){

                    System.debug('The Following Error Has Occured');
                    System.debug(err.getStatusCode()+': ' +errGetMessage());
                    System.debug('Account Field are Affected With This Error'+err);


                }
            }
        }


    }*/


   
        public static void databaseDemo() {
            List<Account> accList = new List<Account>{
                new Account(Name = 'PARTH'),
                new Account(Name = 'ADITYAA'),
                new Account(Name = 'VISHAL'),
                new Account()
            };
    
            Database.SaveResult[] srList = Database.insert(accList, false);
    
            for (Database.SaveResult sr : srList) {
                if (sr.isSuccess()) {
                    System.debug('Successfully Inserted Account. Account Id: ' + sr.getId());
                } else {
                    for (Database.Error err : sr.getErrors()) {
                        System.debug('The Following Error Has Occurred');
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        System.debug('Account Fields Affected By This Error: ' + err.getFields());
                    }
                }
            }
        }
    }