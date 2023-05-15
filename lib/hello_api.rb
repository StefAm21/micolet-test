
require 'net/http'
require 'net/https'

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

email = "example@example.com"
p make_abstract_request(email)
