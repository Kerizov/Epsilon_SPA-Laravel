import {createStore} from "vuex";

import createPersistedState from "vuex-persistedstate";
import SecureLS from "secure-ls";
var ls = new SecureLS({ isCompression: false });

let today = new Date();
let tomorrow = new Date();
tomorrow.setDate(new Date().getDate() + 1);

export default createStore({
    state: {
        values: {
            departure_city: 'Москва',
            destination_city: 'Абакан',
            arrival_date: tomorrow.toJSON().slice(0,10).replace(/-/g,'-'),
            departure_date: today.toJSON().slice(0,10).replace(/-/g,'-'),
            status_of_places: "Эконом",
            amount_people: 1,
        }
    },
    plugins: [
        createPersistedState({
            storage: {
                getItem: (key) => ls.get(key),
                setItem: (key, value) => ls.set(key, value),
                removeItem: (key) => ls.remove(key),
            },
        }),
    ],
    mutations: {
        setValues(state, values) {
            state.values = Object.assign({}, state.values, values);
        },
    }
})
