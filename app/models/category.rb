class Category < ApplicationRecord
  belongs_to :rule
  has_many :nudges
end
