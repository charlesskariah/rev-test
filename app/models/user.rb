class User < ApplicationRecord
  has_many :categories
  has_many :histories
  has_many :user_answers
  has_many :status
end
