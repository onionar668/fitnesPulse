<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Gym extends Model
{
    protected $fillable = [
        'name',
        'description',
        'region_id',
        'image_url',
        'address'
    ];

    public function region()
    {
        return $this->belongsTo(Region::class);
    }

    public function subscriptions()
    {
        return $this->hasMany(Subscription::class);
    }

    public function coach()
    {
        return $this->hasMany(Coach::class);
    }

    public function review()
    {
        return $this->hasMany(Review::class);
    }

    public function infrastructure()
    {
        return $this->belongsToMany(Infrastructure::class, 'gym_infrastructures');
    }

    public function schedules()
    {
        return $this->hasMany(Schedule::class);
    }
}
