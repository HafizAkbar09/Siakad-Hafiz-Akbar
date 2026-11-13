<?php
// Nama: Hafiz Akbar
// NIM: 3202416014
// Kelas: 5C

namespace App\Http\Controllers;

use App\Models\Dashboard;
use App\Models\Mahasiswa;
use App\Models\Dosen;
use App\Models\Matakuliah;
use App\Models\Krs;
use Illuminate\View\View;

class DashboardController extends Controller
{
    public function index(): View
    {
        $totalMahasiswa = Mahasiswa::count();
        $totalDosen = Dosen::count();
        $totalMatakuliah = Matakuliah::count();
        $krsAktif = Krs::where('status', 'disetujui')->count();

        $rataSks = 22;

        $statusDraft = Krs::where('status', 'draft')->count();
        $statusDiajukan = Krs::where('status', 'diajukan')->count();
        $statusDisetujui = Krs::where('status', 'disetujui')->count();

        $totalKrs = Krs::count() > 0 ? Krs::count() : 1;
        $persenDraft = round(($statusDraft / $totalKrs) * 100);
        $persenDiajukan = round(($statusDiajukan / $totalKrs) * 100);
        $persenDisetujui = round(($statusDisetujui / $totalKrs) * 100);

        $krsTerbaru = Krs::with('mahasiswa')->latest()->take(5)->get();

        return view('dashboard', compact(
            'totalMahasiswa',
            'totalDosen',
            'totalMatakuliah',
            'krsAktif',
            'rataSks',
            'statusDraft',
            'statusDiajukan',
            'statusDisetujui',
            'persenDraft',
            'persenDiajukan',
            'persenDisetujui',
            'krsTerbaru'
        ));
    }
}