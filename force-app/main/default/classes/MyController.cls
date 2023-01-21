public with sharing class MyController {
    @AuraEnabled
    public static string serverEcho (String firstName)
    {
        return('Hello! I am The Server:'+firstname);
    }
}