import { LightningElement, api } from 'lwc';

export default class ErrorPanel extends LightningElement {

    @api errors;

    get errorMessages() {

        if (!this.errors) return [];

        const reduceError = (error) => {

            if (Array.isArray(error.body)) {
                return error.body.map(e => e.message);
            }

            if (error.body && typeof error.body.message === 'string') {
                return [error.body.message];
            }

            if (error.body && error.body.pageErrors) {
                return error.body.pageErrors.map(e => e.message);
            }

            if (error.body && error.body.fieldErrors) {
                return Object.values(error.body.fieldErrors)
                    .flat()
                    .map(e => e.message);
            }

            if (error.message) {
                return [error.message];
            }

            return ['Unknown error'];
        };

        return Array.isArray(this.errors)
            ? this.errors.map(reduceError).flat()
            : reduceError(this.errors);
    }

    get hasErrors() {
        return this.errorMessages.length > 0;
    }
}