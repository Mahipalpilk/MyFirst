import { LightningElement, track, wire, api } from 'lwc';
import searchAccounts from '@salesforce/apex/AccountManagerController.searchAccounts';
import upsertAccountsAsync from '@salesforce/apex/AccountManagerController.upsertAccountsAsync';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AccountManager extends LightningElement {

    @api title = 'Account Manager';

    @track searchKey = '';
    @track data = [];
    @track selectedRows = [];

    error;
    wiredResult;


    columns = [
    { label: 'Name', fieldName: 'Name', editable: true },
    { label: 'Industry', fieldName: 'Industry', editable: true },
    { label: 'Phone', fieldName: 'Phone', editable: true }
    ];


    // WIRE SERVICE
    @wire(searchAccounts, { searchKey: '$searchKey' })
    wiredAccounts(result) {
        this.wiredResult = result;

        if (result.data) {
            this.data = result.data;
            this.error = undefined;
        } else if (result.error) {
            this.error = result.error;
            this.data = [];
        }
    }
    @track draftValues = [];

handleSave(event) {
    this.draftValues = event.detail.draftValues;
    this.handleUpsert();
}


    handleSearch(event) {
        this.searchKey = event.target.value;
    }

    handleRowSelection(event) {
        this.selectedRows = event.detail.selectedRows;
    }

    // async handleUpsert() {

    //     if (!this.selectedRows || this.selectedRows.length === 0) {
    //         this.showToast('Warning', 'Please select at least one record', 'warning');
    //         return;
    //     }

    //     try {
    //         await upsertAccountsAsync({ accountsToUpsert: this.selectedRows });

    //         this.showToast('Success', 'Upsert job started successfully', 'success');

    //         await refreshApex(this.wiredResult);

    //     } catch (error) {
    //         this.error = error;
    //     }
    // }

    async handleUpsert() {

    if (!this.draftValues || this.draftValues.length === 0) {
        this.showToast('Warning', 'No changes to save', 'warning');
        return;
    }
     console.log('valuessss'+  JSON.stringify(this.draftValues));
    try {

        await upsertAccountsAsync({
            accountsToUpsert: this.draftValues
        });

        this.showToast('Success', 'Records updated successfully', 'success');

        this.draftValues = [];

        await refreshApex(this.wiredResult);

    } catch (error) {
        this.error = error;
    }
}


    showToast(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title,
                message,
                variant
            })
        );
    }
}