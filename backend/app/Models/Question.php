<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    use HasFactory;
    
    protected $table = 'question';
    protected $fillable = ['id_categorie', 'question'];
    public $timestamps = false;
    
    public function categorie()
    {
        return $this->belongsTo(Categorie::class, 'id_categorie');
    }
    
    public function reponses()
    {
        return $this->hasMany(Reponse::class, 'id_question');
    }
}