import { LightningElement, wire, track } from 'lwc';
import getUsers from '@salesforce/apex/OrgInfo_Controller.getActiveUsers';

export default class OrgInfo_Header extends LightningElement {
@track userInfo;

handleClick() {
    getUsers()
       .then(result => {
               this.userInfo = result;
               showInfo = true;
       })
       .catch(error => {
           console.log('Errorured:- '+error.body.message);
       });
    }
}