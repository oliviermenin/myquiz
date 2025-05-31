import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatCardModule } from '@angular/material/card';
import { MatTableModule } from '@angular/material/table';
import { MatSortModule, Sort } from '@angular/material/sort';
import { MatIconModule } from '@angular/material/icon';
import { MatChipsModule } from '@angular/material/chips';

import { QuizService } from '../../core/services/quiz.service';
import { LoadingComponent } from '../../shared/components/loading/loading.component';
import { ErrorComponent } from '../../shared/components/error/error.component';

interface LeaderboardEntry {
  rank: number;
  id: number;
  user_name: string;
  categorie: string;
  score: number;
  total_questions: number;
  percentage: number;
  time_taken: number;
  created_at: string;
}

@Component({
  selector: 'app-leaderboard',
  standalone: true,
  imports: [
    CommonModule,
    MatCardModule,
    MatTableModule,
    MatSortModule,
    MatIconModule,
    MatChipsModule,
    LoadingComponent,
    ErrorComponent
  ],
  templateUrl: './leaderboard.component.html',
  styleUrl: './leaderboard.component.scss'
})
export class LeaderboardComponent implements OnInit {
  leaderboardData: LeaderboardEntry[] = [];
  displayedColumns: string[] = ['rank', 'user_name', 'categorie', 'percentage', 'score', 'time_taken'];
  loading = true;
  error = false;
  
  constructor(private quizService: QuizService) {}
  
  ngOnInit(): void {
    this.loadLeaderboard();
  }
  
  loadLeaderboard(): void {
    this.loading = true;
    this.error = false;
    
    this.quizService.getLeaderboard()
      .subscribe({
        next: (response: { leaderboard: any[] }) => {
          // Accéder au tableau leaderboard dans la réponse
          this.leaderboardData = response.leaderboard.map((entry: any, index: number) => ({
            ...entry,
            rank: index + 1
          }));
          this.loading = false;
        },
        error: (error) => {
          console.error('Erreur lors du chargement du leaderboard:', error);
          this.error = true;
          this.loading = false;
        }
      });
  }
  
  sortData(sort: Sort): void {
    const data = [...this.leaderboardData];
    
    if (!sort.active || sort.direction === '') {
      // Reset ranks if sorting is cleared
      this.leaderboardData = data.map((entry, index) => ({
        ...entry,
        rank: index + 1
      }));
      return;
    }
    
    this.leaderboardData = data.sort((a, b) => {
      const isAsc = sort.direction === 'asc';
      switch (sort.active) {
        case 'user_name': return this.compare(a.user_name, b.user_name, isAsc);
        case 'categorie': return this.compare(a.categorie, b.categorie, isAsc);
        case 'percentage': return this.compare(a.percentage, b.percentage, isAsc);
        case 'score': return this.compare(a.score, b.score, isAsc);
        case 'time_taken': return this.compare(a.time_taken, b.time_taken, isAsc);
        default: return 0;
      }
    });
    
    // Update ranks after sorting
    this.leaderboardData = this.leaderboardData.map((entry, index) => ({
      ...entry,
      rank: index + 1
    }));
  }
  
  compare(a: number | string, b: number | string, isAsc: boolean): number {
    return (a < b ? -1 : 1) * (isAsc ? 1 : -1);
  }
  
  getRankClass(rank: number): string {
    if (rank === 1) return 'rank-first';
    if (rank === 2) return 'rank-second';
    if (rank === 3) return 'rank-third';
    return '';
  }
  
  getScoreClass(score: number): string {
    if (score >= 80) return 'score-high';
    if (score >= 60) return 'score-medium';
    return 'score-low';
  }
  
  formatTime(seconds: number): string {
    const minutes = Math.floor(seconds / 60);
    const remainingSeconds = seconds % 60;
    return `${minutes}:${remainingSeconds < 10 ? '0' : ''}${remainingSeconds}`;
  }
}