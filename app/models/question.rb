class Question < ApplicationRecord
  has_many :pattern_questions
  has_many :patterns, through: :pattern_questions
  has_many :options
end
