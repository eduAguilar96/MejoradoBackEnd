class Question < ApplicationRecord
  belongs_to :subject
  has_many :variables
  has_many :answers
  accepts_nested_attributes_for :variables, :allow_destroy => true
  accepts_nested_attributes_for :answers, :allow_destroy => true
  has_and_belongs_to_many :exams
end
