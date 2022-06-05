<template>
    <template v-for="post in posts" :key="post.id">
        <div class="news__item"
             v-motion
             :initial="{
             y: 50,
             x: 50,
             rotate: 5,
             opacity: 0,
             }"
             :visibleOnce="{
             y: 0,
             x: 0,
             rotate: 0,
             opacity: 1,
             }"
        >
            <div class="news__item-img"><img :src="`../../images/air-news${post.img}.jpg`" alt="#"></div>
            <div class="news__item-text">
                <h3>{{ post.title }}</h3>
                <p>
                    {{ post.text }}
                </p>
                <transition name="fade">
                    <p v-if="post.id === postId && visible !== true">
                        {{ post.full_text }}
                    </p>
                </transition>
                <p :class="[(post.id === postId && visible !== true)?'dropped':'not-dropped']"
                   @click="visiblePost(post.id)"
                   class="news__item-link">
                    <img src="../../images/drop-arrow.svg" alt="">
                </p>
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
            visible: true,
            postId: '',
            posts: [
                {
                    title: null,
                    text: null,
                    full_text: null,
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
                })
        },
        visiblePost(id) {
            this.postId = id;
            this.visible = !this.visible;
        }
    },
}
</script>

<style scoped>
.dropped {
    transition: all 0.3s ease-out;
    transform: rotate(0deg) !important;
    cursor: pointer;
}

.not-dropped {
    transition: all 0.3s ease-out;
    transform: rotate(180deg) !important;
    cursor: pointer;
}

.fade-enter-active,
.fade-leave-active {
    transition: all 0.3s ease-out;
}

.fade-enter-from,
.fade-leave-to {
    opacity: 0;
}
</style>
