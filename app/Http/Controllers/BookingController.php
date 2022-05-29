<?php

namespace App\Http\Controllers;

use App\Http\Requests\BookingRequest;
use App\Models\Air_route;
use App\Models\Booking;

class BookingController extends Controller
{
    public function index(BookingRequest $request){

        $data = $request->validated();
        $query = Booking::query();

        if(isset($data['user_id'])){
            $query->where('user_id', $data['user_id']);
        }

        $booking = $query->get();
        return $booking;

    }
    public function store(BookingRequest $request){
        $bookings = $request->validated();
        Booking::create([
            'user_id'=>$bookings['user_id'],
            'air_route_id'=>$bookings['air_route_id'],
            'confirm'=>true,
        ]);
        return $bookings;
    }

    public function delete(BookingRequest $request){
        $bookings = $request->validated();
        $query = Booking::query();

        $query->where('user_id', $bookings['user_id'])->where('air_route_id', $bookings['air_route_id']);

        $query->delete();
    }

    public function getUserRoute(BookingRequest $request){
        $data = $request->validated();
        $query = Air_route::query();

        if(isset($data['air_route_id'])){
            $query->where('id', $data['air_route_id']);
        }
        $booking = $query->get();
        return $booking;

    }
}
