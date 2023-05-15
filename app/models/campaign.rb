class Campaign < ApplicationRecord
  validates :name, presence: true
  has_many :preferences
  has_many :subscribers, through: :preferences

  def uniq_type
    name.split("'").first.downcase
  end
end
