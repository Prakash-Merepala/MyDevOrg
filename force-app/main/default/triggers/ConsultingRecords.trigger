trigger ConsultingRecords on Consulting_Service__c (before insert, before update) {
	List<Consulting_Service__c> ser = new List<Consulting_Service__c>();
    for(Consulting_Service__c consulting : Trigger.New) {
        //System.debug(consulting);
        if(	consulting.Projected_Project_Start__c == '24+ Months')
        {
            consulting.Rating__c = 'Expired';
            //ser.add(new Consulting_Service__c(ID= consulting.Id,Rating__c = 'Expired'));
            //ser.add(consulting);	
        }
        
	        //services.add(consulting);	
    }
}