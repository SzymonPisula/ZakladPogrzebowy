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
    Schema::create('pogrzeb', function (Blueprint $table) {
        $table->id('id_pogrzebu');
        $table->string('miejscowosc');
        $table->dateTime('data_pogrzebu');
        $table->foreignId('id_klienta')->constrained('klienci');
        $table->foreignId('id_zmarlego')->constrained('dane_zm');
        $table->foreignId('id_trumny')->constrained('trumny');
        $table->foreignId('id_pracownika')->constrained('pracownicy');
        $table->foreignId('id_samochodu')->constrained('samochody');
        $table->foreignId('id_nagrobka')->nullable()->constrained('nagrobki');
        $table->timestamps();
    });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pogrzeb');
    }
};
