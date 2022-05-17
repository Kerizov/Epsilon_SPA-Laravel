<template>
    <div class="auth-form__sign-in">
        <div class="auth-form__title">Вход</div>
        <label for="login">Логин</label>
        <input type="text" id="login" v-model="email" placeholder="Email или телефон">
        <label for="pass">Пароль</label>
        <input type="password" id="pass" v-model="password" placeholder="Пароль">
        <p><a href="#">Забыли пароль?</a></p>
        <label for="auth-btn"></label>
        <input @click.prevent="AuthUser" type="submit" id="auth-btn" class="auth-form__btn" value="Войти">
        <slot></slot>
    </div>
</template>

<script>
export default {
    name: "SignInForm",
    data() {
        return {
            email: null,
            password: null,
        }
    },
    methods: {
        AuthUser() {
            axios.post('/api/auth/login', {email: this.email, password: this.password})
                .then(res => {
                    localStorage.setItem('access_token', res.data.access_token);
                    this.$router.push('/');
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
