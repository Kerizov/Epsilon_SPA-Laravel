<template>
    <HeaderOther>
        <template v-slot:subtitle>Контакт или связь с нами</template>
        <template v-slot:title>Контакты</template>
        <template v-slot:path>Контакты</template>
    </HeaderOther>
    <div class="contacts">
        <div class="container">
            <div class="contacts__inner">
                <div class="contacts__form-title">Связь с нами</div>
                <div class="orange-line"></div>
                <div class="contacts__form-text">Вы можете связаться с нами любым удобным для вас способом. Мы доступны
                    24/7
                    по факсу или электронной почте. Вы также можете воспользоваться контактной формой ниже или посетить
                    наш
                    офис лично. Будем рады ответить на ваши вопросы.
                </div>
                <form class="contacts__form" action="" method="post">
                    <div>
                        <label for="name"></label>
                        <input type="text" id="name" placeholder="Имя" required>
                    </div>
                    <div>
                        <label for="lastname"></label>
                        <input type="text" id="lastname" placeholder="Фамилия">
                    </div>
                    <div>
                        <label for="email"></label>
                        <input type="email" id="email" placeholder="E-mail">
                    </div>
                    <div>
                        <label for="phone"></label>
                        <input type="tel" id="phone" placeholder="Телефон" required>
                    </div>
                    <div class="textarea">
                        <label for="message"></label>
                        <textarea name="" id="message" cols="40" rows="5" placeholder="Комментарий"></textarea>
                    </div>
                    <div class="btn">
                        <input type="submit">
                    </div>
                </form>
                <div class="contacts__info">
                    <div class="contacts__info-item">
                        <h3 class="contacts__info-title">Телефоны</h3>
                        <div class="gray-line"></div>
                        <p class="contacts__info-text">
                            8 (800) 555-35-35 <br>
                            8 (800) 555-35-35
                        </p>
                    </div>
                    <div class="contacts__info-item">
                        <h3 class="contacts__info-title">E-mail</h3>
                        <div class="gray-line"></div>
                        <p class="contacts__info-text">
                            epsilon@gmail.com
                        </p>
                    </div>
                    <div class="contacts__info-item">
                        <h3 class="contacts__info-title">Адрес</h3>
                        <div class="gray-line"></div>
                        <p class="contacts__info-text">
                            Протопоповский пер., 9, Москва, 129090
                        </p>
                    </div>
                    <div class="contacts__info-item">
                        <h3 class="contacts__info-title">Часы работы</h3>
                        <div class="gray-line"></div>
                        <p class="contacts__info-text">
                            Понедельник-Пятница: 8:00-22:00 <br>
                            Суббота-Воскресенье: 10:00-18:00
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <Footer></Footer>
</template>

<script>
import HeaderOther from "../js/components/HeaderOther";
import Footer from "../js/components/Footer";

export default {
    name: "Contacts",
    components: {
        HeaderOther,
        Footer
    }
}
</script>

<style lang="scss">
.contacts {
    text-align: center;

&__inner {
     text-align: center;
     width: 800px;
     margin: 0 auto;
 }

&__form-title {
     font-weight: bold;
     padding-top: 20px;
     font-size: 48px;
 }

&__form-text {
     font-size: 24px;
     color: rgba(0, 0, 0, 0.5);
 }

& > .container > .contacts__inner > .orange-line {
      margin: 20px auto;
  }

&__form{
     margin: 20px auto;
     width: 700px;
     display: grid;
     grid-template-columns: 1fr 1fr;
     grid-gap: 20px;
& > .textarea,.btn{
      grid-column-start: 1;
      grid-column-end: 3;
  }

& input,textarea{
      width: 100%;
      padding: 10px;
      min-height: 50px;
      resize: none;
      outline: none;
  }

& > .btn input{
      margin: 20px auto 25px auto;
      width: 200px;
      font-size: 18px;

      background-color: #F7B903;
      color: #ffffff;
      border: none;
      box-shadow: 0 0 5px rgba(0,0,0,0.5);
  }
}
&__info{
     display: grid;
     grid-template-columns: repeat(2, 1fr);
     grid-gap: 20px;
     font-size: 18px;
     margin-bottom: 50px;
&-item >.gray-line{
     width: 300px;
     margin: 10px auto;
     border-bottom: 1px solid rgba(0, 0, 0, 0.5);
 }
&-text{
     color: rgba(0, 0, 0, 0.5);
 }
}
}

</style>
