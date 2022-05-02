<template>

    <template v-for="post in posts">
        <div class="news__item">
            <div class="news__item-img"><img :src="`../../images/air-news${post.img}.jpg`" alt="#"></div>
<!--            <div class="news__item-img"><img src="../../images/air-news1.jpg" alt="#"></div>-->
            <div class="news__item-text">
                <h3>{{ post.title }}</h3>
                <p>
                    {{ post.text }}
                </p>
                <p class="news__item-link"><img src="../../images/drop-arrow.svg" alt=""></p>
            </div>
        </div>
    </template>

</template>

<script>
import api from "../api";
export default {
    name: "HomeNewsItem",
    data() {
        return {
            posts: [
                {
                    title: null,
                    text: null,
                    img: null,
                }
            ]
        }
    },
    mounted() {
        this.GetPosts();
    },
    methods: {
        GetPosts() {
            api.get('/api/posts')
                .then(res => {
                    this.posts = res.data;
                    //console.log(res.data);
                })
        }
    }
}
</script>

<style scoped>

</style>
