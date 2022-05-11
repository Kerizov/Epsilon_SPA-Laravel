<template>
    <div class="page">
        <Header></Header>
        <main class="main">
            <div class="container">
                <div class="main__inner">
                    <div class="desc">
                        <div class="main__slogan">
                            <h1>
                                Небеса ждут тебя
                            </h1>
                        </div>
                        <div class="main__info">
                            <p>
                                Вместе с Epsilon вы сможете быстро заказать
                                билеты на самолет и как можно скорее насладится своим
                                отпуском
                            </p>
                        </div>
                        <div class="main__btn">
                            <router-link :to="{ name: 'home.about' }">Подробнее</router-link>
                        </div>
                    </div>
                    <div class="main__form">
                        <form class="main__search-form" method="get" action="">
                            <div class="block">
                                <div>
                                    <label for="from">Откуда</label>
                                    <select name="" v-model="routes.departure_city" id="from">
<!--                                        <option value=""  v-for="option in options">-->
<!--                                            {{ option.country }}-->
<!--                                        </option>-->
                                        <option value="Москва">Москва</option>
                                        <option value="USA">USA</option>
                                        <option value="Austria">Austria</option>
                                        <option value="Austria">Germany</option>
                                        <option value="Austria">Czech</option>
                                    </select>
                                </div>
                                <div>
                                    <label for="to">Куда</label>
                                    <select name="" v-model="routes.destination_city" id="to">
<!--                                        <option value=""  v-for="option in options" :value="option.country">-->
<!--                                            {{ option.country }}-->
<!--                                        </option>-->
                                        <option value="Russia">Russia</option>
                                        <option value="USA">USA</option>
                                        <option value="Austria">Austria</option>
                                        <option value="Austria">Germany</option>
                                        <option value="Austria">Czech</option>
                                    </select>
                                </div>
                                <div>
                                    <label for="return">Прилет</label>
                                    <input v-model="routes.destination" type="date" id="return">
                                </div>
                                <div>
                                    <label for="depart">Вылет</label>
                                    <input v-model="routes.departure" type="date" id="depart">
                                </div>
                                <div>
                                    <label for="class">Выберите класс</label>
                                    <select id="class">
                                        <option value="">Эконом</option>
                                        <option value="">Бизнес</option>
                                        <option value="">Люкс</option>
                                    </select>
                                </div>
                                <div>
                                    <label for="passenger">Кол-во пассажиров</label>
                                    <input type="number" id="passenger" min="1" max="10" value="1">
                                </div>
                                <input type="number" v-model="routes.id">
                                <div class="grid-block">
                                    <div class="btn-submit" @click="GetRoutes">
<!--                                        <router-link :to="{ name: 'home.air_routes' }">-->

                                            <p>Поиск</p>


<!--                                        </router-link>-->
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <HomeNews></HomeNews>
        <Footer></Footer>
    </div>
</template>

<script>

import Footer from "../js/components/Footer";
import Header from "../js/components/Header";
import HomeNews from "../js/components/HomeNews";
import { ref } from 'vue'
import api from "../js/api";


export default {
    name: "Home",
    components: {
        HomeNews,
        Header,
        Footer
    },
    data() {
        return {
            // options: [
            //     {
            //         country: 'Russia',
            //         value: '0'
            //     },
            //     {
            //         country: 'USA',
            //         value: '1'
            //     },
            //     {
            //         country: 'Austria',
            //         value: '2'
            //     },
            //     {
            //         country: 'Germany',
            //         value: '3'
            //     },
            //     {
            //         country: 'Czech',
            //         value: '4'
            //     },
            //     {
            //         country: 'Ukraine',
            //         value: '5'
            //     },
            // ],
            routes:
                {
                    id: null,
                    carrier: null,
                    departure: null,
                    departure_city: 'Москва',
                    destination: null,
                    destination_city: '',
                    time: null,
                    price: null,
                }
        }
    },
    methods: {
        GetRoutes() {
            // console.log(this.options[0].country);
            // console.log(this.destination_city);
            // ref(this.options[0].country)
            // this.$router.push(`/air_routes/${this.routes.id}`);
            // /air_routes/{id}
            // ${this.routes.id}
            this.$router.push(`/air_routes/${this.routes.departure_city}`);
            // api.get(`/api/air_routes/${this.routes.departure_city}`,
            // ).then(res => {
            //         this.routes = res.data;
            //         console.log(res.data);
            //
            //     })
        }
    }
}
</script>

<style lang="scss">
.news {
    //min-height: 1200px;
    margin-top: 400px;

    &__items {
        display: grid;
        grid-template-columns: 1fr 1fr;
        justify-content: space-evenly;
        margin: 0 auto;
        max-width: 1200px;
    }

    &__item {
        //display: flex;
        //justify-content: space-between;
        //box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
        margin: 50px;
        background-color: #f3f3f3;

        & img {
            max-width: 500px;
        }

        &-text {
            padding: 35px 30px 10px 30px;
            font-size: 18px;
            max-width: 500px;

            & h1 {
                font-size: 24px;
            }
        }

        &-link {
            width: 24px;
            height: auto;
            margin: 20px auto 0 auto;
            transform: rotate(180deg);
        }
    }
}

.main {
    color: white;
    margin-top: 100px;
    min-height: 500px;

    &__inner {
        display: flex;
        justify-content: space-around;
    }

    &__info {
        width: 700px;
        margin-top: 25px;
        font-size: 18px;
    }

    &__btn {
        width: 200px;
        height: 50px;
        margin-top: 25px;
        border: 1px solid #ffffff;
    }

    &__btn:hover {
        background-color: #fff;

        a {
            color: black;
        }
    }

    &__btn a {
        display: inline-block;
        width: 200px;
        height: 50px;
        color: white;
        text-align: center;
        line-height: 50px;
        text-decoration: none;
        font-size: 18px;
    }

    &__form {
        width: 500px;
        height: 400px;
        background-color: #3499DD;
        border-radius: 10px;
        padding: 30px 30px;
    }

    &__search-form {
        display: flex;
        justify-content: space-around;
    }
}

.btn-submit {
    cursor: pointer;
    background-color: #F7B903;
    color: #ffffff;
    width: 180px;
    height: 40px;
    margin-bottom: 20px;
    border-radius: 5px;
    padding: 11px;
    text-align: center;
    font-size: 16px;
    & a{
        text-decoration: none;
        color: #fff;
    }
    &:hover {
        background-color: #b98a00;
    }
}

.block {
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-gap: 10px;
    grid-column-gap: 40px;
}

.block label {
    margin-bottom: 10px;
}

.grid-block {
    grid-column-start: 2;
}

.main__search-form input,
label {
    display: block;
}

.main__search-form input, .main__search-form select {
    width: 180px;
    height: 40px;
    margin-bottom: 20px;
    border-radius: 5px;
    outline: none;
    border: none;
    padding: 5px;
    font-size: 16px;
}

//.btn-submit {
//    background-color: #F7B903;
//    color: #ffffff;
//}

//.page {
//    background: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0)), url(../images/bg-80-min.jpg) top center no-repeat;
//    background-size: contain;
//    padding-top: 50px;
//}

@keyframes myFade {
    0% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}

.myFade {
    animation: myFade 2s;
}

#loadingBlock {
    position: fixed;
    z-index: 9999;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: #fff;
    display: flex;
    justify-content: center;
    align-items: center;
}

#loadingBlock img {
    animation: 2s loading-part-2 linear infinite;
}

@keyframes loading-part-1 {
    0% {
        opacity: 0;
    }
    10% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}

@keyframes loading-part-2 {
    0% {
        z-index: 9999;
        transform: rotate(0deg);
    }
    50% {
        transform: rotate(180deg);
        z-index: 9999;
    }
    100% {
        transform: rotate(360deg);
        z-index: 9999;
    }
}
</style>
