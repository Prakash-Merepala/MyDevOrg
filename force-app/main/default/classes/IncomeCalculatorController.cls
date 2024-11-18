/**
 * @description       : 
 * @author            : Jaya Prakash Merepala
 * @group             : 
 * @last modified on  : 07-05-2024
 * @last modified by  : Jaya Prakash Merepala
**/
public with sharing class IncomeCalculatorController {
    public static Integer totalPrincipal() {
        Integer principal = 0;
        List<Income__c> incomeList = new List<Income__c>();
        incomeList = [Select Id,Name,Amount__c,Amount_Source__c,Interest__c,Next_Expected_Interest__c,Total_Principal__c From Income__c WITH SECURITY_ENFORCED];


        for(Income__c inc : incomeList) {
            if(inc.Total_Principal__c != null) {
                principal += Integer.valueOf(inc.Total_Principal__c);
            }
        }

        return principal;
    }
}