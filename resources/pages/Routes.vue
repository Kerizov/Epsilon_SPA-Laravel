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
                <div class="routes__text">{{ this.$store.state.values.amount_people }} Взрослых, {{ this.$store.state.values.status_of_places }}</div>
                <form class="routes__form" action="">
                    <div class="block">
                        <label for="depart">Вылет</label>
                        <input type="datetime-local" id="depart">
                    </div>
                    <div class="block">
                        <label for="return">Прилет</label>
                        <input type="datetime-local" id="return">
                    </div>
                    <div class="block">
                        <label for="sort">Сортировка</label>
                        <select name="" id="sort">
                            <option value="">от дешевых к дорогим</option>
                            <option value="">по рейтингу</option>
                            <option value="" selected>по популярности</option>
                        </select>
                    </div>
                </form>
                <div class="routes__items" v-if="RoutesIsExists">
                    <template v-if="routes">
                        <div class="routes__item" v-for="route in routes">
                            <div class="routes__item-up">
                                <div class="routes__air-company-name"><strong>Перевозчик</strong></div>
                                <div class="routes__air-company-depart"><strong>Вылет</strong></div>
                                <div class="routes__air-company-time">
                                    <strong><p>Время в пути</p></strong>
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
                            <div class="routes__price">{{ route.price }} руб.</div>
                            <button class="routes__item-select">Выбрать</button>
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

export default {
    name: "Routes",
    components: {
        Footer,
        HeaderOther
    },
    data() {
        return {
            RoutesIsExists: true,
            routes: {
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
            }
        }
    },
    mounted() {
        this.GetRoutes();
    },
    methods: {
        GetRoutes() {
            api.get(`/api/air_routes`, {
                params: {
                    departure_city: this.routes.departure_city,
                    destination_city: this.routes.destination_city,
                    departure_date: this.routes.departure_date,
                    arrival_date: this.routes.arrival_date,
                    status_of_places: this.routes.status_of_places,
                    amount_people: this.routes.amount_people,
                }})
                .then(res => {
                    (res.data.length === 0) ? this.RoutesIsExists = false : this.RoutesIsExists = true
                    this.routes = res.data;
                })
        }
    }
}
</script>

<style lang="scss" scoped>
.routes {
    text-align: center;
    max-width: 800px;
    margin: 0 auto;

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
            width: 200px; /*180px*/
            height: 40px;
            border: 1px solid transparent;
            border-radius: 5px;
            padding: 10px;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);
            outline: none;


        }
    }

    &__item {
        padding: 50px;
        height: 250px;
        background-color: #fff;
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

.block {
    display: block;
    grid-template-columns: 1fr 1fr;
    grid-gap: 10px;
}
</style>
