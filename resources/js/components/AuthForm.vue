<template>
    <form class="auth-form">
        <SignInForm></SignInForm>
        <div class="gray-line"></div>
        <SingUpForm></SingUpForm>
    </form>
</template>

<script>
import SignInForm from "./SignInForm";
import SingUpForm from "./SingUpForm";

export default {
    name: "AuthForm",
    components: {SingUpForm, SignInForm}
}
</script>

<style lang="scss" scoped>
.auth-form {
    max-width: 850px;
    height: auto;
    display: flex;
    margin: 50px auto 80px auto;
    justify-content: space-between;
    padding: 25px 50px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
    position: relative;
}


.gray-line {
    width: 1px;
    min-height: 550px;
    margin: 0 auto;
    border-right: 1px solid rgba(0, 0, 0, 0.5);
}
</style>
