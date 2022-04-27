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
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('login', 55)->nullable(false)->unique();
            $table->string('firstname', 100);
            $table->string('lastname', 100);
            $table->string('password', 255)->nullable(false);
            $table->string('photo_file');
            $table->string('api_token');
            $table->integer('role_id');
            $table->string('remember_token', 100)->nullable(true);
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
        Schema::dropIfExists('users');
    }
};
