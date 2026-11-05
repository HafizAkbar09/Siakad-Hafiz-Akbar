<!-- Nama : Hafiz Akbar
NIM : 3202416014
Kelas : 5C -->
@extends('layouts.guest')
@section('title', 'Login')
@section('content')
    <div class="text-center mb-4">
        <i class="bi bi-mortarboard-fill display-5 text-primary"></i>
        <h1 class="h3 fw-bold mb-1">{{ config('app.name') }}</h1>
        <p class="text-body-secondary mb-0">Politeknik Negeri Pontianak</p>
    </div>
    <div class="card border-0 shadow-sm">
        <div class="card-body p-4">
            <h2 class="h5 mb-3">Masuk ke akun Anda</h2>
            <form method="POST" action="{{ route('login.attempt') }}" novalidate>
                @csrf
                <div class="mb-3">
                    <x-form-input label="Email" name="email" type="email" autocomplete="username" required autofocus />
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <div class="input-group">
                        <input type="password" name="password" id="password" class="form-control" placeholder="Masukkan password" required>
                        <button class="btn btn-outline-secondary" type="button" id="togglePassword">Lihat</button>
                    </div>
                </div>
                <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="remember" id="remember">
                    <label class="form-check-label" for="remember">Ingat saya</label>
                </div>
                <button type="submit" class="btn btn-primary w-100">Masuk</button>
            </form>
        </div>
    </div>
@endsection
@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const toggleBtn = document.getElementById('togglePassword');
        const passwordInput = document.getElementById('password');
        if (toggleBtn && passwordInput) {
            toggleBtn.addEventListener('click', function () {
                const currentType = passwordInput.getAttribute('type');
                if (currentType === 'password') {
                    passwordInput.setAttribute('type', 'text');
                    this.textContent = 'Sembunyikan';
                } else {
                    passwordInput.setAttribute('type', 'password');
                    this.textContent = 'Lihat';
                }
            });
        }
    });
</script>
@endpush