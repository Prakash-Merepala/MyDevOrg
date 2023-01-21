public class SearchFunction {
    public List<Family__c> records{get;set;}
    public string name {get;set;}
    public string age {get;set;}
    public string relation {get;set;}
    
    public SearchFunction() {
        records=new List<Family__c> ();
        
    }
    public pagereference searchrecords()
    {
        records = [select Name__c,Age__c,Relation__c from Family__c];
        return null;
        
    }
    

}