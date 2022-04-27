<template>
    <header>
        <div class="container">
            <div class="header__inner">
                <router-link to="/"><img class="logo" src="../../images/logo.svg" alt="logo"></router-link>
                <router-link :to="{ name: 'home.auth' }">
                    <div class="flex">
                        <template v-if="AuthChecked">
                            <div class="cabinet-link">Личный кабинет</div>
                        </template>
                        <img src="../../images/user.svg" alt="">
                    </div>

                </router-link>
            </div>
            <Crumbs>
                <template v-slot:subtitle><slot name='subtitle'/></template>
                <template v-slot:title><slot name='title'/></template>
                <template v-slot:path><slot name='path'/></template>
            </Crumbs>
        </div>
    </header>
</template>

<script>
import Crumbs from "./Crumbs";

export default {
    name: "HeaderOther",
    components: {
        Crumbs
    },
    data() {
        return {
            AuthChecked: false,
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
.header__inner {
    height: 100px;
    background-color: #fff;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 40px;

& > a >  .logo {
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
.cabinet-link{
    color: #000;
    text-decoration: none;
    padding-right: 10px;
}
.flex{
    display: flex;
}
</style>
