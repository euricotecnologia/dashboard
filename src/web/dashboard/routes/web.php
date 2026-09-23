<?php

use Illuminate\Support\Facades\Route;



//FUNÇÕES DO USUARIO//

Route::get('recuperar-senha', function () { return view('recuperar-senha');})->name('recuperar-senha');
Route::get('/sair', 'loginController@sair')->name('sair');
Route::post('/logar','loginController@logar')->name('logar');
Route::get('/login', 'loginController@dashboard')->name('login');
Route::get('/{page}', 'loginController@index');
Route::get('/','loginController@dashboard')->name('');
Route::post('/data','loginController@data')->name('data');
Route::post('/refresh','loginController@refresh')->name('refresh');
Route::post('/alterpass','loginController@alterpass')->name('alterpass');
Route::post('/recoverypass','loginController@recoverypass')->name('recoverypass');


Route::get('dashboard', function () {
    return view('dashboard');
})->name('dashboard');

Route::get('pagar', function () {
    return view('pagar');
})->name('pagar');

Route::get('receber', function () {
    return view('receber');
})->name('receber');

Route::get('caixas', function () {
    return view('caixas');
})->name('caixas');

Route::get('vendedores', function () {
    return view('vendedores');
})->name('vendedores');

Route::get('vendas', function () {
    return view('vendas');
})->name('vendas');

Route::get('alterar', function () {
    return view('alterar');
})->name('alterar');

