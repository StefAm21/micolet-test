class Campaign < ApplicationRecord
  validates :name, presence: true
  has_many :preferences
  has_many :subscribers, through: :preferences
end
