import { Routes } from '@angular/router';

export const routes: Routes = [
  { 
    path: '', 
    redirectTo: '/dashboard', 
    pathMatch: 'full' 
  },
  { 
    path: 'dashboard', 
    loadComponent: () => import('./dashboard/dashboard/dashboard.component').then(m => m.DashboardComponent)
  },
  { 
    path: 'quizzes/:id', 
    loadComponent: () => import('./quiz/quiz-detail/quiz-detail.component').then(m => m.QuizDetailComponent)
  },
  { 
    path: 'play/:id', 
    loadComponent: () => import('./quiz/quiz-play/quiz-play.component').then(m => m.QuizPlayComponent)
  },
  { 
    path: 'results/:id', 
    loadComponent: () => import('./quiz/quiz-result/quiz-result.component').then(m => m.QuizResultComponent)
  },
  { 
    path: 'create-quiz', 
    loadComponent: () => import('./quiz/quiz-create/quiz-create.component').then(m => m.QuizCreateComponent)
  },
  { 
    path: 'leaderboard', 
    loadComponent: () => import('./dashboard/leaderboard/leaderboard.component').then(m => m.LeaderboardComponent)
  },
  { 
    path: '**', 
    redirectTo: '/dashboard' 
  }
];