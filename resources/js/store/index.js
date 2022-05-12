
import {createStore} from "vuex";


export default createStore({
    state: {
        values: {
            departure_city: 'Москва',
            destination_city: 'Абакан',
        }
    },
    mutations: {
        setValues(state, values) {
            state.values = Object.assign({}, state.values, values);
        }
    }
})
