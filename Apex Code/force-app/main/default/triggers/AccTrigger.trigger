trigger AccTrigger on Account (before insert) {
        if( Trigger.isBefore && trigger.isInsert){
           // AccountClass.accountmethod(Trigger.new);

        }

}