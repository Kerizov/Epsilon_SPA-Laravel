import api from "../api";
import {nextTick} from "vue";


export default {
    methods: {
        async BookingInfo() {
            await api.get('/api/booking', {
                params: {
                    user_id: this.user_id,
                }
            })
                .then(res => {
                    this.bookings = res.data;
                    let len = this.bookings.length;
                    console.log(this.bookings);
                    let el = this.bookings.map((el) => el.air_route_id);
                    let amountPeople = [];
                    this.bookings.map((elem) => amountPeople.push(elem.amount_people));

                    this.bookings = [];
                    el.forEach((el) => {
                        api.get(`/api/booking/air_routes`, {
                            params: {
                                air_route_id: el,
                            }
                        })
                            .then(res => {

                                this.bookings.push(...res.data);

                                if (this.bookings.length === len) {
                                    this.bookings.map((elem, index) => {
                                        return elem.price = elem.price * amountPeople[index];
                                    })
                                }
                                else {
                                    nextTick()
                                }
                            });
                    });

                });
        },
        DeleteBooking(booking_id) {
            api.get('api/booking/delete', {
                params: {
                    air_route_id: booking_id,
                    user_id: this.user_id
                }
            })
                .then(res => {
                    this.BookingInfo();
                })
        },
    }
}

