import { LightningElement } from 'lwc';
import { generateURL } from "lightning/fileDownload";

export default class GenerateURL extends LightningElement {
    linkUrl;
    recordId = '0151U000003KYn6QAG';

    handleClick(){
        this.linkUrl = generateUrl(this.recordId);
    }
}