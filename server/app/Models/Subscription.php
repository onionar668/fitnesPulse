<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Subscription extends Model
{
    protected $fillable = [
        'name',
        'price',
        'gym_id',
        'duration_days',
    ];

    public function gym()
    {
        return $this->belongsTo(Gym::class);
    }
}
