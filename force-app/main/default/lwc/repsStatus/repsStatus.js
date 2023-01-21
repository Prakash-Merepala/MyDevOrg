import { LightningElement } from 'lwc';

export default class RepsStatus extends LightningElement {

    get options1() {
        return [
            { label: 'New', value: 'new' },
            { label: 'In Progress', value: 'inProgress' },
            { label: 'Finished', value: 'finished' },
        ];
    }

    handleChange1(event) {
        this.value = event.detail.value;
    }
    handleChange2(event) {
        this.value = event.detail.value;
    }
    handleChange3(event) {
        this.value = event.detail.value;
    }
    handleChange4(event) {
        this.value = event.detail.value;
    }
}