import { createApp, withDirectives } from 'vue';
import router from "./router";
import store from './store'
import VueTheMask from 'vue-the-mask'
import { MotionPlugin } from '@vueuse/motion'
require('./bootstrap');
require('./main.min')


// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

let app=createApp({})



app.component('epsilon', require('./components/Epsilon.vue').default);
app
    .use(router)
    .use(store)
    .use(MotionPlugin)
    .use(VueTheMask)
    .mount("#app");


