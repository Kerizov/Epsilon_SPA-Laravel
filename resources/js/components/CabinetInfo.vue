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
                        <input type="text" id="email" placeholder="email" v-model="email">
                    </div>
                    <div class="cabinet-info__main-info-item">
                        <label for="phone">Телефон</label>
                        <input type="text" id="phone" placeholder="не указано" v-model="phone_number">
                    </div>
                </div>
            </div>
            <div class="cabinet-info__legal">
                <div class="cabinet-info__main-title">Юридическая информация</div>
                <div class="cabinet-info__main-info">
                    <div class="cabinet-info__main-info-item">
                        <label for="passport">Паспорт</label>
                        <div>
                            <input class="passport-input-series" type="text" id="passport" placeholder="Серия"
                                   v-model="passport_series">
                            <input class="passport-input-number" type="text" placeholder="Номер"
                                   v-model="passport_number">
                        </div>
                    </div>
                    <div class="cabinet-info__main-info-item">
                        <label for="INN">ИНН</label>
                        <input type="text" id="INN" placeholder="не указано" v-model="inn">
                    </div>
                    <div class="cabinet-info__main-info-item">
                        <label for="mail-index">Почтовый индекс</label>
                        <input type="text" id="mail-index" placeholder="не указано" v-model="mail_index">
                    </div>
                    <div class="cabinet-info__main-info-item">
                        <label for="address">Адрес</label>
                        <input type="text" id="address" placeholder="не указано" v-model="address">
                    </div>
                </div>
            </div>
        </div>
        <div class="gray-line"></div>
        <div class="d-flex justify-content-between">
            <div class="cabinet-info__btn btn-submit" @click.prevent="Logout">Выйти из аккаунта</div>
            <div class="cabinet-info__btn btn-submit" @click.prevent="UpdatePersonInfo">Сохранить обновленные данные
            </div>
        </div>
        <div class="d-none" :class="{'update-success': isSuccess === true}">Данные успешно обновлены!</div>
        <div class="d-none" :class="{'update-failure': isFailure === true}">Что-то пошло не так!</div>
    </div>
</template>

<script>
import api from "../api";
import router from "../router";

export default {
    name: "CabinetInfo",
    data() {
        return {
            firstname: null,
            lastname: null,
            email: null,
            phone_number: null,
            passport_series: null,
            passport_number: null,
            inn: null,
            mail_index: null,
            address: null,
            isSuccess: false,
            isFailure: false,
        }
    },
    mounted() {
        this.PersonalInfo();
    },
    methods: {
        PersonalInfo() {
            api.post('/api/auth/me')
                .then(res => {
                    this.firstname = res.data.firstname;
                    this.lastname = res.data.lastname;
                    this.email = res.data.email;
                    this.phone_number = res.data.phone_number;
                    this.passport_series = res.data.passport_series;
                    this.passport_number = res.data.passport_number;
                    this.inn = res.data.inn;
                    this.mail_index = res.data.mail_index;
                    this.address = res.data.address;
                });
        },
        Logout() {
            api.post('/api/auth/logout')
                .then(res => {
                        localStorage.removeItem('access_token');
                        router.push({name: 'home.auth'});
                    }
                )
        },
        UpdatePersonInfo() {
            api.post('api/users/update', {
                firstname: this.firstname,
                lastname: this.lastname,
                email: this.email,
                phone_number: this.phone_number,
                passport_series: this.passport_series,
                passport_number: this.passport_number,
                inn: this.inn,
                mail_index: this.mail_index,
                address: this.address,
            })
                .then(() => {
                    this.isSuccess = true;
                    setTimeout(() => this.isSuccess = false, 3000);
                    console.log('updated');
                })
        }
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
        margin-top: 90px;
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

                & div {
                    width: 270px;
                    display: flex;
                    justify-content: space-between;
                }

                & input {
                    width: 270px;
                    height: 30px;
                    padding-left: 5px;
                    outline: none;
                }
            }
        }
    }

    &__legal {
        width: 430px;
    }

    &__btn {
        width: 335px;
        height: 45px;
        border-radius: 5px;
        padding-top: 11px;
        border: none;
        outline: none;
        text-align: center;
        float: right;
        z-index: 1;
    }
}

.passport-input {
    &-series {
        width: 100px !important;
        outline: none;
    }

    &-number {
        width: 145px !important;
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
        margin-top: -50px;
        opacity: 0;
    }
    15% {
        margin-top: -10px;
        opacity: 1;
    }
    80% {
        margin-top: -10px;
        opacity: 1;
    }
    90% {
        margin-top: -10px;
        opacity: 0.1;
    }
    95% {
        margin-top: -10px;
        opacity: 0;
    }
    100% {
        margin-top: -10px;
        opacity: 0;
    }
}

.gray-line {
    max-width: 990px;
    margin: 30px auto;
}
</style>
