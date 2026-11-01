<?php
// nama: hafiz
// nim: 3202416014
// kelas: 5C
// tgl Modifikasi: 21/10/2026

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::updateOrCreate(
            ['email' => 'admin@siakad.test'],
            [
                'name'     => 'Administrator SIAKAD',
                'password' => Hash::make('Admin@12345'),
                'role'     => 'admin',
            ]
        );
    }
}
