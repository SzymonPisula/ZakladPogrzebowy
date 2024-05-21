<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
{
    Schema::create('dane_zm', function (Blueprint $table) {
        $table->id('id_zmarlego');
        $table->string('imie_zm');
        $table->string('nazwisko_zm');
        $table->date('data_ur_zm');
        $table->date('data_sm_zm');
        $table->timestamps();
    });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dane_zm');
    }
};
