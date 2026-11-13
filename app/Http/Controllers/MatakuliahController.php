<?php
// Nama: Hafiz Akbar
// NIM: 3202416014
// Kelas: 5C
namespace App\Http\Controllers;

use App\Models\Matakuliah;
use Illuminate\Database\QueryException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\View\View;
use Yajra\DataTables\Facades\DataTables;

class MatakuliahController extends Controller
{
    public function index(): View
    {
        return view('matakuliah.index');
    }

    public function data(): JsonResponse
    {
        // Hanya kolom yang dibutuhkan tabel yang diambil dari database
        $query = Matakuliah::query()->select(['id', 'kode_mk', 'nama_mk', 'sks']);

        return DataTables::eloquent($query)
            ->addIndexColumn()
            ->addColumn('aksi', function (Matakuliah $matakuliah) {
                return view('matakuliah._aksi', compact('matakuliah'))->render();
            })
            ->rawColumns(['aksi'])
            ->toJson();
    }

    public function create(): View
    {
        return view('matakuliah.create', ['matakuliah' => new Matakuliah()]);
    }

    public function store(Request $request): RedirectResponse
    {
        $mata_kuliah = Matakuliah::create($this->validated($request));

        return redirect()
            ->route('matakuliah.index')
            ->with('success', 'Data matakuliah ' . $mata_kuliah->nama . ' berhasil ditambahkan.');
    }

    public function show(Matakuliah $matakuliah): View
    {
        return view('matakuliah.show', compact('matakuliah'));
    }

    public function edit(Matakuliah $matakuliah): View
    {
        return view('matakuliah.edit', compact('matakuliah'));
    }

    public function update(Request $request, Matakuliah $matakuliah): RedirectResponse
    {
        $matakuliah->update($this->validated($request, $matakuliah));

        return redirect()
            ->route('matakuliah.index')
            ->with('success', 'Data matakuliah ' . $matakuliah->nama_mk . ' berhasil diperbarui.');
    }

    public function destroy(Matakuliah $matakuliah): JsonResponse
    {
        try {
            $matakuliah->delete();
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Data matakuliah tidak dapat dihapus: masih dipakai data lain.',
            ], 409);
        }

        return response()->json([
            'message' => 'Data matakuliah ' . $matakuliah->nama_mk . ' berhasil dihapus.',
        ]);
    }

    /** Aturan validasi bersama untuk store dan update. */
    private function validated(Request $request, ?Matakuliah $matakuliah = null): array
    {
        return $request->validate([
            'kode_mk' => [
                'required', 'string', 'max:10',
                Rule::unique(Matakuliah::class, 'kode_mk')->ignore($matakuliah?->id),
            ],
            'nama_mk' => ['required', 'string', 'max:100'],
            'sks' => ['required', 'integer', 'min:1', 'max:6'],
        ], [
            'kode_mk.required' => 'Kode matakuliah wajib diisi.',
            'kode_mk.max' => 'Kode matakuliah maksimal 10 karakter.',
            'kode_mk.unique' => 'Kode matakuliah sudah dipakai matakuliah lain.',
            'nama_mk.required' => 'Nama matakuliah wajib diisi.',
            'nama_mk.max' => 'Nama matakuliah maksimal 100 karakter.',
            'sks.required' => 'Jumlah SKS wajib diisi',
            'sks.max' => 'Jumlah SKS minimal 1, maksimal 6 SKS.',
        ]);
    }
}