public class showErrorController {
    
    public Account acc{get;set;}
    
    public showErrorController(ApexPages.StandardController controller){
        acc = (Account)Controller.getRecord();
    }
    
    public Pagereference saveAccount(){
        
        try
        {
            upsert acc;
            return new Pagereference('/' + acc.Id);
        }
        catch(DMLException de)
        {
            Apexpages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.FATAL, de.getDmlMessage(0)));
            return NULL;
        }
        catch(Exception e) 
        {
            Apexpages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.FATAL, e.getMessage()));
            return NULL;
        }
    }
}