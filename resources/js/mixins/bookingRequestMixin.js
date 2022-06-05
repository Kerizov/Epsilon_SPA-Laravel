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
                    this.bookings = res.data.sort((a, b) => a.air_route_id > b.air_route_id ? 1 : -1);

                    let len = this.bookings.length;
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
                                this.bookings.sort((a, b) => a.id > b.id ? 1 : -1);

                                if (this.bookings.length === len) {
                                    this.bookings.map((elem, index) => {
                                        return elem.price = elem.price * amountPeople[index];
                                    })
                                } else {
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

