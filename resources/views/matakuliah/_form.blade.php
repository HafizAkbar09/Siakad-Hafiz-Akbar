<!-- Nama: Hafiz Akbar
Nim: 3202416014
Kelas: 5C -->
<div class="mb-3">
    <x-form-input label="Kode Matakuliah" name="kode_mk" :value="$matakuliah?->kode_mk"
        maxlength="10" required autofocus />
</div>

<div class="mb-3">
    <x-form-input label="Nama Matakuliah" name="nama_mk" :value="$matakuliah->nama_mk"
        maxlength="100" required />
</div>

<div class="mb-3">
    <x-form-input label="Jumlah SKS" name="sks" type="integer" :value="$matakuliah->sks"
        maxlength="100" required />
</div>