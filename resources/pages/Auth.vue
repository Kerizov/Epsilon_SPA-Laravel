<template>
    <HeaderOther>
        <template v-slot:title>Аутентификация</template>
        <template v-slot:path>Аутентификация</template>
    </HeaderOther>
    <section class="Auth">
        <div class="container">
            <AuthForm></AuthForm>
        </div>
    </section>
    <Footer></Footer>
</template>

<script>
import HeaderOther from "../js/components/HeaderOther";
import Footer from "../js/components/Footer";
import AuthForm from "../js/components/AuthForm";

export default {
    name: "Auth",
    components: {AuthForm, Footer, HeaderOther}
}
</script>

<style >

</style>
