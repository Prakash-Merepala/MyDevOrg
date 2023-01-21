global class RollupEmail implements Database.Batchable<sObject>,Database.Stateful
{
    global Database.QueryLocator start (Database.BatchableContext BC)
    {
        string query = 'SELECT ID,Email__c from Batch_Apex__c';
        return Database.getQueryLocator(query);
   	}
    global void execute (Database.BatchableContext BC, List<Account> scope)
    {
 		
        
    }
    
    global void finish(Database.BatchableContext BC) 
    {
        
    }
  
}