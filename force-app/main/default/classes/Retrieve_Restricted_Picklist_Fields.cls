public class Retrieve_Restricted_Picklist_Fields {
    
    public static List<String> getRestrcitedFields(){
        
        List<sObject> obj = new List<sObject>();
        List<String> objList = new List<String>();
        objlist.add('Account');
        objList.add('Contact');
        System.debug('The list of objects are>>' +objList);
        
        List<String> restrictedPicklistFields = new List<String>();
        String query = 'Account';
        Map<String, Schema.SObjectField> fieldMap = Schema.SObjectType.Account.fields.getMap();
        for(Schema.SObjectField field : fieldMap.values()){
            Schema.DescribeFieldResult fieldResult = field.getDescribe();
            if(fieldResult.isRestrictedPicklist()){
                restrictedPicklistFields.add(fieldResult.getName());
            }
        }
        System.debug('Restricted picklist fields on Account object: ' + restrictedPicklistFields);
        
        
        //Account acc = [Select Id, Test_Picklist__c from Account];
        Schema.DescribeFieldResult fieldResult = Account.Test_Picklist__c.getDescribe();
        Boolean isRestricted = fieldResult.isRestrictedPicklist();
        system.debug('Value is>>' +isRestricted);
        
        
        
        
        return objList;   
    }
    
}