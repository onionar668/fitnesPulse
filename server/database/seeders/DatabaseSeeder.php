<?php

namespace Database\Seeders;

use App\Models\Region;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        Region::create([
            'name' => 'Almaty',
        ]);
        Region::create([
            'name' => 'Astana',
        ]);
        Region::create([
            'name' => 'Almaty region',
        ]);
        Region::create([
            'name' => 'Shymkent',
        ]);
        Region::create([
            'name' => 'Akmola region',
        ]);
        Region::create([
            'name' => 'Zhambyl region',
        ]);
        Region::create([
            'name' => 'Kostanai region',
        ]);
        Region::create([
            'name' => 'Aktobe region',
        ]);
        Region::create([
            'name' => 'Karagandy region',
        ]);
        Region::create([
            'name' => 'Mangistay region',
        ]);

        $this->call([
            CoachSeeder::class,
            GymSeeder::class,
            InfraSeeder::class,
            ScheduleSeeder::class,
            SubscriptionSeed::class,
            UserSeeder::class,
        ]);
    }
}
