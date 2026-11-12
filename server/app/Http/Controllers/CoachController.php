<?php

namespace App\Http\Controllers;

use App\Models\Coach;
use Illuminate\Http\Request;

class CoachController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $coaches = Coach::with(['user', 'gym', 'reviews'])->get();

        $formatted = $coaches->map(function ($key) {
            return [
                'id' => $key->id,
                'name' => $key->user->name,
                'avatar' => $key->user->avatar_url,
                'phone' => $key->user->phone,
                'bio' => $key->bio,
                'specialization' => $key->specialization,
                'price' => $key->price,
                'gym' => $key->gym->name,
                'avgReview' => $key->reviews->avg('rating'),
                'reviewCount' => $key->reviews->count()
            ];
        });

        return response()->json([
            'success' => true,
            'data' => $formatted
        ], 200);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $gymId)
    {
          $coachs = Coach::with(['gym', 'user'])->where('gym_id', $gymId)->get();
        if($coachs->isEmpty()){
            return response()->json([
                'message' => 'This gym dont have coach'
            ], 200);
        }

        $formatted = $coachs->map(function($key){
            return [
                'id' => $key->id,
                'coach' => $key->user->name,
                'bio' => $key->bio,
                'avatar' => $key->user->avatar_url,
                'gym' => $key->gym?->name || 'No Gym assigned'
            ];
        });

        return response()->json([
            'data' => $formatted
        ], 200);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
