import { LightningElement, wire } from 'lwc';
import { reduceErrors } from 'c/ldsUtils';
import getContacts from '@salesforce/apex/ContactController.getContacts';



export default class ContactList extends LightningElement {
    @wire(getContacts)
    contacts;
    
    get errors(){return (this.contacts.error) ?
            reduceErrors(this.contacts.error) : [];
        }
    }