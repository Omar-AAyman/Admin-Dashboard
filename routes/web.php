<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Dashboard\ProductController;
use App\Http\Controllers\Dashboard\DashboardController;
use GuzzleHttp\Middleware;

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

Route::prefix('/dashboard')->as('dashboard')->middleware('verified')->group(function () {
    Route::get('/', [DashboardController::class, 'index']);

    Route::prefix('/products')->controller(ProductController::class)->as('.products')->group(function () {
        Route::get('/index', 'index')->name('.index');
        Route::get('/create', 'create')->name('.create');
        Route::post('/store', 'store')->name('.store');

        Route::prefix('/{id}')->group(function () {
            Route::get('/edit', 'edit')->name('.edit');
            Route::put('/update', 'update')->name('.update');
            Route::delete('/destroy', 'destroy')->name('.destroy');
        });
    });
});


// Put    => replaces all current representations of the target resource with the request payload.
// Patch  => applies partial modifications to a resource.
// delete => deletes the specified resource.



Auth::routes(['verify' => true]);

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home')->middleware('verified');
