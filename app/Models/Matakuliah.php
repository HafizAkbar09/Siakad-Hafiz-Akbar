<?php
// nama: hafiz
// nim: 3202416014
// kelas: 5C
// tgl Modifikasi: 21/10/2026

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Matakuliah extends Model
{
    protected $table = 'mata_kuliah';

    protected $fillable = ['kode_mk', 'nama_mk', 'sks'];

    public function krsDetail(): Hasmany
    {
        return $this->hasMany(KrsDetail::class, 'mata_kuliah_id');
    }
}
