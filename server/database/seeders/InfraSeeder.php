<?php

namespace Database\Seeders;

use App\Models\Infrastructure;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class InfraSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $infrastructures = [
            ['name' => 'Pool'],
            ['name' => 'SPA'],
            ['name' => 'Открытая терраса для йоги'],
            ['name' => 'Зона единоборств с рингом'],
            ['name' => 'Детская фитнес-комната'],
            ['name' => 'Кабинет кинезиотерапии'],
            ['name' => 'Термальный комплекс'],
            ['name' => 'Официальный CrossFit бокс'],
            ['name' => 'Хаммам и соляная пещера'],
        ];

        foreach($infrastructures as $item){
            Infrastructure::create($item);
        }
    }
}
