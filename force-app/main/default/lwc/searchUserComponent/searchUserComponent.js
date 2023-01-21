import { LightningElement } from 'lwc';

export default class SearchUserComponent extends LightningElement {
    fields = ["Name","Username" ,"IsActive"];
    displayFields = 'Name, Username, IsActive'

    handleLookup(event){
        console.log( JSON.stringify( event.detail))
    }
}