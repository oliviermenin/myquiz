<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QuizResult extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_name',
        'categorie_id',
        'score',
        'total_questions',
        'percentage',
        'time_taken'
    ];

    protected $casts = [
        'percentage' => 'decimal:2'
    ];

    public function categorie()
    {
        return $this->belongsTo(Categorie::class);
    }
}