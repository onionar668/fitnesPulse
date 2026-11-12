<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Gym;

class GymSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $gyms = [
            [
                'name' => 'World Class Almaty',
                'region_id' => 1, 
                'address' => 'пр. Аль-Фараби, 6/3',
                'description' => 'Премиальный фитнес-клуб с большим бассейном, спа-зоной и тренажерным залом.',
                'image_url' => 'gyms/world_class.jpg',
            ],
            [
                'name' => 'Invictus Go',
                'region_id' => 1,
                'address' => 'пр. Достык, 38',
                'description' => 'Современный круглосуточный фитнес-клуб с американским оборудованием Hammer Strength.',
                'image_url' => 'gyms/invictus.jpg',
            ],
            [
                'name' => 'FitNation',
                'region_id' => 1,
                'address' => 'ул. Розыбакиева, 289',
                'description' => 'Семейный фитнес-центр с групповыми программами, йогой и кроссфит-зоной.',
                'image_url' => 'gyms/fitnation.jpg',
            ],
            [
                'name' => 'Turnik Gym',
                'region_id' => 1,
                'address' => 'пр. Абая, 150',
                'description' => 'Хардкорный зал для любителей тяжелой атлетики, пауэрлифтинга и бодибилдинга.',
                'image_url' => 'gyms/turnik.jpg',
            ],
            [
                'name' => 'Rakhat Fitness',
                'region_id' => 1,
                'address' => 'ул. Сатпаева, 27',
                'description' => 'Легендарный спортивный комплекс с теннисными кортами и игровыми площадками.',
                'image_url' => 'gyms/rakhat.jpg',
            ],
            [
                'name' => 'CrossFit Almaty',
                'region_id' => 1,
                'address' => 'ул. Шевченко, 165',
                'description' => 'Специализированная аффилированная бокс-площадка для функционального многоборья.',
                'image_url' => 'gyms/crossfit.jpg',
            ],
            [
                'name' => 'Invictus Astana',
                'region_id' => 2, // Предполагаем, что 2 - это Астана
                'address' => 'ул. Сарайшык, 5',
                'description' => 'Флагманский клуб сети с панорамными окнами и новейшей линейкой тренажеров.',
                'image_url' => 'gyms/invictus_astana.jpg',
            ],
            [
                'name' => 'Life Fitness',
                'region_id' => 2,
                'address' => 'пр. Кабанбай Батыра, 11',
                'description' => 'Уютный клуб с упором на персональные тренировки и кардио-зону.',
                'image_url' => 'gyms/lifefitness.jpg',
            ],
            [
                'name' => 'Olympia Fitness',
                'region_id' => 1,
                'address' => 'мкр. Аксай-4, 10',
                'description' => 'Доступный районный спортзал со всем необходимым для поддержания формы.',
                'image_url' => 'gyms/olympia.jpg',
            ],
            [
                'name' => 'Wellness Club LUX',
                'region_id' => 2,
                'address' => 'ул. Достык, 16',
                'description' => 'Элитный велнес-центр с термальными источниками, массажем и фитнес-баром.',
                'image_url' => 'gyms/lux.jpg',
            ],
        ];

        foreach ($gyms as $gym) {
            Gym::create($gym);
        }
    }
}
