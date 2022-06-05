<template>
    <div class="auth-form__sign-in">
        <div class="auth-form__title">Вход</div>
        <label :class="AuthChecked ? 'unauthorized-error' : ''" for="login">Логин</label>
        <UiInput
            id="login"
            v-model="email"
            :class="AuthChecked ? 'validation-error-input' : ''"
            placeholder="Email или телефон"
        />
        <label :class="AuthChecked ? 'unauthorized-error' : ''" for="pass">Пароль</label>
        <UiInput
            type="password"
            id="pass"
            v-model="password"
            :class="AuthChecked ? 'validation-error-input' : ''"
            placeholder="Пароль"
        />
        <p><a href="#">Забыли пароль?</a></p>
        <p v-show="AuthChecked" class="validation-error">Неверный логин или пароль</p>
        <input
            @click.prevent="AuthUser"
            type="submit"
            id="auth-btn"
            class="auth-form__btn"
            value="Войти"
        >
        <slot></slot> <!-- For mobile version -->
    </div>
</template>

<script>
import UiInput from "./UI/UiInput";

export default {
    name: "SignInForm",
    components: {
        UiInput
    },
    data() {
        return {
            email: null,
            password: null,
            AuthChecked: false,
        }
    },
    methods: {
        AuthUser() {
            axios.post('/api/auth/login',
                {
                    email: this.email,
                    password: this.password
                })
                .then(res => {
                    localStorage.setItem('access_token', res.data.access_token);
                    this.$router.push('/');
                }).catch((error) => {
                if (error.response) {
                    this.AuthChecked = true;
                }
            })
        }
    }
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

p {
    margin-top: 10px;
}
</style>
