class Variable < ApplicationRecord
  belongs_to :question
  has_and_belongs_to_many :answers
end