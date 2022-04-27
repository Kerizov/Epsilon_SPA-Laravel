<template>
    <section class="news">
        <div class="container">
            <div class="news__title">
                <div class="green-line"></div>
                <h1>Последние новости:</h1>
            </div>
            <div class="news__items">
                <HomeNewsItem></HomeNewsItem>
            </div>
        </div>
    </section>
</template>

<script>
import HomeNewsItem from "./HomeNewsItem";

export default {
    name: "HomeNews",
    components: {HomeNewsItem}
}
</script>

<style scoped>
.news__title{
    margin: 0 auto;
    max-width: 1200px;
    display: flex;
}

.green-line {
    width: 0;
    border-right: 95px solid #97CA2B;
    margin: 25px 5px 25px 5px;
}
</style>
