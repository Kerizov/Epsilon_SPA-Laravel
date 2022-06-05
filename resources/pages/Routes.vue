<template>
    <HeaderOther>
        <template v-slot:subtitle>Поиск по маршрутам</template>
        <template v-slot:title>Рейсы</template>
        <template v-slot:path>Рейсы</template>
    </HeaderOther>
    <div class="routes">
        <div class="container">
            <div class="routes__inner">
                <div class="routes__title">{{ $store.state.values.departure_city }} -
                    {{ this.$store.state.values.destination_city }}
                </div>
                <div class="orange-line"></div>
                <div class="routes__text">{{ this.$store.state.values.amount_people }} Взрослых,
                    {{ this.$store.state.values.status_of_places }}
                </div>
                <form class="routes__form" action="">
                    <div class="block">
                        <label for="depart">Вылет</label>
                        <input type="date" id="depart" @change="GetRoutes" v-model="departure_date">
                    </div>
                    <div class="block">
                        <label for="return">Прилет</label>
                        <input type="date" id="return" @change="GetRoutes" v-model="arrival_date">
                    </div>
                    <div class="block">
                        <label for="sort">Сортировка</label>
                        <select v-model="selectedSort" name="" id="sort">
                            <option value="price">от дешевых к дорогим</option>
                            <option value="carrier">по авиакомпании</option>
                            <option value="id" selected>по популярности</option>
                        </select>
                    </div>
                </form>
                <div class="routes__items" v-if="RoutesIsExists">
                    <template v-if="routes">
                        <div class="routes__item"
                             v-for="route in sortedPosts" :key="route.id">
                            <h6 class="routes__vendor-code">рейс #{{ route.id }}</h6>
                            <div class="routes__item-up">
                                <div class="routes__air-company-name"><strong>Перевозчик</strong></div>
                                <div class="routes__air-company-depart"><strong>Вылет</strong></div>
                                <div class="routes__air-company-time">
                                    <strong><p>Время&nbsp;в&nbsp;пути</p></strong>
                                </div>
                                <div class="routes__air-company-return"><strong>Прилет</strong></div>
                            </div>
                            <div class="gray-line"></div>
                            <div class="routes__item-down">
                                <div class="routes__air-company-name">{{ route.carrier }}</div>
                                <div class="routes__air-company-depart">
                                    {{ route.departure }}<br>
                                    {{ route.departure_city }}
                                </div>
                                <div class="routes__air-company-time">
                                    <p>{{ route.time }}</p>
                                    <img src="../images/arrow-2.svg" alt="">
                                </div>
                                <div class="routes__air-company-return">
                                    {{ route.destination }}<br>
                                    {{ route.destination_city }}
                                </div>
                            </div>
                            <div class="routes__price">
                                {{ +route.price.split(' ').join('') * this.$store.state.values.amount_people }} руб.
                            </div>
                            <div class="modal-wrapper" v-if="isModalVisible">
                                <div class="modal-window">
                                    <p>Вы хотите забронировать этот рейс?</p>
                                    <button @click="Booking(currentRouteId)" class="modal__button">Да</button>
                                    <button @click="isModalVisible = !isModalVisible" class="modal__button">Нет
                                    </button>
                                </div>
                                <div class="overlay" @click="isModalVisible = !isModalVisible"></div>
                            </div>
                            <button @click="currentRouteId = route.id; isModalVisible = !isModalVisible"
                                    class="routes__item-select">Выбрать
                            </button>
                        </div>
                    </template>
                </div>
                <div class="routes_ist_exists" v-else>
                    <h1>К сожалению</h1>
                    <h1>по вашему запросу нет результатов!</h1>
                    <h1>:(</h1>
                </div>
            </div>
        </div>
    </div>
    <Footer></Footer>
</template>

<script>
import HeaderOther from "../js/components/HeaderOther";
import Footer from "../js/components/Footer";
import api from "../js/api";
import {mapState} from "vuex";

export default {
    name: "Routes",
    components: {
        Footer,
        HeaderOther
    },
    data() {
        return {
            RoutesIsExists: true,
            isModalVisible: false,
            user_id: null,
            currentRouteId: null,
            selectedSort: 'id',
            routes: [{
                id: '',
                carrier: '',
                departure: '',
                departure_date: this.$store.state.values.departure_date,
                departure_city: this.$store.state.values.departure_city,
                destination: '',
                arrival_date: this.$store.state.values.arrival_date,
                destination_city: this.$store.state.values.destination_city,
                amount_people: this.$store.state.values.amount_people,
                status_of_places: this.$store.state.values.status_of_places,
                time: '',
                price: '',
            }]
        }
    },
    computed: {
        ...mapState(["values"]),
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
        sortedPosts() {
            return [...this.routes].sort((a, b) => (a[this.selectedSort] > b[this.selectedSort]) ? 1 : -1);
        },
    },
    mounted() {
        this.GetRoutes();
        this.userId();
    },
    methods: {
        GetRoutes() {
            api.get(`/api/air_routes`, {
                params: {
                    departure_date: this.$store.state.values.departure_date,
                    departure_city: this.$store.state.values.departure_city,
                    arrival_date: this.$store.state.values.arrival_date,
                    destination_city: this.$store.state.values.destination_city,
                    amount_people: this.$store.state.values.amount_people,
                    status_of_places: this.$store.state.values.status_of_places,
                }
            })
                .then(res => {
                    (res.data.length === 0) ? this.RoutesIsExists = false : this.RoutesIsExists = true
                    this.routes = res.data;
                })
        },
        Booking(route_id) {
            api.post('/api/booking/create', {
                user_id: this.user_id,
                air_route_id: route_id,
                confirm: true,
                amount_people: this.$store.state.values.amount_people,
            })
                .then(res => {
                    this.isModalVisible = !this.isModalVisible
                    this.$router.push('/cabinet');
                })
        },
        userId() {
            api.post('/api/auth/me')
                .then(res => {
                    this.user_id = res.data.id;
                });
        },
    }
}
</script>

<style lang="scss" scoped>
.routes {
    text-align: center;
    max-width: 800px;
    margin: 0 auto;

    &__vendor-code {
        position: absolute;
        top: 10px;
        left: 15px;
    }

    &_ist_exists {
        height: 300px;
        padding-top: 75px;
    }

    &__item-up, &__item-down {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr 1fr;
        text-align: center;
        align-items: center;
        margin-bottom: 20px;
    }

    &__title {
        font-weight: bold;
        padding-top: 20px;
        font-size: 48px;
    }

    & > .container > .routes__inner > .orange-line {
        margin: 20px auto;
    }

    &__text {
        color: rgba(0, 0, 0, 0.5);
        font-size: 18px;
    }

    &__form {
        display: flex;
        justify-content: center;
        align-items: center;

        & > .block + .block {
            margin-left: 50px;
        }

        & input, select {
            width: 200px;
            height: 40px;
            border: 1px solid transparent;
            background-color: #FFF;
            border-radius: 5px;
            padding: 5px;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);
            outline: none;
        }
    }

    &__item {
        background-color: rgba(0, 0, 100, 0.05);
        border: 1px solid rgba(0, 0, 0, 0.25);
        position: relative;
        padding: 50px 50px 5px 50px;
        height: auto;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        margin: 20px auto;

        &-title {
            padding: 10px;
            font-size: 24px;
        }

        & > button {
            width: 180px;
            height: 40px;
            color: #fff;
            margin: 20px;
            background-color: #F7B903;
            border-radius: 5px;
            outline: none;
            border: none;
            padding: 5px;
            font-size: 16px;
        }

        & > button:hover {
            background-color: #b98a00;
        }
    }

    &__price {
        font-weight: bold;
    }
}

.modal {
    &-wrapper {
        position: fixed;
        display: flex;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        justify-content: center;
        align-items: center;
        background: rgba(0, 0, 0, .2);
        z-index: 100;
    }

    &-window {
        max-width: 500px;
        margin: 15px;
        min-height: 180px;
        padding: 50px 15px;
        background-color: #fff;
        z-index: 2;

        & > p {
            font-size: 18px;
        }
    }

    &__button {
        width: 150px;
        height: 40px;
        margin: 25px 20px;
        outline: none;
        border: none;
        border-radius: 5px;
        color: #fff;
        background-color: #F7B903;
    }
}

.overlay {
    position: absolute;
    width: 100%;
    height: 100%;
    z-index: 1;
}

.block {
    display: block;
    grid-template-columns: 1fr 1fr;
    grid-gap: 10px;
}
</style>

