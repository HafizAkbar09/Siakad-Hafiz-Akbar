<!-- Nama: Hafiz Akbar
NIM: 3202416014
Kelas: 5C -->

@extends('layouts.app')

@section('title', 'Detail Matakuliah')

@section('content')
    <x-page-header judul="Detail Matakuliah" deskripsi="Informasi lengkap satu matakuliah." />

    <div class="card border-0 shadow-sm">
        <div class="card-header bg-body fw-semibold">{{ $matakuliah->nama_mk }}</div>
        <div class="card-body">
            <dl class="row mb-3">
                <dt class="col-sm-3">Kode Matakuliah</dt>
                <dd class="col-sm-9">{{ $matakuliah->kode_mk }}</dd>

                <dt class="col-sm-3">Nama Matakuliah</dt>
                <dd class="col-sm-9">{{ $matakuliah->nama_mk }}</dd>

                <dt class="col-sm-3">Jumlah SKS</dt>
                <dd class="col-sm-9">{{ $matakuliah->sks}}</dd>
            </dl>

            <a href="{{ route('matakuliah.index') }}" class="btn btn-outline-secondary">
                <i class="bi bi-arrow-left"></i> Kembali
            </a>
            @if (Auth::user()->role === 'admin')
                <a href="{{ route('matakuliah.edit', $matakuliah->id) }}" class="btn btn-warning">
                    <i class="bi bi-pencil-square"></i> Ubah
                </a>
            @endif
        </div>
    </div>
@endsection