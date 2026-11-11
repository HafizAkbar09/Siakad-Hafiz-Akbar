<!-- Nama: Hafiz Akbar
NIM: 3202416014
Kelas: 5C -->
@extends('layouts.app')

@section('title', 'Tambah Matakuliah')

@section('content')
    <x-page-header judul="Tambah Matakuliah"
        deskripsi="Isi data matakuliah baru. Kode matakuliah harus unik." />

    <div class="card border-0 shadow-sm">
        <div class="card-header bg-body fw-semibold">Form Tambah Matakuliah</div>
        <div class="card-body">
            <form method="POST" action="{{ route('matakuliah.store') }}" novalidate>
                @csrf
                @include('matakuliah._form')

                <button type="submit" class="btn btn-primary">
                    <i class="bi bi-save"></i> Simpan
                </button>
                <a href="{{ route('matakuliah.index') }}"
                    class="btn btn-outline-secondary">Batal</a>
            </form>
        </div>
    </div>
@endsection