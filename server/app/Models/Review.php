<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    protected $fillable = [
        'description',
        'rating',
        'user_id',
        'gym_id',
        'coach_id',
    ];

    public function gym()
    {
        return $this->belongsTo(Gym::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
