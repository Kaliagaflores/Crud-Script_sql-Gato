<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Hospital;

class HospitalController extends Controller
{
    public function index()
    {
        // Llamar al stored procedure para listar hospitales
        $hospitals = DB::select("CALL hospital_listar()");
        return view('hospitals.index', compact('hospitals'));
    }

    public function create()
    {
        return view('hospitals.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'code' => 'required|string|unique:hospitals,code|max:10',
            'name' => 'required|string|max:255',
            'age' => 'required|integer|min:1',
            'district' => 'required|string|max:255',
            'venue' => 'required|string',
            'manager' => 'required|string|max:255',
            'condicion' => 'required|string|max:50',
            'registration_date' => 'required|date',
        ]);

        // Llamar al stored procedure para insertar un hospital
        DB::statement("CALL hospital_registrar(?, ?, ?, ?, ?, ?, ?, ?)", [
            $request->code,
            $request->name,
            $request->age,
            $request->district,
            $request->venue,
            $request->manager,
            $request->condicion,
            $request->registration_date
        ]);

        return redirect()->route('hospitals.index')->with('success', 'Hospital registrado con éxito');
    }

    public function edit($id)
    {
        // Laravel no permite usar SP directamente en `find()`, así que usamos una consulta directa.
        $hospital = DB::select('SELECT * FROM hospitals WHERE id = ?', [$id]);

        if (!$hospital) {
            return redirect()->route('hospitals.index')->with('error', 'Hospital no encontrado.');
        }

        return view('hospitals.edit', ['hospital' => $hospital[0]]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'code' => 'required|string|max:10',
            'name' => 'required|string|max:255',
            'age' => 'required|integer|min:1',
            'district' => 'required|string|max:255',
            'venue' => 'required|string',
            'manager' => 'required|string|max:255',
            'condicion' => 'required|string|max:50',
            'registration_date' => 'required|date',
        ]);

        // Llamar al stored procedure para actualizar un hospital
        DB::statement("CALL hospital_actualizar(?,?, ?, ?, ?, ?, ?, ?, ?)", [
            $id,
            $request->code,
            $request->name,
            $request->age,
            $request->district,
            $request->venue,
            $request->manager,
            $request->condicion,
            $request->registration_date
        ]);

        return redirect()->route('hospitals.index')->with('success', 'Hospital actualizado correctamente.');
    }

    public function destroy($id)
    {
        DB::statement('CALL hospital_eliminar(?)', [$id]);

        return redirect()->route('hospitals.index')->with('success', 'Hospital eliminado correctamente.');
    }
}
