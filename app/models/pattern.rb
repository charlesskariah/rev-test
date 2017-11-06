class Pattern < ApplicationRecord
  has_many :pattern_questions
  has_many :questions, through: :pattern_questions

  def next_priority(current_count = 0)
    if current_count < self.max_priority
      next_question_count = current_count + 1
    end  
  end

  def next_question(priority)
    question_id = self.pattern_questions.where(priority: priority).first.question_id
    question = self.questions.where(id: question_id).first
  end

end
