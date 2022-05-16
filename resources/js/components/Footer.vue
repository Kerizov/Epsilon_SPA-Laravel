<template>
    <footer class="footer">
        <div class="container">
            <div class="footer__inner">
                <div class="footer__feedback">
                    <h3>Связь с нами</h3>
                    <div class="green-line"></div>
                    <p class="footer__address">Адрес: Протопоповский пер., 9, Москва, 129090</p>
                    <p class="footer__phone"><a href="tel:88005553535">Тел: 8 (800) 555-35-35</a></p>
                    <p class="footer__mail"><a href="mailto:epsilon@gmail.com">Почта: epsilon@gmail.com</a></p>
                </div>
                <div class="footer__copyright">
                    Разработано веб-студией "MnoyRazrabotano"
                </div>
            </div>
        </div>
    </footer>
</template>

<script>
export default {
    name: "Footer"
}
</script>

<style lang="scss" scoped>
.footer {
    background-color: #fff;
    min-height: 200px;
    margin-top: auto;
    bottom: 0;
    left: 0;
    right: 0;
    box-shadow: 0px -15px 25px rgba(0, 0, 0, 0.25);

&__inner {
     display: flex;
     justify-content: space-between;
 }

&__feedback {
     font-size: 16px;
     padding-top: 33px;
 }

&__copyright {
     text-align: right;
     margin-top: auto;
 }

& p {
      margin-top: 20px;
  }

& a {
      text-decoration: none;
      color: #000;
  }
}
</style>
