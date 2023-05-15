require 'net/http'
require 'net/https'

class Subscriber < ApplicationRecord
  has_many :preferences
  has_many :campaigns, through: :preferences
  has_many :answers, class_name: "SubscriberAnswer"

  accepts_nested_attributes_for :preferences

  validates :email, presence: true, uniqueness: true
  # validates :preferences, presence: true
  # validate :check_email_score

  # after_create :send_welcome_email

  private

  def send_welcome_email
    SubscriberMailer.welcome_email(self).deliver_later
  end

  def make_abstract_request(email)
    #Todo: pasar api key a .env
    uri = URI("https://emailvalidation.abstractapi.com/v1/?api_key=599b5d66eca6482eb17dc425854496cd&email=#{email}")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request =  Net::HTTP::Get.new(uri)

    response = http.request(request)
    return response
  rescue StandardError => error
      puts "Error (#{ error.message })"
  end

  def check_email_score
    response = make_abstract_request(self.email)

    parsed_reponse = JSON.parse(response.body)
    score = parsed_reponse["quality_score"].to_f if parsed_reponse["quality_score"]

    errors.add(:email, "Not a valid email, please provide another one") if score && score < 0.7
  end
end
