<template>
    <header class="header">
        <div class="container">
            <div class="header__inner">
                <router-link :to="{ name: 'home.index' }"><img class="logo" src="../../images/logo.svg" alt="logo">
                </router-link>
                <nav class="menu">
                    <ul>
                        <li>
                            <router-link :to="{ name: 'home.index' }">Главная</router-link>
                        </li>
                        <li>
                            <router-link :to="{ name: 'home.about' }">О нас</router-link>
                        </li>
                        <li>
                            <router-link :to="{ name: 'home.contacts' }">Контакты</router-link>
                        </li>
                        <li>
                            <router-link :to="{ name: 'home.auth' }">
                                <img src="../../images/user.svg" alt="">
                            </router-link>
                        </li>
                    </ul>

                </nav>
                <div class="mobile_buttons">
                    <span class="mob-menu_btn">
                        <img @click="isMobMenuVisible = !isMobMenuVisible" src="../../images/menu-button.svg" alt="Меню"></span>
                    <!--<span class="close_btn"><img src="../../images/menu-button.svg" alt="Меню"></span>-->
                </div>
                <transition name="fade">
                <div class="mob__menu" v-show="isMobMenuVisible">
                    <nav class="mob-menu__list">
                        <ul class="menu-list">
                            <li>
                                <router-link :to="{ name: 'home.index' }">Главная</router-link>
                            </li>
                            <li>
                                <router-link :to="{ name: 'home.about' }">О нас</router-link>
                            </li>
                            <li>
                                <router-link :to="{ name: 'home.contacts' }">Контакты</router-link>
                            </li>
                            <li>
                                <router-link :to="{ name: 'home.auth' }">
                                    <template v-if="AuthChecked">
                                        <div class="cabinet-link">Личный кабинет<img src="../../images/user.svg" alt=""></div>
                                    </template>
                                    <template v-else>
                                        Авторизация
                                    </template>
<!--                                    <img src="../../images/user.svg" alt="">-->
                                </router-link>
                            </li>
                        </ul>
                    </nav>
                </div>
                </transition>
            </div>
        </div>
    </header>
</template>

<script>

export default {
    name: "Header",
    data() {
        return {
            AuthChecked: false,
            isMobMenuVisible: false,
        }
    },
    mounted() {
        this.CheckAuth();
    },
    methods: {
        CheckAuth() {
            if (localStorage.getItem('access_token')) {
                this.AuthChecked = true;
            }
        },
    }
}
</script>

<style lang="scss" scoped>
.fade-enter-active,
.fade-leave-active {
    transition: all 0.3s ease-out;
}
.fade-enter-from,
.fade-leave-to{
    transform: translateY(-20px);
    opacity: 0;
}
.header__inner {
    height: 100px;
    background-color: #fff;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 40px;

    & > a > .logo {
        width: 150px;
        height: auto;
    }

    & ul {
        display: flex;
        align-items: center;
    }

    & li {
        text-align: center;
        list-style: none;
        width: 150px;
        height: 100px;
        border-top: 5px solid transparent;
        line-height: 93px;
    }

    & li:hover {
        border-top: 5px solid #97CA2B;
        background-color: #A9A9A930;
    }

    & li:last-child {
        width: 30px;
        height: 30px;
        margin-left: 20px;
        line-height: inherit;
    }

    & li:last-child:hover {
        cursor: pointer;
        border-top: 5px solid transparent;
        background-color: #fff;
    }

    & ul a {
        display: inline-block;
        width: 150px;
        height: 100px;
        text-decoration: none;
        color: black;
        font-size: 18px;
    }

    & li:last-child a {
        height: 20px;
        width: 20px;
        padding: 0;
    }
}
</style>
