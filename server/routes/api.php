<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\BookingController;
use App\Http\Controllers\CoachController;
use App\Http\Controllers\GymController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\ScheduleController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function(){
    Route::post('/auth/register', [AuthController::class,'register'])->name('register');
    Route::post('/auth/login', [AuthController::class, 'login'])->name('login');

    Route::get('/gym', [GymController::class, 'index'])->name('gym.index');
    Route::get('/gym/region/{id}', [GymController::class, 'byRegion'])->name('byRegion');
    Route::get('/gym/{id}', [GymController::class, 'show'])->name('gym.show');
    Route::get('/gym/{gymId}/coaches', [CoachController::class, 'show'])->name('coach.show');
    Route::get('/coaches', [CoachController::class, 'index'])->name('coach.index');
    Route::get('/reviews', [ReviewController::class, 'index'])->name('review.index');
    Route::get('/regions', [GymController::class, 'getRegion']);
    Route::get('/schedules', [ScheduleController::class, 'index'])->name('schedule.index');
    Route::middleware('auth:sanctum')->group(function(){
        Route::post('/auth/logout', [AuthController::class, 'logout'])->name('logout');
        Route::post('/user/sub/buy', [UserController::class, 'buySub'])->name('buySub');
        Route::post('/booking', [BookingController::class, 'store']);
        Route::get('/booking/my', [BookingController::class, 'myBooking']);
        Route::post('/review/{gymId}', [ReviewController::class, 'store']);
        Route::get('/user/me', [UserController::class, 'myProfile']);
        Route::post('/gym', [GymController::class, 'store'])->name('gym.store');
    });
});
