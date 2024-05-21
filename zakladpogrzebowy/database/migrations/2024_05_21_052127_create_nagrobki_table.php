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
    Schema::create('nagrobki', function (Blueprint $table) {
        $table->id('id_nagrobka');
        $table->foreignId('id_typ')->constrained('typ');
        $table->integer('rozmiar');
        $table->string('material');
        $table->string('klasa');
        $table->timestamps();
    });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('nagrobki');
    }
};
