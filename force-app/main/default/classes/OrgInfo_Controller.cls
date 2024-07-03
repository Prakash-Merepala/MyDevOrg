/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-01-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class OrgInfo_Controller {
    
    @AuraEnabled(cacheable = true)
    public static List<User_Info__c> getActiveUsers() {
        List<User> users = new List<User>();
        users = [Select Id from User where IsActive = true];
        decimal size = users.size();
        system.debug('Count::::' +size);
        
        integer count = Integer.valueOf(size);
        User_Info__c usersInfo = new User_Info__c();
        usersInfo = [Select Id,Active_Users__c  from User_Info__c where Name = 'Org Info Record'];
        usersInfo.Active_Users__c = count;
        update usersInfo;

        List<User_Info__c> userList = new List<User_Info__c>();
        userList = [Select Id, Name, Active_Users__c from User_Info__c where Name = 'Org Info Record'];
        
        return userList;
    }
}