import api from "../api";

export default {
    methods: {
         BookingInfo() {
             api.get('/api/booking', {
                params: {
                    user_id: this.user_id,
                }
            })
                .then(res => {
                    this.bookings = res.data;
                    let el = this.bookings.map((el) => el.air_route_id)
                    this.bookings = [];
                    el.forEach(el => {
                         api.get(`/api/booking/air_routes`, {
                            params: {
                                air_route_id: el,
                            }
                        })
                            .then(response => {
                                this.bookings.push(...response.data);
                            })
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
