class Answer < ApplicationRecord
  belongs_to :subscriber
  belongs_to :question
end
