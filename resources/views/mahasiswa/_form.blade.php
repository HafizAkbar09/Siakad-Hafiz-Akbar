<!-- Nama: Hafiz Akbar
Nim: 3202416014
Kelas: 5C -->
<div class="mb-3">
    <x-form-input label="NIM" name="nim" :value="$mahasiswa->nim"
        maxlength="15" required autofocus />
</div>

<div class="mb-3">
    <x-form-input label="Nama Mahasiswa" name="nama" :value="$mahasiswa->nama"
        maxlength="100" required />
</div>

<div class="mb-3">
    <label for="jenis_kelamin" class="form-label">Jenis Kelamin</label>
    <select id="jenis_kelamin" name="jenis_kelamin"
        @class(['form-select', 'is-invalid' => $errors->has('jenis_kelamin')])>
        <option value="">-- Pilih Jenis Kelamin --</option>
        @foreach (['L', 'P'] as $gender)
            <option value="{{ $gender }}"
                {{ old('jenis_kelamin', $mahasiswa->jenis_kelamin) === $gender ? 'selected' : '' }}>
                {{ $gender }}
            </option>
        @endforeach
    </select>
    @error('jenis_kelamin')
        <div class="invalid-feedback">{{ $message }}</div>
    @enderror
</div>

<div class="mb-3">
    <x-form-input label="Email" name="email" type="email" :value="$mahasiswa->email"
        maxlength="100" required />
</div>

<div class="mb-3">
    <x-form-input label="Angkatan" name="angkatan" :value="$mahasiswa->angkatan"
        maxlength="20" required />
</div>

<div class="mb-3">
    <x-form-input label="Program Studi" name="program_studi" :value="$mahasiswa->program_studi"
        maxlength="100" required />
</div>