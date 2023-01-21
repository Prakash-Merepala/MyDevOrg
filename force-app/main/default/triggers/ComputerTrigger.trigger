trigger ComputerTrigger on Computer__c (after update) {
    
    for (Computer__c comp : Trigger.new){
        if(comp.Brand__c == 'Lenovo'){
            comp.Price__c = 50000;
        }
    }

}