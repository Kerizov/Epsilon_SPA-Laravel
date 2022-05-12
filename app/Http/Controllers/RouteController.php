<?php

namespace App\Http\Controllers;

use App\Http\Requests\FilterRequest;
use App\Models\Air_route;
use Illuminate\Http\Request;


class RouteController extends Controller
{
    public function index(FilterRequest $request){
//
        $data = $request->validated();
        $query = Air_route::query();

        if(isset($data['departure_city'])){
            $query->where('departure_city', $data['departure_city']);
        }

        if(isset($data['destination_city'])){
            $query->where('destination_city', $data['destination_city']);
        }
//        if(isset($destination_city)){
//            $query->where('destination_city', 'LIKE' ,"%{$destination_city}%");
//        }

//        $routes = Air_route::where('departure_city', 'LIKE' ,"%{$departure_city}%")
//            ->where('destination_city', 'LIKE' ,"%{$destination_city}%")
//            ->get();

        $routes = $query->get();

        return $routes;
    }
////        this.$router.push({ name: 'routename' })
//    public function filter(Request $request){
//        $departure_city = $request->departure_city;
//        $routes = Air_route::query()->where('departure_city', 'LIKE', "%{$departure_city}%");
//        return $routes;
//    }
}
