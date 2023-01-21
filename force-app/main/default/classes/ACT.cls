public class ACT{


       List<Family__c> rec=[select Name__c,Age__c,  Monthly_Income__c, Relation__c from Family__c];
       
       public List<Family__c> getrec() {
       return rec;
       }

}