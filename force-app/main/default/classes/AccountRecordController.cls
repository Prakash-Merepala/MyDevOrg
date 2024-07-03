/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-17-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccountRecordController {
    
    @AuraEnabled (cacheable=true)
    public static List<UserLicense> displayAccounts(){

            return[Select Id, name,TotalLicenses, UsedLicenses, UsedLicensesLastUpdated from UserLicense WITH SECURITY_ENFORCED ];
    }
    @AuraEnabled (cacheable=true)
    public static List<User> getActiveUsers(){
        try {
            Integer count = 0;
        List<User> userList = new List<User>();
        userList = [Select Id, IsActive from User where IsActive = true WITH SECURITY_ENFORCED] ;
        count = userList.size();
        return userList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
  
}