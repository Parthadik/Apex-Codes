public with sharing class AddPrimaryContact implements Queueable {
    private Contact contactToInsert;
    private String stateAbbreviation;

    // Constructor accepting a Contact and a State abbreviation
    public AddPrimaryContact(Contact contact, String state) {
        this.contactToInsert = contact;
        this.stateAbbreviation = state;
    }

    // Execute method to process the Queueable job
    public void execute(QueueableContext context) {
        // Query for Accounts with the specified BillingState
        List<Account> accounts = [SELECT Id FROM Account WHERE BillingState = :stateAbbreviation LIMIT 200];

        List<Contact> contactsToInsert = new List<Contact>();

        // Clone the Contact for each Account and set the AccountId
        for (Account acc : accounts) {
            Contact clonedContact = contactToInsert.clone(); // Clone the Contact
            clonedContact.AccountId = acc.Id; // Associate with Account
            contactsToInsert.add(clonedContact);
        }

        // Insert all cloned Contacts
        if (!contactsToInsert.isEmpty()) {
            insert contactsToInsert;
        }
    }
}