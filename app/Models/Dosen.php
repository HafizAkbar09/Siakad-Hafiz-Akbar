<?php
// nama: hafiz
// nim: 3202416014
// kelas: 5C
// tgl Modifikasi: 21/10/2026

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dosen extends Model
{
    /** @use HasFactory<\Database\Factories\DosenFactory> */
    use HasFactory;
    protected $table = 'dosen';

    protected $fillable = [
        'nidn',
        'nama',
        'jabatan_fungsional',
        'email',
        'telepon',
        'alamat',
    ];
}
