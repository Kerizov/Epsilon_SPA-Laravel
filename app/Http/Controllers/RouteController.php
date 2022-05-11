<?php

namespace App\Http\Controllers;

use App\Models\Air_route;
use Illuminate\Http\Request;


class RouteController extends Controller
{
    public function index($departure_city){
        $routes = Air_route::where('departure_city', $departure_city)->get();

        return $routes;
    }
////        this.$router.push({ name: 'routename' })
//    public function filter(Request $request){
//        $departure_city = $request->departure_city;
//        $routes = Air_route::query()->where('departure_city', 'LIKE', "%{$departure_city}%");
//        return $routes;
//    }
}
