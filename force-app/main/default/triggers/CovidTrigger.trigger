trigger CovidTrigger on Candidate__c (before update) {
    
    for(Candidate__c cand : Trigger.New){
        if(cand.SARS_CoV_2__c == 'Detected'){
            cand.COVID_Positive__c = TRUE;
            cand.ORF1ab_Gene_CT__c = 'Detected';
            cand.N_Gene_CT__c = 'Detected';
        }
    }
    
}