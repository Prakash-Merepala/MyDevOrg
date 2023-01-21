public class RefreshEmailNotification implements Database.Batchable<sObject> {
    
    public database.QueryLocator Start(Database.BatchableContext BC)
    {
        //for(Questionnaire__c updateNotificatios : [Select ID, Name, Refresh_Due_Date__c, Status__c, Next_Notification_Date__c from Questionnaire__c
        //                                          Where Refresh_Due_Date__c > TODAY() AND Refresh_Due_Date__c <> NULL ])
        
        return Database.getQueryLocator([Select ID, Name, Refresh_Due_Date__c, Status__c, Next_Notification_Date__c 
                                         From Questionnaire__c
                                         ]);
    }
    public void execute(Database.BatchableContext BC, List<Questionnaire__c> scope)
    {
        system.debug('list of questionnaires:' +scope);
        
        //update the next notificatio date 
        for (Questionnaire__c que : scope)
        {
            if(que.Refresh_Due_Date__c != NULL){
                
                RefreshEmailNotificationBatchHelper.daysOutFifteen(scope);
            }
        }
        update(scope);
        /*for (Database.SaveResult sr : scope){
            if(sr.isSuccess()){
                system.debug('list of updated records:'+sr.getId());
            }
        } */
    }
    public void finish(Database.BatchableContext BC){
        
    }
    
}