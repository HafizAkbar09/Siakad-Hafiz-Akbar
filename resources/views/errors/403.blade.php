<!-- Nama: Hafiz Akbar
NIM: 3202416014
Kelas: 5C -->

@extends('layouts.app')

@section('title', '403 - Akses Ditolak')

@section('content')
<div class="container py-5 text-center">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h1 class="display-1 fw-bold text-danger">403</h1>
            <h2 class="mb-3">Akses Ditolak</h2>
            <p class="text-muted mb-4">Maaf, Anda tidak memiliki izin untuk mengakses halaman ini.</p>
            <a href="{{ route('dashboard') }}" class="btn btn-primary">
                <i class="bi bi-speedometer2"></i> Kembali ke Dashboard
            </a>
        </div>
    </div>
</div>
@endsection