<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\View\View;

class MatakuliahController extends Controller
{
    public function index(): View
    {
        $kolom = [
            'kode' => 'Kode', 
            'nama' => 'Mata Kuliah', 
            'sks' => 'SKS', 
            'semester' => 'Semester', 
            'jenis' => 'Jenis'
        ];

        $matakuliah = [
            ['kode' => 'TIF301', 'nama' => 'Pemrograman Web', 'sks' => 3, 'semester' => 3, 'jenis' => 'Praktik'],
            ['kode' => 'TIF302', 'nama' => 'Basis Data', 'sks' => 3, 'semester' => 2, 'jenis' => 'Praktik'],
            ['kode' => 'TIF303', 'nama' => 'Rekayasa Perangkat Lunak', 'sks' => 4, 'semester' => 4, 'jenis' => 'Teori'],
            ['kode' => 'TIF304', 'nama' => 'Jaringan Komputer', 'sks' => 3, 'semester' => 3, 'jenis' => 'Teori'],
        ];

        return view('matakuliah.index', compact('kolom', 'matakuliah'));
    }
}