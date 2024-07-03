/**
 * @description       : 
 * @author            : Jaya Prakash Merepala
 * @group             : 
 * @last modified on  : 03-01-2024
 * @last modified by  : Jaya Prakash Merepala
**/
public with sharing class AccountHistoryTriggerHandler {
    
    public static void handleAccountHistory(List<Account> newAccounts, Map<Id, Account> oldAccountMap) {
        List<AccountHistory__c> accountHistories = new List<AccountHistory__c>();
        
        for (Account newAccount : newAccounts) {
            Account oldAccount = oldAccountMap.get(newAccount.Id);
            
            if (newAccount.Track__c != oldAccount.Track__c) {
                AccountHistory__c accountHistory = new AccountHistory__c(
                    Account__c = newAccount.Id,
                    Field__c = 'Track__c',
                    OldValue__c = oldAccount.Track__c,
                    NewValue__c = newAccount.Track__c,
                    Timestamp__c = Datetime.now()
                );
                accountHistories.add(accountHistory);
            }
        }
        
        // Insert historical account histories in bulk
        if (!accountHistories.isEmpty()) {
            Database.SaveResult[] saveResults = Database.insert(accountHistories, false);
            
            // Loop over the saveResults list to find any errors
            for (Database.SaveResult saveResult : saveResults) {
                if (!saveResult.isSuccess()) {
                    for (Database.Error error : saveResult.getErrors()) {
                        // Logging the error message as needed
                    }
                }
            }
        }
    }
}
