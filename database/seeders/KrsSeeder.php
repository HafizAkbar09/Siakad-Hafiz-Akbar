<?php

namespace Database\Seeders;

use App\Models\Krs;
use App\Models\Mahasiswa;
use App\Models\MataKuliah;
use Illuminate\Database\Seeder;

class KrsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Ambil 10 mahasiswa pertama
        $mahasiswas = Mahasiswa::take(10)->get();

        foreach ($mahasiswas as $mhs) {
            // Buat data KRS untuk setiap mahasiswa
            $krs = Krs::create([
                'mahasiswa_id'   => $mhs->id,
                'tahun_akademik' => '2026/2027',
                'semester'       => 'Ganjil',
            ]);

            $mataKuliahIds = MataKuliah::inRandomOrder()->limit(5)->pluck('id');

            $krs->mataKuliah()->attach($mataKuliahIds);
        }
    }
}