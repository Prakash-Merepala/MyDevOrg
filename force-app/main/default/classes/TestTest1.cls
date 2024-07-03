public class TestTest1 {
    /*
LICENSE INFO
<template>
    <lightning-card title="Org License Detail" icon-name="standard:care_request_reviewer">
        <template if:true={licenses.data}>
            <lightning-datatable
                key-field="Id"
                data={licenses.data}
                columns={columns}>
            </lightning-datatable>
        </template>
        <div slot="footer">
            <lightning-badge label="This is a LWC Component"></lightning-badge>
        </div>
    </lightning-card>
</template>
JS
import { LightningElement, track, wire } from 'lwc';
import getLicenseInfo from '@salesforce/apex/OrgInfo_Controller.getLicenseInfo';
import { getRecordNotifyChange } from 'lightning/uiRecordApi';

const columns = [
    { label: 'License Name', fieldName: 'Name' },
    { label: 'Total Licenses', fieldName: 'TotalLicenses', type: 'number' },
    { label: 'Used Licenses', fieldName: 'UsedLicenses', type: 'number' },
    { label: 'Last Updated', fieldName: 'UsedLicensesLastUpdated', type: 'date' },
]


export default class OrgInfo extends LightningElement {

    columns = columns;
    @track UsedLicenses = 0;
    data;
    error;

    //Data table for license information
    @wire(getLicenseInfo) licenses;
    wiredLicenses({data,error}){
        if(data){
            this.licenses = data;
            this.error = error;
        }else {
            this.licenses = undefined;
            this.error = error;
        }
    }

    connectedCallback() {
        this.renderedCallback = true;
      
    }

    handleRefreshView(event){
        eval("$A.get('e.force:refreshView').fire();");
    }
}
CSS
.data-table{
    height: 300px;
    width: 450px;
}

.button_align{

    border-radius: 5px;
    margin: auto;

}

.THIS {

    background-color: cyan;
}

HEADER INFO

<template>
    <div class="slds-page-header">
        <div class="slds-align_absolute-center">
            <div class="text">
                <p> #HappyCoding </p>
            </div>
        </div>
        <div class="slds-grid">
            <div class="slds-col">
                <span>
                    <div>
                        <template if:true={users.data}>
                            <template for:each={users.data} for:item="user">
                            <p key={user.Id} class="text">No.of Active Users in the Org:</p><p key={user.Id} class="slds-text-heading_large value_style"> {user.Active_Users__c}</p>
                            </template>
                        </template>
                    </div>
                </span>
            </div>
            <div class="slds-col">
                <span>
                    <div>
                        <template if:true={organization.data}>
                            <template for:each={organization.data} for:item="org">
                            <p key={org.Id} class="text">Sandbox Name:</p><p key={org.Id} class="slds-text-heading_medium info"> {org.Name}</p>
                            </template>
                        </template>
                    </div>
            
                    <div>
                        <template if:true={organization.data}>
                            <template for:each={organization.data} for:item="org">
                            <p key={org.Id} class="text">Sandbox Instance:</p><p key={org.Id} class="slds-text-heading_medium info"> {org.InstanceName}</p>
                            </template>
                        </template>
                    </div>
                </span>
            </div>
        </div>   
    </div>
</template>

JS
import { LightningElement, wire } from 'lwc';
import getOrganization from '@salesforce/apex/OrgInfo_Controller.getOrganization';
import getActiveUsers from '@salesforce/apex/OrgInfo_Controller.getActiveUserInfo';


const FIELDS = [(
    'Organization.Name',
    'Organization.IsSanbox'
    //'User_Info__c.Active_Users__c'

)]
export default class ApexWireMethodToProperty extends LightningElement {
    data;
    error;
    

    @wire(getOrganization) organization;
    wiredOrganization({data,error}){
        if(data){
            console.log('This is the data:' +data)
            this.organization = data;
            this.error = error;
        }else {
            this.organization = undefined;
            this.error = error;
        }
    }

    @wire(getActiveUsers) users;
    wiredUsers({data, error}){
        if(data){
            this.users = data;
            this.error = error;
        }else {
            this.users = undefined;
            this.error = error;
        }
    }
}
CSS
.text {
    font-size:medium;
    font-weight:regular;
}

.value_style {

   
    color: lightskyblue;

}

.info{

    color: lightseagreen;
}
 
GENERIC LOGS
<aura:component implements="flexipage:availableForAllPageTypes,flexipage:availableForRecordHome" access="global" >
    <lightning:card title="Generic Logs List View" iconName="standard:logging">
        <lightning:listView aura:id="listViewGenericLogs"
        objectApiName="Generic_Log__c"
        listName="My_Logss"
        rows="10"
        showSearchBar="true"
        showActionBar="false"
        enableInlineEdit="true"
        showRowLevelActions="false"/>

        <aura:set attribute="footer">
            <lightning:badge label="This is an Aura Component"/>
        </aura:set>
    </lightning:card>
</aura:component>
CSS
.THIS {
    background-color: white;
}
CONTROLLER
public without sharing class OrgInfo_Controller {
    
    //fetch records form UserLicense Object
    @AuraEnabled(cacheable = true )
    public static List<UserLicense> getLicenseInfo(){
        return [Select Id, Name, UsedLicenses, TotalLicenses, UsedLicensesLastUpdated from UserLicense WITH SECURITY_ENFORCED ORDER BY Name ];
    }
    //fetch records form Organization Object
    @AuraEnabled (cacheable = true )
    public static List<Organization> getOrganization(){
        return [Select Id,Name, IsSandbox, InstanceName from Organization WITH SECURITY_ENFORCED ];
    }
    //fetch records form User_Info__c Object
    @AuraEnabled (cacheable = true )
    public static List<User_Info__c> getActiveUserInfo(){
        //updateUserInfo();
        return [select Id, Name, Active_Users__c from User_Info__c WITH SECURITY_ENFORCED ]; 
    }
    //fetch records form User Object
    @AuraEnabled (cacheable = true )
    public static List<User> getUsers(String searchKey){
        String searchString = '%'+searchKey+'%';
        List<User> returnlist=new List<User>();
        if(!String.isBlank(searchString))
            for(User u:[select Id, Name, Alias, FirstName, LastName, Username, Email, IsActive, LastLoginDate, LastPasswordChangeDate,
                        ContactId, AccountId, WIC_Status__c, WIC_User_Type__c, Agency_ID__c, Is_Head_Of_Household__c, Is_ID_Proofed__c, 
                        Is_RMB_Enabled__c, Is_RMC_Enabled__c 
                        from User where 
                        Name like:searchString
                        WITH SECURITY_ENFORCED ]){
                           returnlist.add(u);
                        }
        return returnlist;
    }
}

Get Permissions
<aura:attribute name="contactMeta" type="Object" access="Public"/>
JS
 getUserPermissions : function(component) {        
        try{ 
            //Added by HH [29-Sep-2020] US 40920
            this.onPermissionChange(component, event);
            this.callServer(component, "c.getuserpermissionsinfo", function(response)   {          
                
                var contactMeta = response.objectData.ContactMeta.Contact;
                component.set("v.contactMeta",contactMeta); 
                
            },  {
            }, false);
        } catch(e) { 
            this.consoleLog(e.stack, true); 
        }


	*/

}