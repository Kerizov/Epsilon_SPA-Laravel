import api from "../api";

export default {
    data() {
        return {
            user_id: null,
            firstname: null,
            lastname: null,
            email: null,
            phone_number: null,
            passport_series: null,
            passport_number: null,
            inn: null,
            mail_index: null,
            address: null,
            isSuccess: false,
            isFailure: false,
        }
    },
    methods: {
        async PersonalInfo() {
            await api.post('/api/auth/me')
                .then(res => {
                    this.user_id = res.data.id;
                    this.firstname = res.data.firstname;
                    this.lastname = res.data.lastname;
                    this.email = res.data.email;
                    this.phone_number = res.data.phone_number;
                    this.passport_series = res.data.passport_series;
                    this.passport_number = res.data.passport_number;
                    this.inn = res.data.inn;
                    this.mail_index = res.data.mail_index;
                    this.address = res.data.address;
                });
        },
        UpdatePersonInfo() {
            if (this.ValidateData() && this.firstname !== '' && this.lastname !== '' && this.email !== '') {
                api.post('api/users/update', {
                    firstname: this.firstname,
                    lastname: this.lastname,
                    email: this.email,
                    phone_number: this.phone_number,
                    passport_series: this.passport_series,
                    passport_number: this.passport_number,
                    inn: this.inn,
                    mail_index: this.mail_index,
                    address: this.address,
                })
                    .then(() => {
                        this.isSuccess = true;
                        setTimeout(() => this.isSuccess = false, 3000);
                    })
            } else {
                this.isFailure = true;
                setTimeout(() => this.isFailure = false, 3000);
            }
        },
    }
}
