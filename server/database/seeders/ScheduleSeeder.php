<?php

namespace Database\Seeders;

use App\Models\Schedule;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ScheduleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $schedules = [
            [
                'gym_id' => 2,
                'coach_id' => 17,
                'start_at' => '11:00',
                'end_at' => '13:00'
            ],
            [
                'gym_id' => 2,
                'coach_id' => 17,
                'start_at' => '14:00',
                'end_at' => '16:00'
            ],
            [
                'gym_id' => 2,
                'coach_id' => 17,
                'start_at' => '17:00',
                'end_at' => '19:00'
            ],
            [
                'gym_id' => 5,
                'coach_id' => 16,
                'start_at' => '09:00',
                'end_at' => '10:00'
            ],
            [
                'gym_id' => 5,
                'coach_id' => 16,
                'start_at' => '11:00',
                'end_at' => '12:00'
            ],
            [
                'gym_id' => 5,
                'coach_id' => 16,
                'start_at' => '13:00',
                'end_at' => '14:00'
            ],
            [
                'gym_id' => 5,
                'coach_id' => 16,
                'start_at' => '15:00',
                'end_at' => '16:00'
            ],
            [
                'gym_id' => 6,
                'coach_id' => 17,
                'start_at' => '10:00',
                'end_at' => '13:00'
            ],
            [
                'gym_id' => 6,
                'coach_id' => 17,
                'start_at' => '15:00',
                'end_at' => '18:00'
            ],
            [
                'gym_id' => 6,
                'coach_id' => 17,
                'start_at' => '19:00',
                'end_at' => '22:00'
            ],
        ];

        foreach($schedules as $schedule){
            Schedule::create($schedule);
        }
    }
}
