<template>
    <div class="cabinet-info">
        <div class="cabinet-info-flex">
            <div class="cabinet-info__main">
                <div class="cabinet-info__main-title">Основная информация</div>
                <div class="cabinet-info__main-info">
                    <div class="cabinet-info__main-info-item">
                        <label for="name">Имя</label>
                        <input type="text" id="name" placeholder="Имя" v-model="firstname">
                    </div>
                    <div class="cabinet-info__main-info-item">
                        <label for="lastname">Фамилия</label>
                        <input type="text" id="lastname" placeholder="Фамилия" v-model="lastname">
                    </div>
                    <div class="cabinet-info__main-info-item">
                        <label for="email">E-mail</label>
                        <input :class="{'incorrect': email === ''}" type="email" id="email" placeholder="email"
                               v-model="email">
                    </div>
                    <div class="cabinet-info__main-info-item">
                        <label for="phone">Телефон</label>
                        <input :class="{'incorrect': phone_number === ''}" v-mask="'+7 (###) ###-##-##'" type="text"
                               id="phone" placeholder="не указано" v-model="phone_number">
                    </div>
                </div>
            </div>
            <div class="cabinet-info__legal">
                <div class="cabinet-info__main-title">Юридическая информация</div>
                <div class="cabinet-info__main-info">
                    <div class="cabinet-info__main-info-item">
                        <label for="passport">Паспорт</label>
                        <div class="passport-input">
                            <input class="passport-input-series" :class="{'incorrect': passport_series === ''}"
                                   v-mask="'####'" type="text" id="passport" placeholder="Серия"
                                   v-model="passport_series">
                            <input class="passport-input-number" :class="{'incorrect': passport_number === ''}"
                                   v-mask="'######'" type="text" placeholder="Номер"
                                   v-model="passport_number">
                        </div>
                    </div>
                    <div class="cabinet-info__main-info-item">
                        <label for="INN">ИНН</label>
                        <input :class="{'incorrect': inn === ''}" v-mask="'############'" type="text" id="INN"
                               placeholder="не указано" v-model="inn">
                    </div>
                    <div class="cabinet-info__main-info-item">
                        <label for="mail-index">Почтовый индекс</label>
                        <input :class="{'incorrect': mail_index === ''}" v-mask="'######'" type="text" id="mail-index"
                               placeholder="не указано" v-model="mail_index">
                    </div>
                    <div class="cabinet-info__main-info-item">
                        <label for="address">Адрес</label>
                        <input :class="{'incorrect': address === ''}" type="text" id="address" placeholder="не указано"
                               v-model="address">
                    </div>
                </div>
            </div>
        </div>
        <div class="gray-line"></div>
        <div class="cabinet-info__main-title">Забронированные рейсы:</div>
        <div class="bookings__items">
            <template v-if="bookings">
                <div class="bookings__item" v-for="booking in bookings" :key="booking.id">
                    <h6 class="bookings__vendor-code">рейс #{{ booking.id }}</h6>
                    <div class="bookings__item-up">
                        <div class="bookings__air-company-name"><strong>Перевозчик</strong></div>
                        <div class="bookings__air-company-depart"><strong>Вылет</strong></div>
                        <div class="bookings__air-company-time">
                            <strong><p>Время&nbsp;в&nbsp;пути</p></strong>
                        </div>
                        <div class="bookings__air-company-return"><strong>Прилет</strong></div>
                    </div>
                    <div class="gray-line"></div>
                    <div class="bookings__item-down">
                        <div class="bookings__air-company-name">{{ booking.carrier }}</div>
                        <div class="bookings__air-company-depart">
                            {{ booking.departure }}<br>
                            {{ booking.departure_city }}
                        </div>
                        <div class="bookings__air-company-time">
                            <p>{{ booking.time }}</p>
                            <img src="../../images/arrow-2.svg" alt="">
                        </div>
                        <div class="bookings__air-company-return">
                            {{ booking.destination }}<br>
                            {{ booking.destination_city }}
                        </div>
                    </div>
                    <div class="cabinet-info__buttons">
                        <button @click="DeleteBooking(booking.id)"
                                class="bookings__item-select" style="background-color: #6C757D;">
                            Отменить
                        </button>
                        <button class="bookings__item-select" style="background-color:#97CA2B;">
                            Оплатить
                        </button>
                        <div class="booking__price" >{{ booking.price }}
<!--                            <template v-for="(people, index) in peoples" :key="people.id">-->
<!--                            </template>-->
                            руб.</div>
                    </div>

                </div>
            </template>
        </div>

        <div class="cabinet-info__buttons">
            <div class="cabinet-info__btn btn-disable" @click.prevent="Logout">Выйти из аккаунта</div>
            <div class="cabinet-info__btn btn-submit" @click.prevent="UpdatePersonInfo">Сохранить обновленные данные
            </div>
        </div>
        <div style="height: 10px">
            <div class="d-none" :class="{'update-success': isSuccess === true}">Данные успешно обновлены!</div>
            <div class="d-none" :class="{'update-failure': isFailure === true}">Что-то пошло не так!</div>
        </div>
    </div>
</template>

<script>
import api from "../api";
import router from "../router";
import validateMixin from "../mixins/validateMixin";
import bookingRequestMixin from "../mixins/bookingRequestMixin";
import personalInfoMixin from "../mixins/personalInfoMixin";

export default {
    name: "CabinetInfo",
    mixins: [validateMixin, bookingRequestMixin, personalInfoMixin],
    data() {
        return {
            bookings: {
                id: '',
                carrier: '',
                departure: '',
                departure_date: '',
                departure_city: '',
                destination: '',
                arrival_date: '',
                destination_city: '',
                amount_people: '',
                status_of_places: '',
                time: '',
                price: '',
            },
            // peoples: {
            //     amount_people: null,
            // },
        }
    },
    async mounted() {
        await this.PersonalInfo();
        await this.BookingInfo();
        // await this.GetAmountPeople();
    },
    methods: {
        // GetAmountPeople(){
        //     api.get('/api/booking', {
        //         params: {
        //             user_id: this.user_id,
        //         }
        //     }).then(res => {
        //         this.peoples = res.data;
        //         for(let i = 0; i < res.data.length; i++){
        //             this.peoples.push(this.peoples[i].amount_people);
        //         }
        //         console.log(this.peoples);
        //
        //
        //
        //         // for(let i = 0; i < res.data.length; i++){
        //         //     this.people.amount_people = res.data[i].amount_people;
        //         //     // console.log(this.bookings.people);
        //         // }
        //         // this.amount_people = res.data;
        //     })
        // },

        Logout() {
            api.post('/api/auth/logout')
                .then(res => {
                        localStorage.removeItem('access_token');
                        router.push({name: 'home.auth'});
                    }
                )
        },
    }
}
</script>

<style lang="scss" scoped>
.cabinet-info {
    max-width: 990px;
    margin: 100px auto;

    &-flex {
        display: flex;
        justify-content: space-between;
        //margin-top: 90px;
    }

    &__main {
        width: 370px;

        &-title {
            font-size: 24px;

        }

        &-info {


            &-item {
                display: flex;
                justify-content: space-between;
                margin-top: 30px;
                align-items: center;

                & > .passport-input {
                    max-width: 270px;
                    display: flex;
                    justify-content: space-between;
                }

                & input {
                    width: 270px;
                    height: 30px;
                    border: 1px solid #ddd;
                    border-radius: 3px;
                    padding-left: 5px;
                    outline: none;
                }

                & input:focus {
                    background-color: #efefef;
                }

                & label {
                    margin-right: 10px;
                }
            }
        }
    }

    &__legal {
        max-width: 430px;
    }

    &__buttons {
        display: flex;
        justify-content: space-between;
    }

    &__btn {
        width: 335px;
        height: 45px;
        border-radius: 5px;
        padding-top: 11px;
        margin-top: 20px;
        border: none;
        outline: none;
        text-align: center;
        float: right;
        z-index: 1;
    }
}

.bookings {
    &__items {
        text-align: center;
        max-width: 800px;
        margin: 0 auto;
    }

    &__vendor-code {
        position: absolute;
        top: 10px;
        left: 15px;
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
            border-radius: 5px;
            padding: 10px;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);
            outline: none;
        }
    }

    &__item {
        background-color: rgba(0, 0, 100, 0.05);
        border: 1px solid rgba(0,0,0,0.25);
        position: relative;
        padding: 50px;
        height: 280px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        margin: 20px auto;

        &-title {
            padding: 10px;
            font-size: 24px;
        }

        & > div {
            align-items: center;
            justify-content: flex-end;

            & > button {
                width: 180px;
                height: 40px;
                color: #fff;
                margin: 20px auto;
                //background-color: #F7B903;
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
    }

    &__price {
        font-weight: bold;
    }
}

.btn-disable {
    border: 1px solid #6c757d;
    color: #6c757d;
    cursor: pointer;
}

.btn-disable:hover {
    background-color: #5b6166;
    color: #fff;
}

.passport-input {
    &-series {
        width: 40% !important;
        outline: none;
    }

    &-number {
        width: 55% !important;
        outline: none;
    }
}

.update-success, .update-failure {
    animation: update-anim 3s forwards;
    text-align: center;
    width: 335px;
    float: right;
    margin-top: -10px;
    padding: 5px;
    color: black;
    font-size: 16px;
    display: block !important;
    z-index: 0;
}

@keyframes update-anim {
    0% {
        transform: translateY(-30px);
        opacity: 0;
    }
    15% {
        transform: translateY(-10px);
        opacity: 1;
    }
    80% {
        transform: translateY(-10px);
        opacity: 1;
    }
    90% {
        transform: translateY(-10px);
        opacity: 0.1;
    }
    95% {
        transform: translateY(-10px);
        opacity: 0;
    }
    100% {
        transform: translateY(-10px);
        opacity: 0;
    }
}

.incorrect {
    border-color: red;
}

.gray-line {
    max-width: 990px;
    margin: 30px auto;
}
</style>
