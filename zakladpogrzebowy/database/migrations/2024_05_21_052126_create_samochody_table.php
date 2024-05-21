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
    Schema::create('samochody', function (Blueprint $table) {
        $table->id('id_samochodu');
        $table->string('marka');
        $table->integer('rok_produkcji');
        $table->string('typ');
        $table->timestamps();
    });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('samochody');
    }
};
