import { LightningElement, api, wire } from 'lwc';
import { getRecord,getFieldValue } from 'lightning/uiRecordApi';
import USER_ID from "@salesforce/schema/Contact.OwnerId";

const fields = [USER_ID];

export default class ContactUserDetails extends LightningElement {
    @api recordId;

    @wire(getRecord, { recordId: "$recordId", fields: [USER_ID] })
    user;

    get userId(){
        return getFieldValue(this.user.data, USER_ID);

    }
    
}