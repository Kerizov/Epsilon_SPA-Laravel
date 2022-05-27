import {nextTick} from "vue";

export default {
    methods: {
        ValidateData() {
            const regexPhone = /^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/;
            const regexEmail = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            const regexPassportSeries = /^[0-9]{4}$/;
            const regexPassportNumber = /^[0-9]{6}$/;
            const regexInn = /^[0-9]{12}$/;
            const regexMailIndex = /^[0-9]{6}$/;
            const regexAddress = /^[а-яА-Я0-9,\.\s]+$/;

            if (this.phone_number.replace(/[^+\d]/g, '')) {
                if (regexPhone.test(this.phone_number)) nextTick();
                else {
                    this.phone_number = '';
                    return false;
                }
            }
            if (this.email) {
                if (regexEmail.test(this.email)) nextTick();
                else {
                    this.email = '';
                    return false;
                }
            }
            if (this.passport_series) {
                if (regexPassportSeries.test(this.passport_series)) nextTick();
                else {
                    this.passport_series = '';
                    return false;
                }
            }
            if (this.passport_number) {
                if (regexPassportNumber.test(this.passport_number)) nextTick();
                else {
                    this.passport_number = '';
                    return false;
                }
            }
            if (this.inn) {
                if (regexInn.test(this.inn)) nextTick();
                else {
                    this.inn = '';
                    return false;
                }
            }
            if (this.mail_index) {
                if (regexMailIndex.test(this.mail_index)) nextTick();
                else {
                    this.mail_index = '';
                    return false;
                }
            }
            if (this.address) {
                if (regexAddress.test(this.address)) nextTick();
                else {
                    this.address = '';
                    return false;
                }
            }
            return true;
        }
    }
}
