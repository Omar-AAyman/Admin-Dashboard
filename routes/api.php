<?php

use App\Http\Controllers\Apis\Auth\RegisterController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Dashboard\ProductController;
use App\Http\Controllers\Dashboard\DashboardController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::prefix('/dashboard')->as('dashboard')->group(function () {
    Route::get('/', [DashboardController::class, 'index']);

    Route::prefix('/products')->controller(ProductController::class)->group(function () {
        Route::get('/index', 'index');
        Route::get('/create', 'create');
        Route::post('/store', 'store');

        Route::prefix('/{id}')->group(function () {
            Route::get('/edit', 'edit');
            Route::post('/update', 'update');
            Route::delete('/destroy', 'destroy');
        });
    });
});

Route::prefix('users')->group(function(){
    Route::post('/register',RegisterController::class);
});
