public with sharing class ContactSearch {
    
    /*public static void searchForContacts(){


        List<Contact> conList =[SELECT Id, LastName 
                               FROM Contact 
                               WHERE LastName = :lastName AND MailingPostalCode = :postalCode];
        

                                return conList;
    }*/



        public static List<Contact> searchForContacts(String lastName, String postalCode) {
            // Query to find contacts with matching last name and mailing postal code
            List<Contact> contacts = [
                SELECT Id, Name 
                FROM Contact 
                WHERE LastName = :lastName AND MailingPostalCode = :postalCode
            ];
            
            // Return the list of matching contacts
            return contacts;
        }
    }