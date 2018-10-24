class Question < ApplicationRecord
  belongs_to :subject
  has_many :variables
  has_many :answers
  has_and_belongs_to_many :exams
end
