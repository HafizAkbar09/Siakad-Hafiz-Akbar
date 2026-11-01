@extends('layouts.app')

@section('title', 'Detail Mahasiswa')

@section('content')
    <x-page-header judul="Detail Mahasiswa" deskripsi="Informasi lengkap data mahasiswa.">
        <a href="{{ route('mahasiswa.index') }}" class="btn btn-outline-secondary">
            <i class="bi bi-arrow-left"></i> Kembali
        </a>
    </x-page-header>

    <div class="card border-0 shadow-sm col-md-6">
        <div class="card-header bg-body fw-semibold">
            Mahasiswa: {{ $mhs['nama'] }}
        </div>
        <div class="card-body">
            <table class="table table-borderless mb-0">
                <tr>
                    <th width="30%">NIM</th>
                    <td>: {{ $mhs['nim'] }}</td>
                </tr>
                <tr>
                    <th>Nama</th>
                    <td>: {{ $mhs['nama'] }}</td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>: {{ $mhs['email'] ?? '-' }}</td>
                </tr>
                <tr>
                    <th>Status</th>
                    <td>: <span class="badge bg-success">
                        {{ $mhs['status'] ?? 'Aktif' }}</span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
@endsection