public class candidateTriggerHandler {
    
    public void OnBeforeInsert(List<Candidate__c> candList){
        
        List<Candidate__c> candidatesList = new List<Candidate__c>();
        
        for(Candidate__c c : candidatesList){
            if(c.COVID_Positive__c = TRUE){
                c.Need_Isolation__c  = 'Yes';
                c.Need_Medication__c = 'Yes';
            }
        }
    }
    
    public  void OnBeforeUpdate(List<Candidate__c> candList){
        
        List<Candidate__c> candidateList = new List<Candidate__c>();
        
        for(Candidate__c cd : candidateList){
            if(cd.COVID_Positive__c = TRUE){
                cd.ORF1ab_Gene_CT_Value__c.addError('This value shouldnt be blank.');
            }
        }
    }
    public static void OnAfterInsert(List<Candidate__c> candidateList, Map<Id,Candidate__c> candMap){
        
        List<Candidate__c> newList = new List<Candidate__c>();
        List<Case> caseList = new List<Case>();
        
        Map<Id,Candidate__c> candWithCase = new Map<Id,Candidate__c>
            ([Select Id, Name, Case__c from Candidate__c where Id IN :newList]);
        
        for(Candidate__c c : newList){
            if(String.isBlank(c.Case__c)){
                caseList.add(new Case(Status = 'New',
                                      Origin = 'Phone',
                                      Subject  = c.Name + 'Case'));
            }
            
        }
        insert caseList;
    }
    
    public static void OnAfterUpdate(List<Contact> contactList){
        
        List<Contact> conList = new List<Contact>();
        
        for(Contact cont : conList){
            if(cont.Candidate__c <> Null){
                cont.Description = 'Updated';
            }
        }
    }
}