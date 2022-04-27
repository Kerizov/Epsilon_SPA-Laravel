<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\User\StoreController;
use App\Http\Controllers\User\UpdateController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//    return $request->user();
//});



Route::group(['middleware' => 'api', 'prefix' => 'auth'], function ($router) {
    Route::post('login', [AuthController::class, 'login']);
    Route::group(['middleware' => 'jwt.auth'], function() {
        Route::post('logout', [AuthController::class, 'logout']);
        Route::post('me', [AuthController::class, 'me']);
        Route::post('refresh', [AuthController::class, 'refresh']);
    });
});

Route::group(['namespace' => 'User', 'prefix' => 'users'], function () {
    Route::post('/', [StoreController::class, 'store'] );
    Route::post('/update', [UpdateController::class, 'update'] );
});


Route::get('/posts', [PostController::class, 'index']);
Route::post('/posts', [PostController::class, 'store']);




//
//Route::post('/auth', [App\Http\Controllers\RegisterController::class, 'reg'])->name('auth');
//Route::post('/login', [App\Http\Controllers\LoginController::class, 'login'])->name('login');
//Route::get('/auth', [App\Http\Controllers\RegisterController::class, 'isAuth'])->name('isAuth');
//Route::get('/logout', [App\Http\Controllers\LoginController::class, 'logout'])->name('logout');;
