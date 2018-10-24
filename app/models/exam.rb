class Exam < ApplicationRecord
  belongs_to :subject
  has_many :text_fields
  has_and_belongs_to_many :questions
end
