import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router, RouterModule } from '@angular/router';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatListModule } from '@angular/material/list';
import { MatDividerModule } from '@angular/material/divider';
import { MatChipsModule } from '@angular/material/chips';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';

import { CategoryService } from '../../core/services/category.service';
import { Category } from '../../core/models/category.model';
import { LoadingComponent } from '../../shared/components/loading/loading.component';
import { ErrorComponent } from '../../shared/components/error/error.component';

@Component({
  selector: 'app-quiz-detail',
  standalone: true,
  imports: [
    CommonModule,
    RouterModule,
    MatCardModule,
    MatButtonModule,
    MatIconModule,
    MatListModule,
    MatDividerModule,
    MatChipsModule,
    MatSnackBarModule,
    LoadingComponent,
    ErrorComponent
  ],
  templateUrl: './quiz-detail.component.html',
  styleUrl: './quiz-detail.component.scss'
})

export class QuizDetailComponent implements OnInit {
  categoryId!: number;
  category: any = null;
  loading = true;
  error = false;
  errorMessage = '';

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private categoryService: CategoryService
  ) {}

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.categoryId = Number(id);
      this.loadCategory();
    } else {
      this.error = true;
      this.errorMessage = 'ID de catégorie manquant';
    }
  }

  loadCategory(): void {
    this.loading = true;
    this.error = false;
    
    this.categoryService.getCategory(this.categoryId)
      .subscribe({
        next: (data) => {
          this.category = data;
          this.loading = false;
        },
        error: (error) => {
          this.errorMessage = error.message || 'Erreur lors du chargement de la catégorie';
          this.error = true;
          this.loading = false;
        }
      });
  }

  startQuiz(): void {
    if (this.categoryId) {
      this.router.navigate(['/play', this.categoryId]);
    } else {
      console.error('ID de catégorie manquant');
    }
  }

  goBack(): void {
    this.router.navigate(['/dashboard']);
  }
}