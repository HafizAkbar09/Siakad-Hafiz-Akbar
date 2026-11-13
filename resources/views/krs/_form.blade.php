<!-- Nama: Hafiz Akbar
NIM: 3202416014
Kelas: 5C -->

<div class="mb-3">
    <label for="mahasiswa_id" class="form-label">Mahasiswa</label>
    <select id="mahasiswa_id" name="mahasiswa_id"
        @class(['form-select', 'is-invalid' => $errors->has('mahasiswa_id')]) required autofocus>
        <option value="">-- Pilih Mahasiswa --</option>
        @foreach ($mahasiswa as $mhs)
            <option value="{{ $mhs->id }}" 
                {{ old('mahasiswa_id', $krs->mahasiswa_id) == $mhs->id ? 'selected' : '' }}>
                {{ $mhs->nim }} - {{ $mhs->nama }}
            </option>
        @endforeach
    </select>
    @error('mahasiswa_id')
        <div class="invalid-feedback">{{ $message }}</div>
    @enderror
</div>

<div class="mb-3">
    <label for="tahun_akademik" class="form-label">Tahun Akademik</label>
    <input type="text" id="tahun_akademik" name="tahun_akademik"
        @class(['form-control', 'is-invalid' => $errors->has('tahun_akademik')])
        value="{{ old('tahun_akademik', $krs->tahun_akademik) }}" 
        placeholder="Contoh: 2024/2025" maxlength="9" required>
    @error('tahun_akademik')
        <div class="invalid-feedback">{{ $message }}</div>
    @enderror
</div>

<div class="mb-3">
    <label for="semester" class="form-label">Semester</label>
    <select id="semester" name="semester"
        @class(['form-select', 'is-invalid' => $errors->has('semester')]) required>
        <option value="">-- Pilih Semester --</option>
        @foreach (['Ganjil', 'Genap'] as $sem)
            <option value="{{ $sem }}" 
                {{ old('semester', $krs->semester) === $sem ? 'selected' : '' }}>
                {{ $sem }}
            </option>
        @endforeach
    </select>
    @error('semester')
        <div class="invalid-feedback">{{ $message }}</div>
    @enderror
</div>

<div class="mb-3">
    <label for="status" class="form-label">Status</label>
    <select id="status" name="status"
        @class(['form-select', 'is-invalid' => $errors->has('status')]) required>
        <option value="">-- Pilih Status --</option>
        @foreach (['draft', 'diajukan', 'disetujui', 'ditolak'] as $st)
            <option value="{{ $st }}" 
                {{ old('status', $krs->status) === $st ? 'selected' : '' }}>
                {{ ucfirst($st) }}
            </option>
        @endforeach
    </select>
    @error('status')
        <div class="invalid-feedback">{{ $message }}</div>
    @enderror
</div>

<div class="mb-3">
    <label class="form-label d-block fw-semibold">Pilih Mata Kuliah</label>
    
    @php
        $selectedMk = old('mata_kuliah_ids', $krs->matakuliah->pluck('id')->toArray() ?? []);
    @endphp

    <div class="card p-3 @error('mata_kuliah_ids') border-danger @enderror">
        @foreach ($matakuliah as $mk)
            <div class="form-check mb-2">
                <input class="form-check-input" type="checkbox" 
                    name="mata_kuliah_ids[]" 
                    value="{{ $mk->id }}" 
                    id="mk-{{ $mk->id }}"
                    {{ in_array($mk->id, $selectedMk) ? 'checked' : '' }}>
                <label class="form-check-label" for="mk-{{ $mk->id }}">
                    <strong>{{ $mk->kode_mk }}</strong> - {{ $mk->nama_mk }} <span class="badge bg-secondary">{{ $mk->sks }} SKS</span>
                </label>
            </div>
        @endforeach
    </div>

    @error('mata_kuliah_ids')
        <div class="text-danger small mt-1">{{ $message }}</div>
    @enderror
</div>