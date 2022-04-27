import { createApp } from 'vue';
import router from "./router";
require('./bootstrap');
require('./main.min')


// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

let app=createApp({})


app.component('epsilon', require('./components/Epsilon.vue').default);
app
    .use(router)
    .mount("#app");
