import { LightningElement, track} from 'lwc';

export default class ChildComponent extends LightningElement {
    @track trailblazer='';
    

    handleChange(event){

        this.trailblazer = event.target.value;

        const evt = new CustomEvent('myevent', {detail : this.trailblazer});

        this.dispatchEvent(evt);
    }
}