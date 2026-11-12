<?php

namespace App\Http\Controllers;

use App\Models\Schedule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ScheduleController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
       $schedules = Schedule::with(['coach', 'gym'])->get();
       $formatter = $schedules->map(function ($key) {
            return [
                'id' => $key->id,
                'start_at' => $key->start_at,
                'end_at' => $key->end_at,
                'coach' => $key->coach->user->name,
                'specialization' => $key->coach->specialization,
                'gym' => $key->gym->name,
            ];
       });

       return response()->json([
            'success' => true,
            'data' => $formatter
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
