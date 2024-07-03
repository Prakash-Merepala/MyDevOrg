public class Automation_Invocable_Apex {
    
    @InvocableMethod(label='Get Flags for Rules' description='Set flags for rules') 
    public static List<List<Response>> getFlags(List<Request> reuestsList){
        Automation_Rules_Switch__mdt metaRec = new Automation_Rules_Switch__mdt();
        
        if(reuestsList[0].valFlag = true){
            List<Automation_Rules_Switch__mdt> listFlags = new List<Automation_Rules_Switch__mdt>();
            Automation_Rules_Switch__mdt flag = new Automation_Rules_Switch__mdt();
            flag = [Select Id,MasterLabel, Active__c  from Automation_Rules_Switch__mdt WITH SECURITY_ENFORCED];
            listFlags.add(flag);
            
        } else if(reuestsList[0].workflowFlag = true){
            List<Automation_Rules_Switch__mdt> listFlags = new List<Automation_Rules_Switch__mdt>();
            Automation_Rules_Switch__mdt flag = new Automation_Rules_Switch__mdt();
            flag = [Select Id,MasterLabel, Active__c  from Automation_Rules_Switch__mdt WITH SECURITY_ENFORCED];
            listFlags.add(flag);
        }
        List<List<Response>> outputResponse = new List<List<Response>>();
    	List<Response> responses = new List<Response>();
        return outputResponse;
    }
    
    public class Request {
        @InvocableVariable(required=true)
        public Boolean valFlag;
        @InvocableVariable(required=true)
        public Boolean workflowFlag;
    }
    
    public class Response {
        @InvocableVariable
        public Boolean valStatus;
        @InvocableVariable
        public Boolean workflwStauts;
    }
}