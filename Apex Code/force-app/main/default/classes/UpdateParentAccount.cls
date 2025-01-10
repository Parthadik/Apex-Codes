public with sharing class UpdateParentAccount implements Queueable {

    //variables
    private List<Account> accList;
    private Id parentAccId;


    //constructor

    public UpdateParentAccount(List<Account> accRecords , Id accId){

        this.accList = accRecords;
        this.parentAccId = accId;
    }

    //method

    public void execute(QueueableContext context){
        for(Account acc : accList){
        acc.ParentId = parentAccId;

    }
    
    update accList;


    }
}