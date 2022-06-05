<template>
    <div class="auth-form__sign-up">
        <div class="auth-form__title">Регистрация</div>
        <label v-if="(!isWrongLogin && !emailIsAlreadyExists && !emailIsNotBeAValid)" for="reg-login">E-mail</label>
        <label v-if="emailIsAlreadyExists" class="validation-error" for="reg-login">Такой Email уже существует!</label>
        <label v-if="(isWrongLogin && !emailIsAlreadyExists || emailIsNotBeAValid)" class="validation-error"
               for="reg-login">Введите корректный email</label>
        <UiInput
            type="email"
            id="reg-login"
            :class="(isWrongLogin || emailIsNotBeAValid || emailIsAlreadyExists) ? 'validation-error-input' : ''"
            v-model="email"
            placeholder="Email"
        />
        <label v-if="!isWrongLastname" for="lastname">Фамилия</label>
        <label v-if="isWrongLastname" class="validation-error" for="lastname">Введите фамилию(не менее 3 букв)</label>
        <UiInput
            id="lastname"
            :class="isWrongLastname ? 'validation-error-input' : ''"
            v-model="lastname"
            placeholder="Латинскими буквами"
        />
        <label v-if="!isWrongFirstname" for="firstname">Имя</label>
        <label v-else class="validation-error" for="reg-login">Введите имя(не менее 3 букв)</label>
        <UiInput
            id="firstname"
            :class="isWrongFirstname ? 'validation-error-input' : ''"
            v-model="firstname"
            placeholder="Латинскими буквами"
        />
        <label v-if="(!isWrongPasswordConf && !isWrongPassword)" for="reg-pass">Пароль</label>
        <label v-if="isWrongPasswordConf" class="validation-error" for="reg-pass">Пароли не совпадают</label>
        <label v-if="(isWrongPassword && !isWrongPasswordConf)" class="validation-error" for="reg-pass">Введите
            пароль</label>
        <UiInput
            type="password"
            id="reg-pass"
            :class="(isWrongPasswordConf || isWrongPassword) ? 'validation-error-input' : ''"
            v-model="password"
            placeholder="Пароль"
        />
        <label v-if="(!isWrongPasswordConf && !isWrongPassword)" for="reg-pass-repeat">Пароль</label>
        <label v-if="isWrongPasswordConf" class="validation-error" for="reg-pass-repeat">Пароли не совпадают</label>
        <label v-if="(isWrongPassword && !isWrongPasswordConf)" class="validation-error" for="reg-pass-repeat">Введите
            пароль</label>
        <UiInput
            type="password"
            id="reg-pass-repeat"
            :class="(isWrongPasswordConf || isWrongPassword)  ? 'validation-error-input' : ''"
            v-model="password_confirmation"
            placeholder="Повтор пароля"
        />
        <input
            @click.prevent="store"
            type="submit"
            id="reg-btn"
            class="auth-form__btn"
            value="Зарегистрироваться"
        >
        <slot></slot> <!-- For mobile version -->
    </div>
</template>

<script>
import UiInput from "./UI/UiInput";

export default {
    name: "SingUpForm",
    components: {
        UiInput
    },
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
            emailIsAlreadyExists: false,
            emailIsNotBeAValid: false,
            isWrongLastname: false,
            isWrongFirstname: false,
        }
    },
    mounted() {

    },
    methods: {
        store() {
            axios.post('/api/users', {
                email: this.email,
                firstname: this.firstname,
                lastname: this.lastname,
                password: this.password,
                password_confirmation: this.password_confirmation
            }).then(res => {
                if (res.data.message === 'Такая почта уже занята!') {
                    this.emailIsAlreadyExists = true;
                } else {
                    localStorage.setItem('access_token', res.data.access_token);
                    this.$router.push('/');
                }
            }).catch((error) => {
                error.response.data.errors.email ? this.emailIsNotBeAValid = true : this.emailIsNotBeAValid = false;
                error.response.data.errors.firstname ? this.isWrongFirstname = true : this.isWrongFirstname = false;
                error.response.data.errors.lastname ? this.isWrongLastname = true : this.isWrongLastname = false;
                error.response.data.errors.password[0] === 'The password field is required.' ? this.isWrongPassword = true : this.isWrongPassword = false;
                error.response.data.errors.password[0] === 'The password confirmation does not match.' ? this.isWrongPasswordConf = true : this.isWrongPasswordConf = false;
            });
        }
    },

}
</script>

<style lang="scss" scoped>
.auth-form, .auth-form-mob {
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
        margin-top: 15px;
        bottom: 25px;
        right: 25px;
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
        background-color: rgba(199, 41, 41, 0.53) !important;
        border: 1px solid black !important;
        border-radius: 3px !important;
    }
}
</style>
