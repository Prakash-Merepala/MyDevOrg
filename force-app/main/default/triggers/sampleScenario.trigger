/**
 * @description       : 
 * @author            : Jaya Prakash Merepala
 * @group             : 
 * @last modified on  : 03-01-2024
 * @last modified by  : Jaya Prakash Merepala
**/

//Trigger Class
trigger AccountHistoryTrigger on Account (before update) {
    AccountHistoryTriggerHandler.handleAccountHistory(Trigger.new, Trigger.oldMap);
}


