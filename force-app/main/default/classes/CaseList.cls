public with sharing class CaseList {
@AuraEnabled
    public static list<Case> getRelatedList(Id recordId)
    {
        List<Case> Caselist = [Select Id,Status,SourceId from Case where Id=: recordId];
        return Caselist;
    }
}