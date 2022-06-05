<template>
    <form class="contacts__form" action="" method="post">
        <div>
            <label for="name"></label>
            <input v-model="name" :class="{'incorrect': name === null}" type="text" id="name"
                   placeholder="Имя (не менее 3 букв)">
        </div>
        <div>
            <label for="phone"></label>
            <input v-model="phone_number" :class="{'incorrect': phone_number === null}" v-mask="'+7 (###) ###-##-##'"
                   type="tel" id="phone" placeholder="Телефон">
        </div>
        <div>
            <label for="lastname"></label>
            <input v-model="lastname" type="text" id="lastname" placeholder="Фамилия">
        </div>
        <div>
            <label for="email"></label>
            <input v-model="email" type="email" id="email" placeholder="E-mail">
        </div>
        <div class="textarea">
            <label for="message"></label>
            <textarea v-model="message" name="" id="message" cols="40" rows="5" placeholder="Комментарий"></textarea>
        </div>
        <div class="btn">
            <input @click.prevent="SendRequest" type="submit">
        </div>

    </form>
    <div style="height: 30px;">
        <div class="d-none" :class="{'update-success': isSuccess === true}">Заявка отправлена!</div>
        <div class="d-none" :class="{'update-failure': isFailure === true}">Запольните обязательные поля корректными
            данными!
        </div>
    </div>
</template>

<script>
import api from "../api";
import validateMixin from "../mixins/validateMixin";

export default {
    name: "ContactsForm",
    mixins: [validateMixin],
    data() {
        return {
            name: '',
            lastname: '',
            email: '',
            phone_number: '',
            message: '',
            isSuccess: false,
            isFailure: false,
        }
    },
    methods: {
        SendRequest() {
            if (this.ValidateData() && this.name && this.phone_number) {
                api.post('api/request', {
                    name: this.name,
                    lastname: this.lastname,
                    email: this.email,
                    phone_number: this.phone_number,
                    message: this.message,
                }).then(res => {
                    this.name = '';
                    this.lastname = '';
                    this.email = '';
                    this.phone_number = '';
                    this.message = '';
                    this.isSuccess = true;
                    setTimeout(() => this.isSuccess = false, 3000);
                })
            } else {
                this.isFailure = true;
                this.phone_number = null;
                setTimeout(() => this.isFailure = false, 3000);
            }

        }
    }
}
</script>

<style scoped>
.contacts__form > .btn input:hover {
    background-color: #b98a00;
}

.update-success, .update-failure {
    animation: update-anim-b0417fbc 3s forwards;
    text-align: center;
    justify-content: center;
    padding: 5px;
    margin: 0 auto;
    color: black;
    font-size: 16px;
    display: flex !important;
    z-index: 0;
}

.incorrect {
    border-color: red !important;
}

@keyframes update-anim {
    0% {
        transform: translateY(-50px);
        opacity: 0;
    }
    15% {
        transform: translateY(-30px);
        opacity: 1;
    }
    80% {
        transform: translateY(-30px);
        opacity: 1;
    }
    90% {
        transform: translateY(-30px);
        opacity: 0.1;
    }
    95% {
        transform: translateY(-30px);
        opacity: 0;
    }
    100% {
        transform: translateY(-30px);
        opacity: 0;
    }
}
</style>
