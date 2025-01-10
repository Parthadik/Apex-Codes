public with sharing class AuthorTriggerHandler {
     public static void updateDescription(List<Author__c> authList){

        for(Author__c auth : authList){     
            auth.Description__c = UserInfo.getName();

            Author__c au = auth;
        }
       
    }

    public static void preventDeletion(List<Author__c> authList) {
         for(Author__c auth : authList) {
             auth.addError('You cannot delete Author records.'); }
}
}