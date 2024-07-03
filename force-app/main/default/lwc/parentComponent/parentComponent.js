import { LightningElement, track } from 'lwc';

export default class ParentComponent extends LightningElement {
    @track trailblazer='';

    handleChange(event){
        const textVal = event.detail;
        this.trailblazer = textVal;
    }
}