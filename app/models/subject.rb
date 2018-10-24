class Subject < ApplicationRecord
  has_many :exams
  has_many :questions
end
