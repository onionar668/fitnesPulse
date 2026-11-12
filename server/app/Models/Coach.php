<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Coach extends Model
{
    protected $fillable = [
        'user_id',
        'gym_id',
        'bio',
        'specialization',
        'price'
    ];

     public function gym()
    {
        return $this->belongsTo(Gym::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function reviews()
    {
        return $this->hasMany(CoachReview::class);
    }
}
