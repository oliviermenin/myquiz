<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\CategorieController;
use App\Http\Controllers\API\QuestionController;
use App\Http\Controllers\API\ReponseController;
use App\Http\Controllers\API\QuizController;

Route::apiResource('categories', CategorieController::class);

Route::get('/quiz/categories', [QuizController::class, 'getCategories']);
Route::get('/quiz/category/{categorieId}', [QuizController::class, 'getQuizByCategory']);
Route::post('/quiz/submit', [QuizController::class, 'submitQuiz']);
Route::get('/quiz/results', [QuizController::class, 'getUserResults']);
Route::get('/quiz/leaderboard', [QuizController::class, 'getLeaderboard']);
Route::get('/quiz/leaderboard/{categorieId}', [QuizController::class, 'getLeaderboardByCategory']);
Route::get('/quiz/stats', [QuizController::class, 'getStats']);

Route::apiResource('questions', QuestionController::class);
Route::apiResource('reponses', ReponseController::class);