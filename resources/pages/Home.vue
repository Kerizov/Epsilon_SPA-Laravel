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
                                    <select name="" v-model="departure_city" id="from">
                                        <option v-for="city in cities" :value="city.city_name">
                                            {{ city.city_name }}
                                        </option>
                                    </select>
                                </div>
                                <div>
                                    <label for="to">Куда</label>
                                    <select name="" v-model="destination_city" id="to">
                                        <option v-for="city in cities" :value="city.city_name">
                                            {{ city.city_name }}
                                        </option>
                                    </select>
                                </div>
                                <div>
                                    <label for="depart">Вылет</label>
                                    <input type="date" v-model="departure_date" id="depart">
                                </div>
                                <div>
                                    <label for="return">Прилет</label>
                                    <input type="date" v-model="arrival_date" id="return">
                                </div>
                                <div>
                                    <label for="class">Выберите класс</label>
                                    <select v-model="status_of_places" id="class">
                                        <option v-for="status in statuses" :value="status.status_name">
                                            {{ status.status_name }}
                                        </option>
                                    </select>
                                </div>
                                <div>
                                    <label for="passenger">Кол-во пассажиров</label>
                                    <input type="number" v-model="amount_people" id="passenger" min="1" max="10">
                                </div>
                                <div class="grid-block">
                                    <div class="btn-submit" @click="GetRoutes">
                                        <p>Поиск</p>
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
import {mapState} from "vuex";
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
            cities: {
                city_name: '',
            },
            statuses: {
                status_name: '',
            },
        }
    },
    computed: {
        ...mapState(["values"]),
        departure_city: {
            set(departure_city) {
                this.$store.commit("setValues", {departure_city});
            },
            get() {
                return this.values.departure_city;
            }
        },
        destination_city: {
            set(destination_city) {
                this.$store.commit("setValues", {destination_city});
            },
            get() {
                return this.values.destination_city;
            }
        },
        arrival_date: {
            set(arrival_date) {
                this.$store.commit("setValues", {arrival_date});
            },
            get() {
                return this.values.arrival_date;
            }
        },
        departure_date: {
            set(departure_date) {
                this.$store.commit("setValues", {departure_date});
            },
            get() {
                return this.values.departure_date;
            }
        },
        status_of_places: {
            set(status_of_places) {
                this.$store.commit("setValues", {status_of_places});
            },
            get() {
                return this.values.status_of_places;
            }
        },
        amount_people: {
            set(amount_people) {
                this.$store.commit("setValues", {amount_people});
            },
            get() {
                return this.values.amount_people;
            }
        },
    },
    mounted() {
        this.GetCities();
        this.GetStatuses();
    },
    methods: {
        GetCities() {
            api.get('/api/city')
                .then(res => {
                    this.cities = res.data;
                })
        },
        GetStatuses() {
            api.get('/api/status')
                .then(res => {
                    this.statuses = res.data;
                })
        },
        GetRoutes() {
            this.$router.push(`/air_routes`);
        },
    }
}
</script>

<style lang="scss">
.news {
    margin-top: 400px;

    &__items {
        display: grid;
        grid-template-columns: 1fr 1fr;
        justify-content: space-evenly;
        margin: 0 auto;
        max-width: 1200px;
    }

    &__item {
        margin: 50px;

        & img {
            max-width: 500px;
        }

        &-text {
            padding: 35px 30px 10px 30px;
            background-color: #fff;
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
    height: 40px;
    margin-bottom: 20px;
    border-radius: 5px;
    padding: 11px;
    text-align: center;
    font-size: 16px;

    & a {
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
    background-color: #FFF;
    outline: none;
    border: none;
    padding: 5px;
    font-size: 16px;
}

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
