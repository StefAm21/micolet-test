class Preference < ApplicationRecord
  belongs_to :subscriber
  belongs_to :campaign
end
