import { LightningElement } from 'lwc';

export default class TestCancerData extends LightningElement {
    value = 'Select an option';

    get cancerType() {
        return [
            { label: 'Select an option', value: 'None' },
            { label: 'Ovarian Cancer', value: 'ovarian' },
            { label: 'Lungs Cancer', value: 'lungs' },
            { label: 'Cervical Cancer', value: 'cervix' },
            { label: 'Breast Cancer', value: 'breast' },
        ];
    }

    get gender() {
        return [
            { label: 'Male', value: 'male' },
            { label: 'Female', value: 'female' },
            { label: 'Other', value: 'other'},
        ];
    }
    
    get infoType() {
        return [
            { label: 'Causes', value: 'cause' },
            { label: 'Natural Remedies', value: 'remedies' },
            { label: 'Hospitals', value: 'hospital'},
        ];
    }


    handleType(event) {
        this.value = event.detail.value;
    }

    handleGender(event){
        this.value = event.detail.value;
    }
    handleAge(event){
        var enteredDate = event.detail.value;
        this.value = enteredDate - today();
    }
}