<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Dashboard\ProductController;
use App\Http\Controllers\Dashboard\DashboardController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('/dashboard' , [DashboardController::class, 'index'])->name('dashboard');
Route::get('/dashboard/products' , [ProductController::class, 'index'])->name('dashboard.products.index');
Route::get('/dashboard/products/create' , [ProductController::class, 'create'])->name('dashboard.products.create');
Route::get('/dashboard/products/store' , [ProductController::class, 'store'])->name('dashboard.products.store');
