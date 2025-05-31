<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Categorie extends Model
{
    use HasFactory;
    
    protected $table = 'categorie';
    protected $fillable = ['name'];
    
    public $timestamps = false;
    
    public function questions()
    {
        return $this->hasMany(Question::class, 'id_categorie');
    }

    public function quizResults()
    {
        return $this->hasMany(QuizResult::class, 'categorie_id');
    }
}