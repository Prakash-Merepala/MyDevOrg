public class TestOpp {
    List<Opportunity> OppRec=[select Name,StageName,Amount,ExpectedRevenue,CloseDate from Opportunity];
    
    public List<Opportunity> getOppRec() {
    return OppRec;
    }
     List<Family__c> FamRec=[select Name__c,Age__c,  Monthly_Income__c, Relation__c from Family__c];
       
       public List<Family__c> getFamRec() {
       return FamRec;
       }
 }