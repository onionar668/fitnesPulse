<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Infrastructure extends Model
{
    protected $fillable = [
        'name'
    ];

    public function gyms()
    {
        return $this->belongsToMany(Gym::class);
    }
}
