<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $users = [
            [
                'name' => 'Naz',
                'email' => 'naz@mail.ru',
                'phone' => '+123',
                'password' => '12345678',
                'role' => 'coach',
            ],
            [
                'name' => 'Daniil',
                'email' => 'daniil@mail.ru',
                'phone' => '+1234',
                'password' => '12345678',
                'role' => 'client',
            ],
            [
                'name' => 'Yura',
                'email' => 'yura@mail.ru',
                'phone' => '+12345',
                'password' => '12345678',
                'role' => 'client',
            ],
            [
                'name' => 'Max',
                'email' => 'max@mail.ru',
                'phone' => '+1236',
                'password' => '12345678',
                'role' => 'coach',
            ],
            [
                'name' => 'Aslambek',
                'email' => 'aslambek@mail.ru',
                'phone' => '+1237',
                'password' => '12345678',
                'role' => 'coach',
            ],
            [
                'name' => 'Akzhol',
                'email' => 'akzhol@mail.ru',
                'phone' => '+1238',
                'password' => '12345678',
                'role' => 'coach',
            ],
            [
                'name' => 'Tima',
                'email' => 'tima@mail.ru',
                'phone' => '+1239',
                'password' => '12345678',
                'role' => 'coach',
            ],
        ];

        foreach ($users as $user){
            User::create($user);
        }
    }
}
