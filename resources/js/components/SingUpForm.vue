<template>
    <div class="auth-form__sign-up">
        <div class="auth-form__title">Регистрация</div>
        <label v-if="!isWrongLogin" for="reg-login">Логин</label>
        <label v-else class="validation-error" for="reg-login">Введите корректный email</label>
        <input type="email" id="reg-login" :class="isWrongLogin ? 'validation-error-input' : ''" v-model="email" placeholder="Email">

        <label v-if="!isWrongLastname" for="lastname">Фамилия</label>
        <label v-else class="validation-error" for="reg-login">Введите корректно фамилию</label>
        <input type="text" id="lastname" :class="isWrongLastname ? 'validation-error-input' : ''" v-model="lastname" placeholder="Латинскими буквами">

        <label v-if="!isWrongFirstname" for="firstname">Имя</label>
        <label v-else class="validation-error" for="reg-login">Введите корректно имя</label>
        <input type="text" id="firstname" :class="isWrongFirstname ? 'validation-error-input' : ''" v-model="firstname" placeholder="Латинскими буквами">

        <label v-if="!isWrongPasswordConf" for="reg-pass">Пароль</label>
        <label v-else class="validation-error" for="reg-pass">Пароли не совпадают</label>
        <input type="password" id="reg-pass" :class="isWrongPasswordConf ? 'validation-error-input' : ''" v-model="password"
               placeholder="Пароль">
        <label v-if="!isWrongPasswordConf" for="reg-pass-repeat">Повтор пароля</label>
        <label v-else class="validation-error" for="reg-pass-repeat">Пароли не совпадают</label>
        <input type="password" id="reg-pass-repeat" :class="isWrongPasswordConf ? 'validation-error-input' : ''"
               v-model="password_confirmation" placeholder="Повтор пароля">
        <label for="reg-btn"></label>
        <input @click.prevent="store" type="submit" id="reg-btn" class="auth-form__btn"
               value="Зарегистрироваться">
        <slot></slot>
    </div>
</template>

<script>
export default {
    name: "SingUpForm",
    data() {
        return {
            email: null,
            firstname: null,
            lastname: null,
            password: null,
            password_confirmation: null,
            isWrongPasswordConf: false,
            isWrongPassword: false,
            isWrongLogin: false,
            isWrongLastname: false,
            isWrongFirstname: false,
        }
    },
    mounted() {

    },
    methods: {
        store() {
            if(this.password === this.password_confirmation && this.email != null && this.firstname != null && this.lastname != null){
                axios.post('/api/users', {
                    email: this.email,
                    firstname: this.firstname,
                    lastname: this.lastname,
                    password: this.password,
                    password_confirmation: this.password_confirmation
                }).then(res => {
                    localStorage.setItem('access_token', res.data.access_token);
                    this.$router.push('/');
                })
            }else {
                if(this.password !== this.password_confirmation) this.isWrongPasswordConf = true;
                if(this.email === null) this.isWrongLogin = true;
                if(this.firstname === null) this.isWrongFirstname = true;
                if(this.lastname === null) this.isWrongLastname = true;
                if(this.password === null) this.isWrongPassword = true;
            }
        },
    }
}
</script>

<style lang="scss" scoped>
.auth-form, .auth-form-mob  {
    &__title {
        font-size: 36px;
        margin-bottom: 10px;
    }

    & input {
        width: 333px;
        padding: 10px;
        outline: none;
    }

    & label {
        padding: 10px;
        display: block;
    }

    &__btn {
        position: absolute;
        bottom: 25px;
        padding-bottom: 11px !important;
        width: 290px;
        height: 50px;
        font-size: 24px;
        background-color: #F7B903;
        color: #fff;
        outline: none;
        border: none;
        border-radius: 5px;
    }

    &__btn:hover {
        background-color: #b98a00;

    }
}

.validation-error {
    color: #ac0000;

    &-input {
        background-color: rgba(199, 41, 41, 0.53);
        border: 1px solid black;
        border-radius: 3px;
    }
}
</style>
