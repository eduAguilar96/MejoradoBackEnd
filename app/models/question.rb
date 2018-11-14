class Question < ApplicationRecord
  belongs_to :subject
  has_many :variables, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :variables, :allow_destroy => true
  accepts_nested_attributes_for :answers, :allow_destroy => true
  has_and_belongs_to_many :exams
end
