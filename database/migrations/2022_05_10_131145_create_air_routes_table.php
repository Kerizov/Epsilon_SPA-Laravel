<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('air_routes', function (Blueprint $table) {
            $table->id();
            $table->string('carrier');// перевозчик
            $table->string('departure');// время аэропорт
            $table->string('departure_city');// страна вылета
            $table->string('time');// время в пути
            $table->string('destination');// время аэропорт
            $table->string('destination_city');// страна прилета
            $table->string('price');// цена
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('air_routes');
    }
};
