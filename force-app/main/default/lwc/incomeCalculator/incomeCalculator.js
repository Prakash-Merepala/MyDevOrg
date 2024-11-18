import { LightningElement, wire, api } from 'lwc';
import { getRecord, getFieldValue,updateRecord, createRecord } from 'lightning/uiRecordApi';

export default class IncomeCalculator extends LightningElement {
    @api

    

    async createIncome(){
        await LightningAlert.open({
            message: 'New Income added',
            theme: 'info', // a red theme intended for error states
            label: 'Alert'
        })

    }
}