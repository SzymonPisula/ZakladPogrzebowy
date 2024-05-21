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
    Schema::create('trumny', function (Blueprint $table) {
        $table->id('id_trumny');
        $table->integer('rozmiar');
        $table->decimal('cena', 10, 2);
        $table->string('klasa');
        $table->string('material_wykonania');
        $table->timestamps();
    });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('trumny');
    }
};
