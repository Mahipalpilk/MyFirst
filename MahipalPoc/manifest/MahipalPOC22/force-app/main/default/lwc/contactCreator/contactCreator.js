import { LightningElement, api, track, wire } from 'lwc';
import createContacts from '@salesforce/apex/ContactCreatorController.createContacts';
import { getRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const ACCOUNT_FIELDS = ['Account.Name'];

export default class ContactCreator extends LightningElement {

    @api recordId; // Account Id

    firstName = '';
    lastName = '';
    email = '';

    @track isLoading = false;
    @track errorMessage;

    // 🔹 Wire Account record (Reactive + Cached)
    @wire(getRecord, { recordId: '$recordId', fields: ACCOUNT_FIELDS })
    account;

    get accountName() {
        if (this.account.data) {
            return this.account.data.fields.Name.value;
        }
        return '';
    }

    handleChange(event) {
       const field = event.target.name;
    const value = event.target.value;


    this[field] = value;
    }

    async handleCreate() {

        this.isLoading = true;
        this.errorMessage = null;

        try {

            const contacts = [{
                FirstName: this.firstName,
                LastName: this.lastName,
                Email: this.email
            }];

            await createContacts({
                accountId: this.recordId,
                contactsToCreate: contacts
            });

            this.resetForm();
             this.showToast('Success', 'Records Created successfully', 'success');

        } catch (error) {
            this.errorMessage =
                error.body?.message || 'Unexpected error';
                 this.showToast('Error', this.errorMessage, 'error');
        }

        this.isLoading = false;
    }

    resetForm() {
        this.firstName = '';
        this.lastName = '';
        this.email = '';
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