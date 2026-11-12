<?php

namespace App\Http\Controllers;

use App\Models\Subscription;
use App\Models\User;
use App\Models\UserSubscription;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function buySub(Request $request)
    {

        $request->validate([
            'subscription_id' => 'required|string'
            ]);

        $user = Auth::user();
        $subscription = Subscription::findOrFail($request->subscription_id);
        $startDate = Carbon::now();
        $endDate =  Carbon::now()->addDays($subscription->duration_days);

        $userSub = UserSubscription::create([
            'user_id' => $user->id,
            'subscription_id' => $subscription->id,
            'start_at' => $startDate,
            'end_at' => $endDate,
            'status' => 'active'
        ]);

        return response()->json([
            'message' => 'subscription activate',
            'data' => $userSub
        ], 201);
    }

    public function myProfile(Request $request)
    {
        $user = User::with('userSubscription.subscription')->findOrFail(Auth::user()->id);
        $subscriptions = $user->userSubscription->map(function($item){
            return [
                    "id" => $item->id,
					"start_at" => $item->start_at,
					"end_at" => $item->end_at,
					"subscription_id" => 4,
					"status" => $item->status,
                    "subscitpion_name" => $item->subscription->name
            ];
        });

        return response()->json([
            'success' => true,
            'data' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'phone' => $user->phone,
                'avatar_url' => $user->avatar_url,
                'subscription' => $subscriptions
            ]
        ], 200);
    }
}
