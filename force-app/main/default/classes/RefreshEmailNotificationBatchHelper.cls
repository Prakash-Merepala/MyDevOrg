public class RefreshEmailNotificationBatchHelper {
    
    List<Questionnaire__c>  queRecords = new List<Questionnaire__c> ();
    List<Questionnaire__c>  quessRecords = new List<Questionnaire__c> ();
    
    public static void daysOutThirty(List<Questionnaire__c>  queRecords) {
        
        queRecords=[SELECT Id,Refresh_Due_Date__c,Next_Notification_Date__c
                    FROM Questionnaire__c
                    WHERE Refresh_Due_Date__c<> NULL];
        for (Questionnaire__c que :  queRecords){
            if(que.Refresh_Due_Date__c != Null){
                que.Next_Notification_Date__c = que.Refresh_Due_Date__c - 30;
            }
            update queRecords;
        }
    }
    
    public static void daysOutFifteen(List<Questionnaire__c>  quessRecords) {
        quessRecords=[SELECT Id,Refresh_Due_Date__c,Next_Notification_Date__c
                      FROM Questionnaire__c
                      WHERE Refresh_Due_Date__c<> NULL];
        for (Questionnaire__c quess :  quessRecords){
            if(quess.Refresh_Due_Date__c != Null){
                quess.Next_Notification_Date__c = quess.Refresh_Due_Date__c - 15;
            }
            update quessRecords;
        }
    }
}