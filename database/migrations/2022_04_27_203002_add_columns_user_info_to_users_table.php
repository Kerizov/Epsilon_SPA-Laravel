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
        Schema::table('users', function (Blueprint $table) {
            $table->string('phone_number')->nullable()->after('lastname');
            $table->string('passport_series')->nullable()->after('phone_number');
            $table->string('passport_number')->nullable()->after('passport_series');
            $table->string('inn')->nullable()->after('passport_number');
            $table->string('mail_index')->nullable()->after('inn');
            $table->string('address')->nullable()->after('mail_index');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('phone_number');
            $table->dropColumn('passport_series');
            $table->dropColumn('passport_number');
            $table->dropColumn('inn');
            $table->dropColumn('mail_index');
            $table->dropColumn('address');
        });
    }
};
