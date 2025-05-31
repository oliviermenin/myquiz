<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Reponse;
use Illuminate\Http\Request;

class ReponseController extends Controller
{
    public function index()
    {
        $reponses = Reponse::with('question')->get();
        return response()->json($reponses);
    }

    public function store(Request $request)
    {
        $request->validate([
            'id_question' => 'required|exists:question,id',
            'reponse' => 'required|string|max:255',
            'reponse_expected' => 'required|boolean',
        ]);

        $reponse = Reponse::create($request->all());
        return response()->json($reponse, 201);
    }

    public function show(Reponse $reponse)
    {
        $reponse->load('question');
        return response()->json($reponse);
    }

    public function update(Request $request, Reponse $reponse)
    {
        $request->validate([
            'id_question' => 'required|exists:question,id',
            'reponse' => 'required|string|max:255',
            'reponse_expected' => 'required|boolean',
        ]);

        $reponse->update($request->all());
        return response()->json($reponse);
    }

    public function destroy(Reponse $reponse)
    {
        $reponse->delete();
        return response()->json(null, 204);
    }
}