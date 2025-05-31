import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Question } from '../models/question.model';
import { QuizResult } from '../models/quiz-result.model';
import { environment } from '../../../environnements/environment';

@Injectable({
  providedIn: 'root'
})
export class QuizService {
  private apiUrl = 'http://localhost:8000/api';

  constructor(private http: HttpClient) { }

  getCategories(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/quiz/categories`);
  }

  getQuizByCategory(categoryId: number): Observable<{categorie: string, questions: Question[]}> {
    return this.http.get<{categorie: string, questions: Question[]}>(`${this.apiUrl}/quiz/category/${categoryId}`);
  }

  submitQuiz(data: {
    user_name: string;
    categorie_id: number;
    answers: { question_id: number; answer_id: number }[];
    time_taken: number;
  }): Observable<QuizResult> {
    return this.http.post<QuizResult>(`${this.apiUrl}/quiz/submit`, data);
  }
  
  getUserResults(userName?: string): Observable<QuizResult[]> {
    const params = userName ? `?user_name=${userName}` : '';
    return this.http.get<QuizResult[]>(`${this.apiUrl}/quiz/results${params}`);
  }
  
  getLeaderboard(): Observable<{leaderboard: any[]}> {
    return this.http.get<{leaderboard: any[]}>(`${this.apiUrl}/quiz/leaderboard`);
  }
  
  getLeaderboardByCategory(categoryId: number): Observable<{leaderboard: any[]}> {
    return this.http.get<{leaderboard: any[]}>(`${this.apiUrl}/quiz/leaderboard/${categoryId}`);
  }

  getStats(): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/quiz/stats`);
  }
}