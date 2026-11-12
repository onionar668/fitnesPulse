<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CoachReview extends Model
{
    protected $fillable = [
        'user_id',
        'coach_id',
        'rating',
        'description'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function coach()
    {
        return $this->belongsTo(Coach::class);
    }
}
