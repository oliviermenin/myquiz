<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reponse extends Model
{
    use HasFactory;
    
    protected $table = 'reponse';
    protected $fillable = ['id_question', 'reponse', 'reponse_expected'];
    public $timestamps = false;
    
    public function question()
    {
        return $this->belongsTo(Question::class, 'id_question');
    }
}