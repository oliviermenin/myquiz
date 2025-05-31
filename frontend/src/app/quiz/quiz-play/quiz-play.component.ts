import { Component, OnDestroy, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatRadioModule } from '@angular/material/radio';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import { MatDividerModule } from '@angular/material/divider';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';

import { QuizService } from '../../core/services/quiz.service';
import { Question } from '../../core/models/question.model';
import { Answer } from '../../core/models/answer.model';
import { LoadingComponent } from '../../shared/components/loading/loading.component';
import { ErrorComponent } from '../../shared/components/error/error.component';
import { Subscription, interval } from 'rxjs';

@Component({
  selector: 'app-quiz-play',
  standalone: true,
  imports: [
    CommonModule,
    RouterModule,
    FormsModule,
    MatCardModule,
    MatButtonModule,
    MatIconModule,
    MatRadioModule,
    MatProgressBarModule,
    MatSnackBarModule,
    MatDividerModule,
    MatFormFieldModule,
    MatInputModule,
    LoadingComponent,
    ErrorComponent
  ],
  templateUrl: './quiz-play.component.html',
  styleUrl: './quiz-play.component.scss'
})
export class QuizPlayComponent implements OnInit, OnDestroy {
  categoryId!: number;
  categoryName = '';
  questions: Question[] = [];
  currentQuestionIndex = 0;
  selectedAnswers: { [key: number]: number } = {};
  
  userName: string = '';
  quizStarted = false;
  
  timeLeft = 0;
  timerSubscription?: Subscription;
  
  loading = true;
  error = false;
  errorMessage = '';
  quizCompleted = false;
  
  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private quizService: QuizService,
    private snackBar: MatSnackBar
  ) {}
  
  ngOnInit(): void {
    this.categoryId = Number(this.route.snapshot.paramMap.get('id'));
    this.loadQuiz();
  }
  
  ngOnDestroy(): void {
    this.stopTimer();
  }
  
  loadQuiz(): void {
    this.loading = true;
    this.error = false;
    
    this.quizService.getQuizByCategory(this.categoryId)
      .subscribe({
        next: (data) => {
          this.categoryName = data.categorie;
          this.questions = data.questions;
          this.loading = false;
        },
        error: (error) => {
          this.errorMessage = error.message || 'Failed to load quiz';
          this.error = true;
          this.loading = false;
        }
      });
  }
  
  startQuiz(): void {
    if (!this.userName.trim()) {
      this.snackBar.open('Veuillez entrer votre nom', 'Fermer', {
        duration: 3000
      });
      return;
    }
    
    this.quizStarted = true;
    this.startTimer();
  }
  
  startTimer(): void {
    this.timeLeft = 0;
    this.timerSubscription = interval(1000).subscribe(() => {
      this.timeLeft++;
    });
  }
  
  stopTimer(): void {
    if (this.timerSubscription) {
      this.timerSubscription.unsubscribe();
    }
  }
  
  formatTime(seconds: number): string {
    const minutes = Math.floor(seconds / 60);
    const remainingSeconds = seconds % 60;
    return `${minutes}:${remainingSeconds < 10 ? '0' : ''}${remainingSeconds}`;
  }
  
  get currentQuestion(): Question | undefined {
    return this.questions[this.currentQuestionIndex];
  }
  
  get selectedAnswer(): number | null {
    return this.currentQuestion ? this.selectedAnswers[this.currentQuestion.id] || null : null;
  }
  
  set selectedAnswer(value: number | null) {
    if (this.currentQuestion && value !== null) {
      this.selectedAnswers[this.currentQuestion.id] = value;
    }
  }
  
  get isLastQuestion(): boolean {
    return this.currentQuestionIndex === this.questions.length - 1;
  }
  
  nextQuestion(): void {
    if (!this.selectedAnswer) {
      this.snackBar.open('Veuillez sélectionner une réponse', 'Fermer', {
        duration: 3000
      });
      return;
    }
    
    if (this.isLastQuestion) {
      this.submitQuiz();
    } else {
      this.currentQuestionIndex++;
    }
  }
  
  previousQuestion(): void {
    if (this.currentQuestionIndex > 0) {
      this.currentQuestionIndex--;
    }
  }
  
  submitQuiz(): void {
    this.stopTimer();
    
    const answers = Object.entries(this.selectedAnswers).map(([questionId, answerId]) => ({
      question_id: Number(questionId),
      answer_id: answerId
    }));
    
    this.quizService.submitQuiz({
      user_name: this.userName,
      categorie_id: this.categoryId,
      answers,
      time_taken: this.timeLeft
    }).subscribe({
      next: (result) => {
        this.router.navigate(['/results', this.categoryId], { state: { result } });
      },
      error: (error) => {
        this.snackBar.open(error.message || 'Échec de la soumission du quiz', 'Fermer', {
          duration: 5000
        });
      }
    });
  }
}