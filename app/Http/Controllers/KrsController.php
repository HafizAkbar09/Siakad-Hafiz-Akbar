<?php
// Nama: Hafiz Akbar
// NIM: 3202416014
// Kelas: 5C

namespace App\Http\Controllers;

use App\Models\Krs;
use App\Models\Matakuliah;
use App\Models\Mahasiswa;
use Illuminate\Database\QueryException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\View\View;
use Yajra\DataTables\Facades\DataTables;

class KrsController extends Controller
{
    public function index(): View
    {
        return view('krs.index');
    }

    public function data(): JsonResponse
    {
        $query = Krs::with(['mahasiswa', 'matakuliah'])->latest();

        return DataTables::eloquent($query)
            ->addIndexColumn()
            ->addColumn('nama', function (Krs $krs) {
                return $krs->mahasiswa->nama ?? '-';
            })
            ->addColumn('aksi', function (Krs $krs) {
                return view('krs._aksi', compact('krs'))->render();
            })
            ->rawColumns(['aksi'])
            ->toJson();
    }

    public function create(): View
    {
        $mahasiswa = Mahasiswa::all();
        $matakuliah = Matakuliah::all();

        return view('krs.create', [
            'krs' => new Krs(),
            'mahasiswa' => $mahasiswa,
            'matakuliah' => $matakuliah,
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $validatedData = $this->validated($request);

        $krs = Krs::create([
            'mahasiswa_id' => $validatedData['mahasiswa_id'],
            'tahun_akademik' => $validatedData['tahun_akademik'],
            'semester' => $validatedData['semester'],
            'status' => $validatedData['status'],
        ]);

        // Attach array mata kuliah yang dicentang ke tabel pivot
        $krs->matakuliah()->attach($validatedData['mata_kuliah_ids']);

        return redirect()
            ->route('krs.index')
            ->with('success', 'Data KRS berhasil ditambahkan.');
    }

    public function show(Krs $krs): View
    {
        $krs->load(['mahasiswa', 'matakuliah']);
        return view('krs.show', compact('krs'));
    }

    public function edit(Krs $krs): View
    {
        $krs->load('matakuliah');
        $listMahasiswa = Mahasiswa::all();
        $listMatakuliah = Matakuliah::all();

        return view('krs.edit', [
            'krs' => $krs,
            'mahasiswa' => $listMahasiswa,
            'matakuliah' => $listMatakuliah,
        ]);
    }

    public function update(Request $request, Krs $krs): RedirectResponse
    {
        $validatedData = $this->validated($request, $krs);

        $krs->update([
            'mahasiswa_id' => $validatedData['mahasiswa_id'],
            'tahun_akademik' => $validatedData['tahun_akademik'],
            'semester' => $validatedData['semester'],
            'status' => $validatedData['status'],
        ]);

        // Sync array mata kuliah yang dicentang ke tabel pivot
        $krs->matakuliah()->sync($validatedData['mata_kuliah_ids']);

        return redirect()
            ->route('krs.index')
            ->with('success', 'Data KRS berhasil diperbarui.');
    }

    public function destroy(Krs $krs): JsonResponse
    {
        try {
            $krs->matakuliah()->detach();
            $krs->delete();
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Data KRS tidak dapat dihapus: masih dipakai data lain.',
            ], 409);
        }

        return response()->json([
            'message' => 'Data KRS berhasil dihapus.',
        ]);
    }

    /** Aturan validasi bersama untuk store dan update. */
    private function validated(Request $request, ?Krs $krs = null): array
    {
        $validated = $request->validate([
            'mahasiswa_id' => [
                'required',
                'exists:mahasiswa,id',
            ],
            'tahun_akademik' => ['required', 'string', 'max:9'],
            'semester' => [
                'required',
                Rule::in(['Ganjil', 'Genap']),
            ],
            'status' => [
                'required',
                Rule::in(['draft', 'diajukan', 'disetujui', 'ditolak']),
            ],
            'mata_kuliah_ids' => ['required', 'array', 'min:1'],
            'mata_kuliah_ids.*' => ['exists:mata_kuliah,id'],
        ], [
            'mahasiswa_id.required' => 'Mahasiswa wajib dipilih.',
            'mahasiswa_id.exists' => 'Mahasiswa yang dipilih tidak valid.',
            'tahun_akademik.required' => 'Tahun akademik wajib diisi.',
            'tahun_akademik.max' => 'Tahun akademik maksimal 9 karakter.',
            'semester.required' => 'Semester wajib dipilih.',
            'semester.in' => 'Semester yang dipilih tidak valid.',
            'status.required' => 'Status wajib dipilih.',
            'status.in' => 'Status yang dipilih tidak valid.',
            'mata_kuliah_ids.required' => 'Pilih minimal satu mata kuliah.',
            'mata_kuliah_ids.min' => 'Pilih minimal satu mata kuliah.',
        ]);

        $totalSks = Matakuliah::whereIn('id', $request->mata_kuliah_ids)->sum('sks');
        $maksSks = 24;

        if ($totalSks > $maksSks) {
            throw \Illuminate\Validation\ValidationException::withMessages([
                'mata_kuliah_ids' => "Total SKS yang dipilih ($totalSks SKS) melebihi batas maksimal yaitu $maksSks SKS.",
            ]);
        }

        return $validated;
    }
}