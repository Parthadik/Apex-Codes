trigger acTrigger on Account (after update, after insert) {
    if( Trigger.isAfter && Trigger.isUpdate){

        acClass.matchValue(Trigger.new, Trigger.oldMap,Trigger.newMap);
        acClass.accmethod( Trigger.new,Trigger.oldMap);
    }
     if(Trigger.isAfter && Trigger.isInsert){
       // acClass.relatedContactCreate(Trigger.new);
    }
}