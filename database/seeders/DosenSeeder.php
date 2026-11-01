<?php
// nama: hafiz
// nim: 3202416014
// kelas: 5C
// tgl Modifikasi: 21/10/2026

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Dosen;
use Illuminate\Database\Seeder;

class DosenSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Dosen::factory()->count(10)->create();
    }
}
