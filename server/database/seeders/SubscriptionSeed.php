<?php

namespace Database\Seeders;

use App\Models\Subscription;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SubscriptionSeed extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $subs = [
            [
                'name' => 'Junior',
                'price' => 18000,
                'gym_id' => 1,
                'duration_days' => 30
            ],
            [
                'name' => 'Middle',
                'price' => 15000,
                'gym_id' => 1,
                'duration_days' => 30
            ],
            [
                'name' => 'Senior',
                'price' => 13000,
                'gym_id' => 1,
                'duration_days' => 30
            ],
            [
                'name' => 'TeamLead',
                'price' => 8000,
                'gym_id' => 1,
                'duration_days' => 30
            ],
            [
                'name' => 'TechLead',
                'price' => 5000,
                'gym_id' => 1,
                'duration_days' => 30
            ],
            [
                'name' => 'Middle+',
                'price' => 14000,
                'gym_id' => 2,
                'duration_days' => 30
            ],
            [
                'name' => 'Junior+',
                'price' => 17000,
                'gym_id' => 8,
                'duration_days' => 30
            ],
            [
                'name' => 'Senior+',
                'price' => 10000,
                'gym_id' => 6,
                'duration_days' => 30
            ],
            [
                'name' => 'Project manager',
                'price' => 20000,
                'gym_id' => 8,
                'duration_days' => 60
            ],
            [
                'name' => 'Boss',
                'price' => 365000,
                'gym_id' => 2,
                'duration_days' => 365
            ],
        ];

        foreach($subs as $sub){
            Subscription::create($sub);
        }
    }
}
