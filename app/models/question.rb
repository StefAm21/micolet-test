class Question < ApplicationRecord
  default_scope { order(order: :asc) }
  has_many :answers

  def self.next(current_question)
    Question.find_by(order: current_question.order + 1)
  end
end
