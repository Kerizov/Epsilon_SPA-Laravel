import {createRouter, createWebHistory} from "vue-router";

const routes = [
    {
        path: '/', component: () => import('../pages/Home'),
        name: 'home.index',
    },
    {
        path: '/contacts', component: () => import('../pages/Contacts'),
        name: 'home.contacts'
    },
    {
        path: '/about', component: () => import('../pages/About'),
        name: 'home.about'
    },
    {
        path: '/air_routes', component: () => import('../pages/Routes'),
        name: 'home.air_routes'
    },
    {
        path: '/auth', component: () => import('../pages/Auth'),
        name: 'home.auth'
    },
    {
        path: '/cabinet', component: () => import('../pages/Cabinet'),
        name: 'home.cabinet'
    },
    {
        path: '/404', component: () => import('../pages/PageNotExist'),
        name: 'PageNotExist',
    },
    {
        path: "/:catchAll(.*)", // Unrecognized path automatically matches 404
        redirect: '/404',
    },
]

const router = createRouter({
    routes,
    history: createWebHistory(process.env.BASE_URL)
})

router.beforeEach((to, from, next) => {
    const access_token = localStorage.getItem('access_token')

    if(to.name === 'home.cabinet' || to.name === 'home.air_routes'){
        if(!access_token){
            return next({
                name : 'home.auth'
            })
        }
    }
    if(to.name === 'home.auth' && access_token){
        return next({
            name: 'home.cabinet'
        })
    }

    next();
})

export default router
