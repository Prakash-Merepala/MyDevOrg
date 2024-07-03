import { LightningElement } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import LightningAlert from 'lightning/alert';


export default class ToggleAutomationRules extends LightningElement {
    
    inputVariables= [];
    
    async handleStatusChange() {
        await LightningAlert.open({
            message: 'Rules are turned OFF',
            theme: 'info', // a red theme intended for error states
            label: 'Alert', // this is the header text
        });
        //Alert has been closed
    }
}