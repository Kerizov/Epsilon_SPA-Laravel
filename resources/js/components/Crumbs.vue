<template>
    <section class="crumbs">
        <CrumbsTitle>
            <template v-slot:subtitle>
                <slot name='subtitle'/>
            </template>
            <template v-slot:title>
                <slot name='title'/>
            </template>
        </CrumbsTitle>
        <div class="crumbs__inner">
            <router-link to="/">Главная</router-link>
            <img src="../../images/arrow.svg" alt="">
            <a href="#">
                <slot name='path'/>
            </a>
        </div>
    </section>
</template>

<script>
import CrumbsTitle from "./CrumbsTitle";

export default {
    name: "Crumbs",
    components: {CrumbsTitle}
}
</script>

<style lang="scss">
.crumbs {
    -webkit-user-select: none;
    height: 160px;
    background: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, .15)), url(../../images/bg-2.jpg) bottom center no-repeat;
    background-size: cover;
    text-align: center;
    color: #ffffff;
    padding-top: 20px;

    &__inner img {
        padding: 0 5px;
    }

    & a {
        text-decoration: none;
        color: #ffffff;
    }

    & a:last-child {
        text-decoration: underline;
    }
}
</style>
