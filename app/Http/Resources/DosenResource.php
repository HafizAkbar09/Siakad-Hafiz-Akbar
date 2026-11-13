<?php

// Nama: Hafiz Akbar
// Kelas: 5C
// Tanggal diubah: 11/11/2025

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class DosenResource extends JsonResource
{
    /** Bentuk JSON satu dosen. Hanya kolom di sini yang dikirim ke klien. */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'nidn' => $this->nidn,
            'nama' => $this->nama,
            'email' => $this->email,
            'telepon' => $this->telepon,
            'alamat' => $this->alamat,
            'dibuat_pada' => $this->created_at?->toIso8601String(),
            'diperbarui_pada' => $this->updated_at?->toIso8601String(),
        ];
    }
}