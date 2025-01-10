public with sharing class ContactAndLeadSearch {

      
            /*public static List<List<sObject>> searchContactsAndLeads(String searchName) {
                List<List<sObject>> searchResults = [FIND :searchName IN Name Fields RETURNING Contact(Id, FirstName, LastName), Lead(Id, FirstName, LastName)];
                return searchResults;
            }
        }*/

    
            public static List<List<sObject>> searchContactsAndLeads(String searchName) {
                List<List<sObject>> searchResults = [FIND :searchName IN Name Fields RETURNING Contact(Id, FirstName, LastName), Lead(Id, FirstName, LastName)];
                return searchResults;
            }
        }