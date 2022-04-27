<template>

    <h1>404</h1>
    <h2>Страницы не существует</h2>
    <h2><router-link :to="{ name: 'home.index' }">Вернуться на главную</router-link></h2>

</template>

<script>
export default {
    name: "PageNotExist"
}
</script>

<style lang="scss" scoped>
h1, h2{
    width: 100%;
    height: 100%;
    text-align: center;
    transform: translate(0%, 200%);
    & a{
          color: #000;
          text-decoration: none;
      }
}

</style>
