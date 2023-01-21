public class CovidTriggerHandler {
    
    public static void PositiveCase(List<Candidate__c> candList){
        
        List<Candidate__c> candRecord = new List<Candidate__c>();
        
        for(Candidate__c cand : [Select ID, Name,SARS_CoV_2__c, COVID_Positive__c,ORF1ab_Gene_CT__c,N_Gene_CT__c 
                                 from Candidate__c
                                 where SARS_CoV_2__c = 'Detected' ])
        {
            cand.COVID_Positive__c = TRUE;
            cand.ORF1ab_Gene_CT__c = 'Detected';
            cand.N_Gene_CT__c = 'Detected';
            
            candRecord.add(cand);
        }
        update candRecord;
    }
}