import { Answer } from './answer.model';

export interface Question {
  id: number;
  id_categorie: number;
  question: string;
  reponses?: Answer[];
}