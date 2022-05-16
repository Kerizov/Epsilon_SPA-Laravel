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
        Schema::table('air_routes', function (Blueprint $table) {
            $table->date('arrival_date')->nullable()->after('destination_city');
            $table->date('departure_date')->nullable()->after('arrival_date');
            $table->string('status_of_places')->nullable()->after('departure_date');
            $table->integer('amount_places')->nullable()->after('status_of_places');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('air_routes', function (Blueprint $table) {
            $table->dropColumn('arrival_date');
            $table->dropColumn('departure_date');
            $table->dropColumn('status_of_places');
            $table->dropColumn('amount_places');
        });
    }
};
