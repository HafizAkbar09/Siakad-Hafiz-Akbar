<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\View\View;

class DosenController extends Controller
{
    public function index(): View
    {
        $kolom = [
            'nidn' => 'NIDN', 
            'nama' => 'Nama Dosen', 
            'keahlian' => 'Bidang Keahlian', 
            'status' => 'Status'
        ];

        $dosen = [
            ['nidn' => '0012038901', 'nama' => 'Hendra Wijaya', 'keahlian' => 'Pemrograman Web', 'status' => 'Aktif'],
            ['nidn' => '0015098702', 'nama' => 'Maya Sari', 'keahlian' => 'Basis Data', 'status' => 'Aktif'],
            ['nidn' => '0023108503', 'nama' => 'Andi Kurniawan', 'keahlian' => 'Jaringan Komputer', 'status' => 'Aktif'],
            ['nidn' => '0008037904', 'nama' => 'Rina Marlina', 'keahlian' => 'Rekayasa Perangkat Lunak', 'status' => 'Tugas Belajar'],
        ];

        return view('dosen.index', compact('kolom', 'dosen'));
    }
}