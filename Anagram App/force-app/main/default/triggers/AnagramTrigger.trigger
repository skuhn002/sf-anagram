trigger AnagramTrigger on anagram__Anagram__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            if(Trigger.new.size() == 1){
	            AnagramTriggerHandler.setSinglePuzzle(Trigger.new[0]);
            }
        }
        when BEFORE_UPDATE {
            if(Trigger.new.size() == 1){
	            AnagramTriggerHandler.setSinglePuzzle(Trigger.new[0]);
            }
        }
    }
}