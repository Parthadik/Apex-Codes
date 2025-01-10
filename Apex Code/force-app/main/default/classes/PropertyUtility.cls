public with sharing class PropertyUtility {
   
        public static void newListedProperties() {
            // Create a list to hold query results
            List<Property__c> newPropList = [
                SELECT Name, Broker__r.Email__c, Days_On_Market__c
                FROM Property__c
                WHERE CreatedDate = LAST_N_DAYS:30
            ];
    
            // Iterate through the list and concatenate the required information
            for (Property__c prop : newPropList) {
                // Concatenate Property Name and Broker's Email
                String propEmail = prop.Name + ' : ' + prop.Broker__r.Email__c;
                
                // Print the concatenated string to the debug log
                System.debug(propEmail);
            }
        }
    }