<?php

namespace Database\Seeders;

use App\Models\Coach;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CoachSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $coachs = [
            [
                'user_id' => 2,
                'gym_id' => 5,
                'bio' => 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Obcaecati, ea?'
            ],
            [
                'user_id' => 5,
                'gym_id' => 6,
                'bio' => 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Obcaecati, ea?'
            ],
            [
                'user_id' => 6,
                'gym_id' => 2,
                'bio' => 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Obcaecati, ea?'
            ],
            [
                'user_id' => 7,
                'gym_id' => 3,
                'bio' => 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Obcaecati, ea?'
            ],
            [
                'user_id' => 1,
                'gym_id' => 4,
                'bio' => 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Obcaecati, ea?'
            ],
        ];
        foreach($coachs as $coach){
            Coach::create($coach);
        }
    }
}
