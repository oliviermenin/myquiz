import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormArray, FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { Router, RouterModule } from '@angular/router';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatDividerModule } from '@angular/material/divider';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';

import { CategoryService } from '../../core/services/category.service';
import { QuestionService } from '../../core/services/question.service';
import { Category } from '../../core/models/category.model';
import { LoadingComponent } from '../../shared/components/loading/loading.component';

@Component({
  selector: 'app-quiz-create',
  standalone: true,
  imports: [
    CommonModule,
    RouterModule,
    ReactiveFormsModule,
    MatCardModule,
    MatFormFieldModule,
    MatInputModule,
    MatSelectModule,
    MatButtonModule,
    MatIconModule,
    MatCheckboxModule,
    MatDividerModule,
    MatSnackBarModule,
    LoadingComponent
  ],
  templateUrl: './quiz-create.component.html',
  styleUrl: './quiz-create.component.scss'
})
export class QuizCreateComponent {
  quizForm: FormGroup;
  categories: Category[] = [];
  loading = false;
  loadingCategories = true;
  
  constructor(
    private fb: FormBuilder,
    private categoryService: CategoryService,
    private questionService: QuestionService,
    private router: Router,
    private snackBar: MatSnackBar
  ) {
    this.quizForm = this.fb.group({
      categoryId: ['', Validators.required],
      question: ['', Validators.required],
      answers: this.fb.array([
        this.createAnswerGroup(),
        this.createAnswerGroup(),
        this.createAnswerGroup(),
        this.createAnswerGroup()
      ])
    });
    
    this.loadCategories();
  }
  
  loadCategories(): void {
    this.loadingCategories = true;
    
    this.categoryService.getCategories().subscribe({
      next: (categories) => {
        this.categories = categories;
        this.loadingCategories = false;
      },
      error: (error) => {
        this.snackBar.open(error.message || 'Failed to load categories', 'Close', {
          duration: 5000
        });
        this.loadingCategories = false;
      }
    });
  }
  
  createAnswerGroup(): FormGroup {
    return this.fb.group({
      text: ['', Validators.required],
      isCorrect: [false]
    });
  }
  
  get answers(): FormArray {
    return this.quizForm.get('answers') as FormArray;
  }
  
  onSubmit(): void {
    if (this.quizForm.invalid) {
      this.snackBar.open('Please fill all required fields', 'Close', {
        duration: 3000
      });
      return;
    }
    
    const hasCorrectAnswer = this.answers.controls.some(
      control => control.get('isCorrect')?.value === true
    );
    
    if (!hasCorrectAnswer) {
      this.snackBar.open('Please mark at least one answer as correct', 'Close', {
        duration: 3000
      });
      return;
    }
    
    this.loading = true;
    
    const questionData = {
      id_categorie: this.quizForm.value.categoryId,
      question: this.quizForm.value.question
    };
    
    this.questionService.createQuestion(questionData).subscribe({
      next: (question) => {
        const answerPromises = this.answers.controls.map((control, index) => {
          const answerData = {
            id_question: question.id,
            reponse: control.get('text')?.value,
            reponse_expected: control.get('isCorrect')?.value
          };
          
          return fetch(`${this.questionService['apiUrl'].replace('questions', 'reponses')}`, {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
              'Authorization': `Bearer ${localStorage.getItem('token')}`
            },
            body: JSON.stringify(answerData)
          });
        });
        
        Promise.all(answerPromises)
          .then(() => {
            this.snackBar.open('Question created successfully', 'Close', {
              duration: 3000
            });
            this.loading = false;
            this.router.navigate(['/quizzes', questionData.id_categorie]);
          })
          .catch(error => {
            this.snackBar.open(error.message || 'Failed to create answers', 'Close', {
              duration: 5000
            });
            this.loading = false;
          });
      },
      error: (error) => {
        this.snackBar.open(error.message || 'Failed to create question', 'Close', {
          duration: 5000
        });
        this.loading = false;
      }
    });
  }
}