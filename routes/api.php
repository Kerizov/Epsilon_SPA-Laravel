<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CityController;
use App\Http\Controllers\EmailVerificationController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\RouteController;
use App\Http\Controllers\StatusController;
use App\Http\Controllers\User\StoreController;
use App\Http\Controllers\User\UpdateController;
use Illuminate\Support\Facades\Auth;
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

Auth::routes();
//Authorization, logout and refreshing token
Route::group(['middleware' => 'api', 'prefix' => 'auth'], function ($router) {
    Route::post('login', [AuthController::class, 'login']);
    Route::post('refresh', [AuthController::class, 'refresh']);
//    Route::get('email-verify', [StoreController::class, 'verification']);
    Route::group(['middleware' => 'jwt.auth'], function() {
        Route::post('logout', [AuthController::class, 'logout']);
        Route::post('me', [AuthController::class, 'me']);

    });
});
//Email verification
Route::post('email/verification-notification', [EmailVerificationController::class, 'sendVerificationEmail'])->middleware('jwt.auth');
Route::get('verify-email/{id}/{hash}', [EmailVerificationController::class, 'verify'])->middleware('jwt.auth')->name('verification.verify');
//Adding and updating users
Route::group(['namespace' => 'User', 'prefix' => 'users'], function () {
    Route::post('/', [StoreController::class, 'store'] );
    Route::post('/update', [UpdateController::class, 'update'] );
});
//Getting cities and statuses to search form
Route::get('/city', [CityController::class, 'index']);
Route::get('/status', [StatusController::class, 'index']);
//Getting and filter air routes
Route::get('/air_routes', [RouteController::class, 'index']);
//Adding and getting posts
Route::get('/posts', [PostController::class, 'index']);
Route::post('/posts', [PostController::class, 'store']);






////Route::get('/email-verification', [VerificationController::class, "verify"])->name('verification.verify');
//Route::post('/auth', [App\Http\Controllers\RegisterController::class, 'reg'])->name('auth');
//Route::post('/login', [App\Http\Controllers\LoginController::class, 'login'])->name('login');
//Route::get('/auth', [App\Http\Controllers\RegisterController::class, 'isAuth'])->name('isAuth');
//Route::get('/logout', [App\Http\Controllers\LoginController::class, 'logout'])->name('logout');;
