<?php

namespace App\Http\Controllers;

use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ReviewController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $reviews = Review::with(['gym', 'user'])->get();

        $formatted = $reviews->map(function  ($key) {
            return [
                'id' => $key->id,
                'text' => $key->description,
                'rating' => $key->rating,
                'gym' => $key->gym->name,
                'user' => $key->user->name,
            ];
        });

        return response()->json([
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
    public function store(Request $request, string $gymId)
    {
        $user = Auth::user();

         if(!$gymId){
            return response()->json([
                'error' => 'Gym not found'
            ], 404);
        }

        $review = Review::create([
            'description' => $request->desc,
            'rating' => $request->rating,
            'user_id' => $user->id,
            'gym_id' => $gymId
        ]);


        return response()->json([
            'message' => 'Review created success',
            'data' => $review
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
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
