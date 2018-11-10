class Exam < ApplicationRecord
  belongs_to :subject
  has_many :text_fields
  accepts_nested_attributes_for :text_fields, :allow_destroy => true
  has_and_belongs_to_many :questions
end
