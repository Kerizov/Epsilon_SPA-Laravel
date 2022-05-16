<?php


namespace App\Http\Filters;


use Illuminate\Database\Eloquent\Builder;

class RoutesFilter extends AbstractFilter
{
    public const DEPARTURE_CITY = 'departure_city';
    public const DESTINATION_CITY = 'destination_city';
    public const DEPARTURE_DATE = 'departure_date';
    public const ARRIVAL_DATE = 'arrival_date';
    public const STATUS_OF_PLACES = 'status_of_places';
//    public const AMOUNT_PEOPLE = 'amount_people';

    protected function getCallbacks(): array
    {
        return [
            self::DEPARTURE_CITY => [$this, 'departureCity'],
            self::DESTINATION_CITY => [$this, 'destinationCity'],
            self::DEPARTURE_DATE => [$this, 'departureDate'],
            self::ARRIVAL_DATE => [$this, 'arrivalDate'],
            self::STATUS_OF_PLACES => [$this, 'statusOfPlaces'],
//            self::AMOUNT_PEOPLE => [$this, 'amountPeople'],
        ];
    }

    public function departureCity(Builder $builder, $value){
        $builder->where('departure_city', 'like', "%{$value}%");
    }
    public function destinationCity(Builder $builder, $value){
        $builder->where('destination_city', 'like', "%{$value}%");
    }
    public function departureDate(Builder $builder, $value){
        $builder->where('departure_date', 'like', "%{$value}%");
    }
    public function arrivalDate(Builder $builder, $value){
        $builder->where('arrival_date', 'like', "%{$value}%");
    }
    public function statusOfPlaces(Builder $builder, $value){
        $builder->where('status_of_places', 'like', "%{$value}%");
    }
//    public function amountPeople(Builder $builder, $value){
//        $builder->where('amount_places','>=',  $value);
//    }

}
