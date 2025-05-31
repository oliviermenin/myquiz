export interface QuizResult {
  id?: number;
  user_id?: number;
  categorie_id: number;
  score: number;
  total_questions: number;
  percentage: number;
  time_taken: number;
  created_at?: string;
}