<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Categorie;
use App\Models\Question;
use App\Models\Reponse;
use App\Models\QuizResult;
use Illuminate\Http\Request;

class QuizController extends Controller
{
    /**
     * 
     * @param int $categorieId
     * @return \Illuminate\Http\JsonResponse
     */
    public function getQuizByCategory($categorieId)
    {
        $categorie = Categorie::with(['questions.reponses'])->findOrFail($categorieId);
        
        $questions = $categorie->questions->shuffle();
        
        return response()->json([
            'categorie' => $categorie->name,
            'questions' => $questions
        ]);
    }

    /**
     * 
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function submitQuiz(Request $request)
    {
        $request->validate([
            'user_name' => 'required|string|max:255',
            'categorie_id' => 'required|exists:categorie,id',
            'answers' => 'required|array',
            'answers.*.question_id' => 'required|exists:question,id',
            'answers.*.answer_id' => 'required|exists:reponse,id',
            'time_taken' => 'required|integer|min:1'
        ]);

        $score = 0;
        $totalQuestions = count($request->answers);

        foreach ($request->answers as $answer) {
            $reponse = Reponse::find($answer['answer_id']);
            if ($reponse && $reponse->reponse_expected) {
                $score++;
            }
        }

        $percentage = ($score / $totalQuestions) * 100;
        $roundedPercentage = round($percentage, 2);

        $quizResult = QuizResult::create([
            'user_name' => $request->user_name,
            'categorie_id' => $request->categorie_id,
            'score' => $score,
            'total_questions' => $totalQuestions,
            'percentage' => $roundedPercentage,
            'time_taken' => $request->time_taken
        ]);

        return response()->json([
            'id' => $quizResult->id,
            'user_name' => $request->user_name,
            'score' => $score,
            'total_questions' => $totalQuestions,
            'percentage' => $roundedPercentage,
            'time_taken' => $request->time_taken,
            'created_at' => $quizResult->created_at->format('Y-m-d H:i:s')
        ]);
    }

    /**
     * 
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getUserResults(Request $request)
    {
        $query = QuizResult::with('categorie');
        
        if ($request->has('user_name')) {
            $query->where('user_name', $request->query('user_name'));
        }
        
        if ($request->has('categorie_id')) {
            $query->where('categorie_id', $request->query('categorie_id'));
        }
        
        $results = $query->orderBy('created_at', 'desc')->get();

        return response()->json($results->map(function ($result) {
            return [
                'id' => $result->id,
                'user_name' => $result->user_name,
                'categorie' => $result->categorie->name,
                'categorie_id' => $result->categorie_id,
                'score' => $result->score,
                'total_questions' => $result->total_questions,
                'percentage' => $result->percentage,
                'time_taken' => $result->time_taken,
                'created_at' => $result->created_at->format('Y-m-d H:i:s')
            ];
        }));
    }

    /**
     * 
     * @param int|null $categorieId
     * @return \Illuminate\Http\JsonResponse
     */
    public function getLeaderboard($categorieId = null)
    {
        $query = QuizResult::with('categorie');

        if ($categorieId) {
            $query->where('categorie_id', $categorieId);
        }

        $leaderboard = $query
            ->orderBy('percentage', 'desc')
            ->orderBy('time_taken', 'asc')
            ->limit(10)
            ->get();

        return response()->json([
            'leaderboard' => $leaderboard->map(function ($result) {
                return [
                    'id' => $result->id,
                    'user_name' => $result->user_name,
                    'categorie' => $result->categorie->name,
                    'categorie_id' => $result->categorie_id,
                    'score' => $result->score,
                    'total_questions' => $result->total_questions,
                    'percentage' => $result->percentage,
                    'time_taken' => $result->time_taken,
                    'created_at' => $result->created_at->format('Y-m-d H:i:s')
                ];
            })
        ]);
    }

    /**
     * 
     * @param int $categorieId
     * @return \Illuminate\Http\JsonResponse
     */
    public function getLeaderboardByCategory($categorieId)
    {
        return $this->getLeaderboard($categorieId);
    }
    
    /**
     * 
     * @return \Illuminate\Http\JsonResponse
     */
    public function getCategories()
    {
        $categories = Categorie::all();
        return response()->json($categories);
    }
    
    /**
     * 
     * @return \Illuminate\Http\JsonResponse
     */
    public function getStats()
    {
        $totalQuizzes = QuizResult::count();
        $averageScore = QuizResult::avg('percentage');
        $bestScore = QuizResult::max('percentage');
        $fastestTime = QuizResult::min('time_taken');
        
        $categoryStats = Categorie::withCount(['quizResults as attempts'])
            ->withAvg('quizResults as average_score', 'percentage')
            ->get();
            
        return response()->json([
            'total_quizzes' => $totalQuizzes,
            'average_score' => round($averageScore, 2),
            'best_score' => $bestScore,
            'fastest_time' => $fastestTime,
            'categories' => $categoryStats
        ]);
    }
}