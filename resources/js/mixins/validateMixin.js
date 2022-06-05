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
            let per = 0;

            if (this.phone_number) {
                this.phone_number = this.phone_number.replace(/[^+\d]/g, '');
                if (regexPhone.test(this.phone_number)) nextTick();
                else {
                    this.phone_number = '';
                    per++;
                }
            }else{
                this.phone_number = null;
            }
            if (this.email) {
                if (regexEmail.test(this.email)) nextTick();
                else {
                    this.email = '';
                    per++;
                }
            }
            if (this.name) {
                if (this.name !== Number && this.name.length >= 3) nextTick();
                else {
                    this.name = null;
                    per++;
                }
            }else{
                this.name = null;
            }
            if (this.passport_series) {
                if (regexPassportSeries.test(this.passport_series)) nextTick();
                else {
                    this.passport_series = '';
                    per++;
                }
            }
            if (this.passport_number) {
                if (regexPassportNumber.test(this.passport_number)) nextTick();
                else {
                    this.passport_number = '';
                    per++;
                }
            }
            if (this.inn) {
                if (regexInn.test(this.inn)) nextTick();
                else {
                    this.inn = '';
                    per++;
                }
            }
            if (this.mail_index) {
                if (regexMailIndex.test(this.mail_index)) nextTick();
                else {
                    this.mail_index = '';
                    per++;
                }
            }
            if (this.address) {
                if (regexAddress.test(this.address)) nextTick();
                else {
                    this.address = '';
                    per++;
                }
            }
            return (per > 0) ? false : true;
        }
    }
}
