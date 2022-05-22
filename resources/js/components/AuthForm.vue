<template>
    <form class="auth-form">
        <SignInForm></SignInForm>
        <div class="gray-line"></div>
        <SingUpForm></SingUpForm>
    </form>
    <form class="auth-form-mob">
        <template :class="[toggleShow ? 'd-flex' : 'd-none']">
            <SignInForm><p class="auth-form-mob__link">Вы еще не регистрировались? <span @click="toggleShow = !toggleShow">Регистрироваться</span></p></SignInForm>
        </template>
        <template :class="[!toggleShow ? 'd-flex' : 'd-none']">
            <SingUpForm><p class="auth-form-mob__link">У вас уже есть аккаунт? <span @click="toggleShow = !toggleShow">Авторизоваться</span></p></SingUpForm>
        </template>
    </form>
</template>

<script>
import SignInForm from "./SignInForm";
import SingUpForm from "./SingUpForm";

export default {
    name: "AuthForm",
    components: {SingUpForm, SignInForm},
    data(){
        return{
            toggleShow: true,
        }
    }
}
</script>

<style lang="scss" scoped>
.auth-form {
    max-width: 850px;
    height: auto;
    display: flex;
    margin: 50px auto 80px auto;
    justify-content: space-between;
    padding: 25px 25px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
    position: relative;
}
.auth-form-mob {
    display: none;
    max-width: 450px;
    min-height: 300px;
    margin: 50px auto 80px auto;
    justify-content: center;
    padding: 25px 25px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
    position: relative;

    &__link{
        margin-top: 15px;
        font-size: 14px;
        opacity: .9;
        & > span{
            text-decoration: underline;
            text-decoration-color: #0D6EFD;
        }
    }
}


.gray-line {
    width: 1px;
    min-height: 550px;
    margin: 0 auto;
    border-right: 1px solid rgba(0, 0, 0, 0.5);
}
</style>
