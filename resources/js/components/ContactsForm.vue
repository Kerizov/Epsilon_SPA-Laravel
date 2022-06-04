<template>
    <form class="contacts__form" action="" method="post">
        <div>
            <label for="name"></label>
            <input v-model="name" type="text" id="name" placeholder="Имя">
        </div>
        <div>
            <label for="lastname"></label>
            <input v-model="lastname" type="text" id="lastname" placeholder="Фамилия">
        </div>
        <div>
            <label for="email"></label>
            <input v-model="email" type="email" id="email" placeholder="E-mail">
        </div>
        <div>
            <label for="phone"></label>
            <input v-model="phone" v-mask="'+7 (###) ###-##-##'" type="tel" id="phone" placeholder="Телефон">
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
        <div class="d-none" :class="{'update-failure': isFailure === true}">Что-то пошло не так!</div>
    </div>
</template>

<script>
import api from "../api";

export default {
    name: "ContactsForm",
    data() {
        return {
            name: null,
            lastname: null,
            email: null,
            phone: null,
            message: null,
            isSuccess: false,
            isFailure: false,
        }
    },
    methods: {

        SendRequest() {
            if (this.name !== Number && this.name.length >= 3 && this.phone) {
                api.post('api/request', {
                    name: this.name,
                    lastname: this.lastname,
                    email: this.email,
                    phone: this.phone.replace(/[^+\d]/g, ''),
                    message: this.message,
                }).then(res => {
                    this.isSuccess = true;
                    this.name = null
                    this.lastname = null
                    this.email = null
                    this.phone = null
                    this.message = null
                })
            } else {
                this.isFailure = true;
            }

        }
    }
}
</script>

<style scoped>
.contacts__form > .btn input:hover{
    background-color: #b98a00;
}
.update-success, .update-failure {
    animation: update-anim-b0417fbc 3s forwards;
    text-align: center;
    justify-content: center;
    padding: 5px;
    color: black;
    font-size: 16px;
    display: flex !important;
    z-index: 0;
}

@keyframes update-anim {
    0% {
        transform: translateY(-30px);
        opacity: 0;
    }
    15% {
        transform: translateY(-10px);
        opacity: 1;
    }
    80% {
        transform: translateY(-10px);
        opacity: 1;
    }
    90% {
        transform: translateY(-10px);
        opacity: 0.1;
    }
    95% {
        transform: translateY(-10px);
        opacity: 0;
    }
    100% {
        transform: translateY(-10px);
        opacity: 0;
    }
}
</style>
