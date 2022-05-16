<?php

namespace App\Http\Controllers;

use App\Http\Filters\RoutesFilter;
use App\Http\Requests\FilterRequest;
use App\Models\Air_route;
use Illuminate\Http\Request;


class RouteController extends Controller
{
    public function index(FilterRequest $request){

        $data = $request->validated();

        $filter = app()->make(RoutesFilter::class, ['queryParams' => array_filter($data)]);

        $routes = Air_route::filter($filter)->where('amount_places', '>=', $data['amount_people'])->get();

//        $query = Air_route::query();
//
//        if(isset($data['departure_city'])){
//            $query->where('departure_city', $data['departure_city']);
//        }
//
//        if(isset($data['destination_city'])){
//            $query->where('destination_city', $data['destination_city']);
//        }


//        $routes = $query->get();

        return $routes;
    }

}
