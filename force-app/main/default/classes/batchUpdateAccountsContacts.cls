global class batchUpdateAccountsContacts implements Database.Batchable <sObject>,Database.Stateful,Schedulable {   
    global batchUpdateAccountsContacts(){
    }
    Set<id> successRecord = new Set<id>();
    Set<id> failRecord = new Set<id>();
    global string log = ''; //Stateful variable to keep track of errors across batches
    
    global Database.QueryLocator start(Database.BatchableContext info){ 
        String SOQL='Select id,name,NumberOfEmployees, description,(select id, name from contacts) from Account';
        return Database.getQueryLocator(SOQL);
    }     
    global void execute(Database.BatchableContext info, List<Account> scope){
        List<Account> accsToUpdate = new List<Account>();
        
        for(Account a : scope)
        { 
            a.description ='This is the Tets 2';
            a.NumberOfEmployees = 10;
            accsToUpdate.add(a); 
        }       
        
        Database.SaveResult[] srList = Database.update(accsToUpdate, false);
        for(Integer i=0; i < srList.size(); i++) {
        if(srList.get(i).isSuccess()) {
            System.debug('Records are updated Successfully :' + srList.get(i).getId());
        } 
        else if(!srList.get(i).isSuccess()) {
            this.log += '\n Error in Account :' + scope[i].Name +'.Error msg=' + srList[i].getErrors()[0].getMessage();
            Database.Error errors =  srList.get(i).getErrors().get(0);
            System.debug('Error Occurs While Processing The Record'+errors.getMessage());
            System.debug('Failure Record Ids While Updating :' + errors);
            //failRecord.add(errors.getId());
        }
    }
        
        
      /*  for (Database.SaveResult sr : srList){
            if(sr.isSuccess()){
                system.debug('This record is success:' + sr.getId());
            }
            else{
                //List<Database.Error> err = new List<Database.Error>();
                for(Database.Error err : sr.getErrors()){
                    system.debug('ID for the Failed Record :' + srList.get(i).getErrors().get(0););
                    system.debug('Error Record :' + sr.getErrors());
                    system.debug('Failed Message :' + err.getMessage());
                }
            }
        } */
        
    }
global void finish(Database.BatchableContext info){ 
    // Get the ID of the AsyncApexJob representing this batch job
    // from Database.BatchableContext.
    // Query the AsyncApexJob object to retrieve the current job's information.
    AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
                      TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id = :info.getJobId()];
    
    // Send an email to the Apex job's submitter notifying of job completion.
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    
    String[] toAddresses = new String[] {a.CreatedBy.Email};
        mail.setToAddresses(toAddresses);
    mail.setSubject('Account and contact update' + a.Status);
    mail.setPlainTextBody
        
        ('The batch Apex job processed ' + a.TotalJobItems +
         ' batches with '+ a.NumberOfErrors + ' failures.'+successRecord+'successRecordids: '+ 'failRecordids: '+ failRecord);
    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
} 


global void execute(SchedulableContext SC){
    database.executeBatch(new batchUpdateAccountsContacts(),100);
    //for cron expression
    // String cronexpression = ‘0 0 0 ? * * *’
    // System.schedule(‘Testing’, cronexpression, testobj);        
}
}