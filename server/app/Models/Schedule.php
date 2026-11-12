<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Schedule extends Model
{
    protected $fillable = [
        'name',
        'price',
        'gym_id',
        'duration_days',
        'coach_id'
    ];

    public function gym()
    {
        return $this->belongsTo(Gym::class);
    }
    public function coach()
    {
        return $this->belongsTo(Coach::class);
    }
}
