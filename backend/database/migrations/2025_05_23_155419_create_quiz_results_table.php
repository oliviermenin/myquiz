<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('quiz_results', function (Blueprint $table) {
            $table->id();
            $table->string('user_name');
            $table->integer('categorie_id');
            $table->integer('score');
            $table->integer('total_questions');
            $table->decimal('percentage', 5, 2);
            $table->integer('time_taken');
            $table->timestamps();

            $table->foreign('categorie_id')->references('id')->on('categorie');
            $table->index(['categorie_id', 'percentage']);
        });
    }

    public function down()
    {
        Schema::dropIfExists('quiz_results');
    }
};