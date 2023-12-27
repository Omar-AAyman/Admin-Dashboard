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
Route::post('/dashboard/products/store' , [ProductController::class, 'store'])->name('dashboard.products.store');
Route::get('/dashboard/products/{id}/edit' , [ProductController::class, 'edit'])->name('dashboard.products.edit');
Route::put('/dashboard/products/{id}/update' , [ProductController::class, 'update'])->name('dashboard.products.update');
Route::delete('/dashboard/products/{id}/destroy' , [ProductController::class, 'destroy'])->name('dashboard.products.destroy');


// Put    => replaces all current representations of the target resource with the request payload.
// Patch  => applies partial modifications to a resource.
// delete => deletes the specified resource.