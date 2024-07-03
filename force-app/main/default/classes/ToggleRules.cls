public class ToggleRules {
    
     public static List<String> turnOffValidationRules() {
         List<String> ruleNames = new List<String>();
         
         List<ApexTrigger> ap = [Select Id, Name, IsValid,Status from ApexTrigger where Status= 'Active'];
         for(ApexTrigger a: ap){
             if(a.Status  == 'Active'){
                 a.status = 'InActive';
             }
             //update a;
         }
         
         return ruleNames;
     }
        
}