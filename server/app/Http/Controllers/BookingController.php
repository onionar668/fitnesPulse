<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\UserSubscription;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class BookingController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'schedule_id' => 'required|exists:schedules,id'
        ]);
        $user = Auth::user();
        $schedule = $request->schedule_id;

        $hasActiveSubscription = UserSubscription::where('user_id', $user->id)->where('status', 'active')->where('end_at', '>', Carbon::now())->exists();

        if(!$hasActiveSubscription){
            return response()->json([
                'message' => 'You dont have active subscription'
            ], 403);
        }

        $alreadyBooked = Booking::where('user_id', $user->id)->where('schedule_id', $schedule)->where('status', 'booked')->exists();
        if($alreadyBooked){
            return response()->json([
                'message' => 'you already booked'
            ], 400);
        }

        $booking = Booking::create([
            'user_id' => $user->id,
            'schedule_id' => $schedule,
            'status' => 'booked'
        ]);

        return response()->json([
            'message' => 'You have successfully signed up for a workout',
            'data' => $booking
        ], 201);
    }

    public function myBooking(Request $request)
    {
        $user = Auth::user();

        $booking = Booking::with(['user:id,name', 'schedule:id,start_at,end_at'])->where('user_id', $user->id)->get();

        $filltered = $booking->map(function ($key) {
            return [
                'id' => $key->id,
                'user' => $key->user->name,
                'start training' => $key->schedule->start_at,
                'end training' => $key->schedule->end_at,
                'status' => $key->status
            ];
        });

        return response()->json([
            'data' => $filltered
        ], 200);
    }
}
