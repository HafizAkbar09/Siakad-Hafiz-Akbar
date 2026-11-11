<!-- Nama: Hafiz Akbar
NIM: 3202416014
Kelas: 5C -->
@extends('layouts.app')

@section('title', 'Ubah Matakuliah')

@section('content')
    <x-page-header judul="Ubah Matakuliah"
        deskripsi="Perbarui data matakuliah. Kode matakuliah harus tetap unik." />

    <div class="card border-0 shadow-sm">
        <div class="card-header bg-body fw-semibold">Form Ubah Matakuliah</div>
        <div class="card-body">
            <form method="POST" action="{{ route('matakuliah.update', $matakuliah) }}" novalidate>
                @csrf
                @method('PUT')
                @include('matakuliah._form')

                <button type="submit" class="btn btn-primary">
                    <i class="bi bi-save"></i> Perbarui
                </button>
                <a href="{{ route('matakuliah.index') }}"
                    class="btn btn-outline-secondary">Batal</a>
            </form>
        </div>
    </div>
@endsection