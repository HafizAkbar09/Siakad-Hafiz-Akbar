<!-- Nama: Hafiz Akbar
NIM: 3202416014
Kelas: 5C -->

@extends('layouts.app')

@section('title', 'Dashboard')

@section('content')
    <div class="mb-4">
        <h3 class="fw-bold">Dashboard</h3>
        <p class="text-muted">Ringkasan data akademik (data sementara).</p>
    </div>

    <div class="row g-3 mb-4">
        <!-- Mahasiswa -->
        <div class="col-md">
            <div class="card border-0 shadow-sm p-3 h-100">
                <div class="d-flex align-items-center">
                    <div class="bg-primary bg-opacity-10 text-primary p-3 rounded me-3">
                        <i class="bi bi-mortarboard fs-4"></i>
                    </div>
                    <div>
                        <span class="text-muted d-block small">Mahasiswa</span>
                        <h4 class="fw-bold mb-0">{{ number_format($totalMahasiswa, 0, ',', '.') }}</h4>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md">
            <div class="card border-0 shadow-sm p-3 h-100">
                <div class="d-flex align-items-center">
                    <div class="bg-success bg-opacity-10 text-success p-3 rounded me-3">
                        <i class="bi bi-person-badge fs-4"></i>
                    </div>
                    <div>
                        <span class="text-muted d-block small">Dosen</span>
                        <h4 class="fw-bold mb-0">{{ $totalDosen }}</h4>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md">
            <div class="card border-0 shadow-sm p-3 h-100">
                <div class="d-flex align-items-center">
                    <div class="bg-warning bg-opacity-10 text-warning p-3 rounded me-3">
                        <i class="bi bi-book fs-4"></i>
                    </div>
                    <div>
                        <span class="text-muted d-block small">Mata Kuliah</span>
                        <h4 class="fw-bold mb-0">{{ $totalMatakuliah }}</h4>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md">
            <div class="card border-0 shadow-sm p-3 h-100">
                <div class="d-flex align-items-center">
                    <div class="bg-info bg-opacity-10 text-info p-3 rounded me-3">
                        <i class="bi bi-journal-check fs-4"></i>
                    </div>
                    <div>
                        <span class="text-muted d-block small">KRS Aktif</span>
                        <h4 class="fw-bold mb-0">{{ $krsAktif }}</h4>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md">
            <div class="card border-0 shadow-sm p-3 h-100">
                <div class="d-flex align-items-center">
                    <div class="bg-secondary bg-opacity-10 text-secondary p-3 rounded me-3">
                        <i class="bi bi-journal-text fs-4"></i>
                    </div>
                    <div>
                        <span class="text-muted d-block small">Rata-rata SKS</span>
                        <h4 class="fw-bold mb-0">{{ $rataSks }}</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-3">
        <!-- Tabel KRS Terbaru -->
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-header bg-body fw-semibold">KRS Terbaru</div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped align-middle mb-0">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Mahasiswa</th>
                                    <th>Tahun Akademik</th>
                                    <th>Semester</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($krsTerbaru as $index => $item)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $item->mahasiswa->nama ?? '-' }}</td>
                                        <td>{{ $item->tahun_akademik }}</td>
                                        <td>{{ $item->semester }}</td>
                                        <td>{{ ucfirst($item->status) }}</td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="5" class="text-center text-muted">Belum ada data KRS.</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-header bg-body fw-semibold">Status KRS</div>
                <div class="card-body">
                    <div class="mb-3">
                        <div class="d-flex justify-content-between small mb-1">
                            <span>Draft</span>
                            <span>{{ $persenDraft }}%</span>
                        </div>
                        <div class="progress" style="height: 6px;">
                            <div class="progress-bar bg-secondary" style="width: {{ $persenDraft }}%"></div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <div class="d-flex justify-content-between small mb-1">
                            <span>Diajukan</span>
                            <span>{{ $persenDiajukan }}%</span>
                        </div>
                        <div class="progress" style="height: 6px;">
                            <div class="progress-bar bg-info" style="width: {{ $persenDiajukan }}%"></div>
                        </div>
                    </div>

                    <div class="mb-0">
                        <div class="d-flex justify-content-between small mb-1">
                            <span>Disetujui</span>
                            <span>{{ $persenDisetujui }}%</span>
                        </div>
                        <div class="progress" style="height: 6px;">
                            <div class="progress-bar bg-success" style="width: {{ $persenDisetujui }}%"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection