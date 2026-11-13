<!-- Nama: Hafiz Akbar
NIM: 3202416014
Kelas: 5C -->
@extends('layouts.app')

@section('title', 'Detail KRS')

@section('content')
    <x-page-header judul="Detail KRS" deskripsi="Informasi lengkap data KRS." />

    <div class="card border-0 shadow-sm mb-4">
        <div class="card-header bg-body fw-semibold">Informasi Mahasiswa</div>
        <div class="card-body">
            <dl class="row mb-0">
                <dt class="col-sm-3">ID Mahasiswa</dt>
                <dd class="col-sm-9">{{ $krs->mahasiswa_id }}</dd>

                <dt class="col-sm-3">NIM Mahasiswa</dt>
                <dd class="col-sm-9">{{ $krs->mahasiswa->nim ?? '-' }}</dd>

                <dt class="col-sm-3">Nama Mahasiswa</dt>
                <dd class="col-sm-9">{{ $krs->mahasiswa->nama ?? '-' }}</dd>

                <dt class="col-sm-3">Tahun Akademik</dt>
                <dd class="col-sm-9">{{ $krs->tahun_akademik }}</dd>

                <dt class="col-sm-3">Semester</dt>
                <dd class="col-sm-9">{{ $krs->semester }}</dd>

                <dt class="col-sm-3">Status</dt>
                <dd class="col-sm-9">
                    <span class="badge bg-{{ $krs->status === 'disetujui' ? 'success' : ($krs->status === 'diajukan' ? 'info' : 'secondary') }}">
                        {{ ucfirst($krs->status) }}
                    </span>
                </dd>
            </dl>
        </div>
    </div>

    <div class="card border-0 shadow-sm mb-4">
        <div class="card-header bg-body fw-semibold">Daftar Mata Kuliah Yang Diambil</div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th scope="col" style="width: 5%;" class="text-center">No</th>
                            <th scope="col">Kode MK</th>
                            <th scope="col">Nama Mata Kuliah</th>
                            <th scope="col" style="width: 15%;" class="text-center">SKS</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($krs->matakuliah as $index => $mk)
                            <tr>
                                <td class="text-center">{{ $index + 1 }}</td>
                                <td>{{ $mk->kode_mk ?? '-' }}</td>
                                <td>{{ $mk->nama_mk }}</td>
                                <td class="text-center">{{ $mk->sks }}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="4" class="text-center text-muted py-3">
                                    Belum ada mata kuliah yang diambil.
                                </td>
                            </tr>
                        @endforelse
                    </tbody>
                    <tfoot>
                        <tr class="fw-bold table-light">
                            <td colspan="3" class="text-end">Total SKS</td>
                            <td class="text-center">{{ $krs->matakuliah->sum('sks') }}</td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>

    <div class="d-flex gap-2">
        <a href="{{ route('krs.index') }}" class="btn btn-outline-secondary">
            <i class="bi bi-arrow-left"></i> Kembali
        </a>
        @if (Auth::user()->role === 'admin')
            <a href="{{ route('krs.edit', $krs->id) }}" class="btn btn-warning">
                <i class="bi bi-pencil-square"></i> Ubah
            </a>
        @endif
    </div>
@endsection