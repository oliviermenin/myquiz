import { Question } from "./question.model";

export interface Category {
  id: number;
  name: string;
  questions?: Question[];
}