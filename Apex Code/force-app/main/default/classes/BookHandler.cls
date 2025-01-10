public with sharing class BookHandler {

    
        public static void databaseDemo() {
            
            List<Book__c> bookList = new List<Book__c>{
                new Book__c(Name = 'PARTH', Author_Name__c = 'Author 5'),
                new Book__c(Name = 'ADITYAA', Author_Name__c = 'Author 6'),
                new Book__c(Name = 'VISHAL', Author_Name__c = 'Author 7'),
                new Book__c(Name = 'VIKRANT') // Assuming Author__c is a required field, this will fail
            };
    
           
            Database.SaveResult[] srList = Database.Update(bookList, false);
    
            
            for (Database.SaveResult sr : srList) {
                if (sr.isSuccess()) {
                    System.debug('Successfully Inserted Book. Book Id: ' + sr.getId());
                } else {
                    for (Database.Error err : sr.getErrors()) {
                        System.debug('The Following Error Has Occurred');
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        System.debug('Book Fields Affected By This Error: ' + err.getFields());
                    }
                }
            }
        }
    }