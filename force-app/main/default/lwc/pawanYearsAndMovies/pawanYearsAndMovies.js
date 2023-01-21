import { LightningElement, api, track } from 'lwc';

export default class PawanYearsAndMovies extends LightningElement {
    @track selectedOption;
    changeHandler(event){
        const field = event.target.name;
        if (field === 'optionSelect') {
        this.selectedOption = event.target.value;
        movie = event.target.value;
        } 
    }
}