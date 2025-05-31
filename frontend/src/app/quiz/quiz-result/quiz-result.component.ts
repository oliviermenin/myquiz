import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router, RouterModule } from '@angular/router';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { MatDividerModule } from '@angular/material/divider';

import { QuizResult } from '../../core/models/quiz-result.model';
import { CategoryService } from '../../core/services/category.service';

@Component({
  selector: 'app-quiz-result',
  standalone: true,
  imports: [
    CommonModule,
    RouterModule,
    MatCardModule,
    MatButtonModule,
    MatIconModule,
    MatProgressBarModule,
    MatDividerModule
  ],
  templateUrl: './quiz-result.component.html',
  styleUrl: './quiz-result.component.scss'
})
export class QuizResultComponent implements OnInit {
  result: QuizResult | null = null;
  categoryId: number | null = null;
  categoryName = '';
  
  constructor(
    private router: Router,
    private categoryService: CategoryService
  ) {
    const navigation = this.router.getCurrentNavigation();
    if (navigation?.extras.state) {
      this.result = navigation.extras.state['result'] as QuizResult;
    }
  }
  
  ngOnInit(): void {
    if (!this.result) {
      this.router.navigate(['/quizzes']);
      return;
    }
    
    this.categoryId = this.result.categorie_id;
    
    if (this.categoryId) {
      this.categoryService.getCategory(this.categoryId).subscribe(category => {
        this.categoryName = category.name;
      });
    }
  }
  
  formatTime(seconds: number): string {
    const minutes = Math.floor(seconds / 60);
    const remainingSeconds = seconds % 60;
    return `${minutes}:${remainingSeconds < 10 ? '0' : ''}${remainingSeconds}`;
  }
  
  getScoreColor(): string {
    if (!this.result) return '';
    
    const percentage = this.result.percentage;
    if (percentage >= 80) return 'success';
    if (percentage >= 60) return 'good';
    if (percentage >= 40) return 'average';
    return 'poor';
  }
  
  getScoreMessage(): string {
    if (!this.result) return '';
    
    const percentage = this.result.percentage;
    if (percentage >= 80) return 'Excellent! You did great!';
    if (percentage >= 60) return 'Good job! You passed the quiz.';
    if (percentage >= 40) return 'Not bad, but you can do better.';
    return 'You need more practice. Try again!';
  }
  
  retakeQuiz(): void {
    if (this.categoryId) {
      this.router.navigate(['/play', this.categoryId]);
    }
  }
  
  goToCategories(): void {
    this.router.navigate(['/quizzes']);
  }
}