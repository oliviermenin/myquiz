import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatDividerModule } from '@angular/material/divider';
import { MatChipsModule } from '@angular/material/chips';

import { CategoryService } from '../../core/services/category.service';
import { QuizService } from '../../core/services/quiz.service';
import { Category } from '../../core/models/category.model';
import { QuizResult } from '../../core/models/quiz-result.model';
import { LoadingComponent } from '../../shared/components/loading/loading.component';
import { ErrorComponent } from '../../shared/components/error/error.component';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [
    CommonModule,
    RouterModule,
    MatCardModule,
    MatButtonModule,
    MatIconModule,
    MatDividerModule,
    MatChipsModule,
    LoadingComponent,
    ErrorComponent
  ],
  templateUrl: './dashboard.component.html',
  styleUrl: './dashboard.component.scss'
})
export class DashboardComponent implements OnInit {
  categories: Category[] = [];
  recentResults: QuizResult[] = [];
  loadingCategories = true;
  loadingResults = true;
  errorCategories = false;
  errorResults = false;
  
  constructor(
    private categoryService: CategoryService,
    private quizService: QuizService
    // Supprimé authService
  ) {}
  
  ngOnInit(): void {
    this.loadCategories();
    this.loadRecentResults();
  }
  
  loadCategories(): void {
    this.loadingCategories = true;
    this.errorCategories = false;
    
    this.categoryService.getCategories()
      .subscribe({
        next: (categories) => {
          this.categories = categories.slice(0, 4);
          this.loadingCategories = false;
        },
        error: () => {
          this.errorCategories = true;
          this.loadingCategories = false;
        }
      });
  }
  
  loadRecentResults(): void {
    this.loadingResults = true;
    this.errorResults = false;
    
    this.quizService.getUserResults()
      .subscribe({
        next: (results) => {
          this.recentResults = results.slice(0, 5);
          this.loadingResults = false;
        },
        error: () => {
          this.errorResults = true;
          this.loadingResults = false;
        }
      });
  }
  
  formatTime(seconds: number): string {
    const minutes = Math.floor(seconds / 60);
    const remainingSeconds = seconds % 60;
    return `${minutes}:${remainingSeconds < 10 ? '0' : ''}${remainingSeconds}`;
  }
  
  getScoreClass(percentage: number): string {
    if (percentage >= 80) return 'success';
    if (percentage >= 60) return 'good';
    if (percentage >= 40) return 'average';
    return 'poor';
  }
}