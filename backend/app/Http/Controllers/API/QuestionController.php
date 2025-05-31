<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Question;
use Illuminate\Http\Request;

class QuestionController extends Controller
{
    public function index()
    {
        $questions = Question::with(['categorie', 'reponses'])->get();
        return response()->json($questions);
    }

    public function store(Request $request)
    {
        $request->validate([
            'id_categorie' => 'required|exists:categorie,id',
            'question' => 'required|string|max:255',
        ]);

        $question = Question::create($request->all());
        return response()->json($question, 201);
    }

    public function show(Question $question)
    {
        $question->load(['categorie', 'reponses']);
        return response()->json($question);
    }

    public function update(Request $request, Question $question)
    {
        $request->validate([
            'id_categorie' => 'required|exists:categorie,id',
            'question' => 'required|string|max:255',
        ]);

        $question->update($request->all());
        return response()->json($question);
    }

    public function destroy(Question $question)
    {
        $question->delete();
        return response()->json(null, 204);
    }
}