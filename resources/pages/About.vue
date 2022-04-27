<template>
    <HeaderOther>
        <template v-slot:subtitle>О нас</template>
        <template v-slot:title>Обзор</template>
        <template v-slot:path>Обзор</template>
    </HeaderOther>
    <section class="about-us">
        <div class="container">
            <div class="about-us__preface">
                <div class="about-us__preface-title">Пару слов о нас</div>
                <div class="orange-line"></div>
                <div class="about-us__preface-text">
                    Epsilon - это первая в мире вдохновляющая служба поиска путешественников, которая фокусируется
                    на самом важном: ваших интересах и вашем бюджете!
                    <br>
                    <p>
                        Насколько практично провести выходные для катания на лыжах, если вы действительно ждете отдыха
                        на
                        песчаном пляже? Насколько хорошим может быть отличное место, если добираться туда слишком
                        дорого?
                        Epsilon предлагает инновационный и полезный онлайн-опыт, поэтому вы можете найти идеальное
                        место назначения всего за пару кликов!
                    </p>
                </div>
            </div>
        </div>
        <div class="about-us__quote">
            <p><img src="../images/quote.svg" alt="">
                Epsilon
                был разработан, чтобы помочь людям открывать новые места, знакомиться с новыми людьми и
                просто получать удовольствие от путешествий. Наша система бронирования помогает современным
                путешественникам легко бронировать новые билеты без лишних очередей и ожидания. Вам просто нужно сделать
                пару кликов, и все готово!<br>___<br>
                <b>Джон Смит, основатель</b>
            </p>
        </div>
        <div class="container">
            <div class="about-us__benefits">
                <div class="about-us__benefits-title">Наши преимущества</div>
                <div class="orange-line"></div>
                <div class="about-us__benefits-items">
                    <div class="about-us__benefits-item">
                        <div class="about-us__benefits-image"><img src="../images/airplane.svg" alt=""></div>

                        <p class="about-us__benefits-item-title">Самые надежные авиалинии</p>
                        <div class="green-line"></div>
                        <p class="about-us__benefits-item-text">Мы сотрудничаем только с самыми надежными
                            авиакомпаниями, имеющими безупречную репутацию.</p>
                    </div>
                    <div class="about-us__benefits-item">
                        <div class="about-us__benefits-image"><img src="../images/search.svg" alt=""></div>

                        <p class="about-us__benefits-item-title">Удобная поисковая система</p>
                        <div class="green-line"></div>
                        <p class="about-us__benefits-item-text"> Удобный и быстрый поиск авиабилетов, отелей и
                            автомобилей.</p>
                    </div>
                    <div class="about-us__benefits-item">
                        <div class="about-us__benefits-image"><img src="../images/time.svg" alt=""></div>

                        <p class="about-us__benefits-item-title">Быстрое и надежное бронирование билетов</p>
                        <div class="green-line"></div>
                        <p class="about-us__benefits-item-text">Мы предоставляем надежную систему бронирования билетов,
                            которая также идеально подходит для начинающих путешественников.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <Footer></Footer>
</template>

<script>
import HeaderOther from "../js/components/HeaderOther";
import Footer from "../js/components/Footer";

export default {
    name: "About",
    components: {
        HeaderOther,
        Footer
    }
}
</script>

<style lang="scss">
.about-us {
    &__preface {
        text-align: center;
        max-width: 800px;
        margin: 0 auto;

        &-title {
            font-weight: bold;
            padding-top: 20px;
            font-size: 48px;
        }

        &-text {
            font-size: 24px;

            & p {
                font-size: 20px;
                color: rgba(0, 0, 0, 0.5);
            }
        }

        & > .orange-line {
            margin: 20px auto;
        }
    }

    &__quote {
        font-style: italic;
        color: #ffffff;
        width: 100%;
        min-height: 250px;
        background-color: #3499DD;
        margin: 20px auto;

        & p {
            max-width: 1200px;
            text-align: center;
            margin: 0 auto;
            padding: 60px;
        }
    }

    &__benefits {
        text-align: center;
        margin-bottom: 50px;

        & > .orange-line, .green-line {
            margin: 0 auto;
        }

        &-item img {
            width: 50px;
            height: 50px;
            transform: translate(3%, 30%);
        }

        &-item-title {
            font-weight: bold;
            font-size: 24px;
            padding: 20px;
        }

        &-item-text {
            color: rgba(0, 0, 0, 0.5);
            font-size: 18px;
            padding: 20px;
        }

        &-image {
            width: 80px;
            height: 80px;
            margin: 20px auto;
            border-radius: 50px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
        }

        &-title {
            font-weight: bold;
            padding: 20px;
            font-size: 48px;
        }
    }
}
</style>
