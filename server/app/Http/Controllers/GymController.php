<?php

namespace App\Http\Controllers;

use App\Models\Gym;
use App\Models\Region;
use Illuminate\Http\Request;

class GymController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $gyms = Gym::with(['region', 'infrastructure', 'subscriptions', 'review'])->get();

        $formated = $gyms->map(function($el){
            return [
                'id' => $el->id,
                'name' => $el->name,
                'description' => $el->description,
                'address' => $el->address,
                'image_url' => $el->image_url,
                'region' => $el->region->name,
                'subscriptions' => $el->subscriptions->sortBy('price')->values()->map(function($item){
                    return [
                        'id' => $item->id,
                        'name' => $item->name,
                        'price' => $item->price,
                        'duration_days' => $item->duration_days
                    ];
                }),
                'infrastructure' => $el->infrastructure->pluck('name'),
                'avgRating' => $el->review->avg('rating'),
                'reviewCount' => $el->review->count()
            ];
        });

        return response()->json([
            'data' => $formated
        ], 200);
    }

    public function byRegion(string $id)
    {
        $gyms = Gym::where('region_id', $id)->get();

        if($gyms->isEmpty()){
            return response()->json([
                'message' => 'Gyms not found in your region'
            ], 200);
        }

        return response()->json([
            'data' => $gyms
        ]);
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
         $validated = $request->validate([
            'name' => 'required|string',
            'description' => 'required|string',
            'region_id' => 'required|integer|exists:regions,id',
            'address' => 'required|string',
            'image_url' => 'required|image',
            'infrastructures' => 'nullable|array',
            'infrastructures.*' => 'integer|exists:infrastructures,id'
        ]);

        $imagePath = null;
        if($request->hasFile('image_url')){
            $imagePath = $request->file('image_url')->store('gyms', 'public');
        }


        $gym = Gym::create([
            'name' => $request->name,
            'description' => $request->description,
            'region_id' => $request->region_id,
            'address' => $request->address,
            'image_url' => $imagePath
        ]);

         if($request->has('infrastructures')){
            $gym->infrastructure()->attach($validated['infrastructures']);
        }

        $gym->load(['infrastructure', 'region']);

        return response()->json([
            'success' => true,
            'message' => 'Gym created',
            'data' => $gym
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $gym = Gym::with(['subscriptions', 'region', 'review', 'coach', 'infrastructure', 'schedules'])->where('id', $id)->first();

        if(!$gym){
            return response()->json([
                'error' => 'gym not found'
            ], 404);
        }

        $coaches = $gym->coach->map(function($el) {
            return [
                'id' => $el->id,
                'user' => $el->user->name,
                'avatar' => $el->user->avatar_url,
                'bio' => $el->bio,
                'avgRating' => $el->reviews->avg('rating'),
                'reviewCount' => $el->reviews->count(),
                'specialization' => $el->speciazlization,
                'price' => $el->price
            ];
        });
        $subscriptions = $gym->subscriptions?->map(function ($el) {
           return [
            'id' => $el->id,
            'name' => $el->name,
            'price' => $el->price,
            'duration_days' => $el->duration_days,
           ];
        });

        $schedules = $gym->schedules->map(function ($el){
            return [
                'id' => $el->id,
                'coach' => $el->coach->user->name,
                'specialization' => $el->coach->specialization,
                'start' => $el->start_at,
                'end' => $el->end_at,
            ];
        });

        $reviews = $gym->review->map(function ($el) {
            return [
                'id' => $el->id,
                'description' => $el->description,
                'rating' => $el->rating,
                'user' => $el->user->name,
                'avatar_url' => $el->user->avatar_url,
                'created_at' => $el->created_at
            ];
        });
        $reviewsCount = $gym->review->count();
        $avgRating = $gym->review->avg('rating');
        $ratingRounded = $avgRating ? round($avgRating, 1) : 0;
        $infrastructure = $gym->infrastructure->pluck('name');

        return response()->json([
            'data' => [
                'id' => $gym->id,
                'name' => $gym->name,
                'description' => $gym->description,
                'image_url' => $gym->image_url,
                'address' => $gym->address,
                'region' => $gym->region->name,
                'reviewsCount' => $reviewsCount,
                'avgRating' => $ratingRounded,
                'subscirpions' => $subscriptions,
                'coaches' => $coaches,
                'infrastructure' => $infrastructure,
                'schedules' => $schedules,
                'reviews' => $reviews,
            ]
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

    public function getRegion()
    {
        $regions = Region::all();

        return response()->json([
            'success' => true,
            'data' => $regions
        ]);
    }
}
