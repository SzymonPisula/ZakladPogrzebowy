<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('index');
});

Route::get('/subpage1', function () {
    return view('subpage1');
});

Route::get('/subpage2', function () {
    return view('subpage2');
});
