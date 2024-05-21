<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ServiceController;

Route::resource('services', ServiceController::class);

Route::get('/', function () {
    return view('index');
});

Route::get('/subpage1', function () {
    return view('subpage1');
});

Route::get('/subpage2', function () {
    return view('subpage2');
});
Route::resource('klienci', KlienciController::class);
Route::resource('trumny', TrumnyController::class);
Route::resource('pracownicy', PracownicyController::class);
Route::resource('samochody', SamochodyController::class);
Route::resource('typ', TypController::class);
Route::resource('nagrobki', NagrobkiController::class);
Route::resource('dane_zm', DaneZmController::class);
Route::resource('pogrzeb', PogrzebController::class);

