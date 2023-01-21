trigger CandidateTrigger on Candidate__c(after update){
    
    Set<Id> companyId = new Set<Id>();
    for(Candidate__c candidate : Trigger.new){
        if(candidate.Age__c > 65 && candidate.Name != null){
            companyId.add(candidate.Comapny__c);
        }
    }
    List<Comapny__c> cmpList = new List<Comapny__c>();
    cmpList = [Select Id, 	Triggered__c from Comapny__c where Id IN : companyId];
    for(Comapny__c comp : cmpList){
        comp.Triggered__c = true;
    }
    update cmpList;
}