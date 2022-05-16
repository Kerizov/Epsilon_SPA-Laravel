
import {createStore} from "vuex";

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
    mutations: {
        setValues(state, values) {
            state.values = Object.assign({}, state.values, values);
        }
    }
})
