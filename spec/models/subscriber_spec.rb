require 'rails_helper'
require 'webmock/rspec'

RSpec.describe Subscriber, type: :model do
  before :each do
    Campaign.create!(name:"women")
    Campaign.create!(name:"men")
    Campaign.create!(name:"children")
  end

  describe "validations" do
    it "is valid with an API score greater than 0.7, and with at least one preference" do
      abstract_body = File.read('spec/support/fixtures/abstract_api_response_valid.json')
      email = "mail@mail.com"
      url = "https://emailvalidation.abstractapi.com/v1/?api_key=33001481c5e54c679ab20d33c4f1f097&email=#{email}"


          stub_request(:get, url).
          with(
            headers: {
           'Accept'=>'*/*',
           'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
           'Host'=>'emailvalidation.abstractapi.com',
           'User-Agent'=>'Ruby'
            }).
          to_return(status: 200, body: abstract_body, headers: {})

      subscriber = Subscriber.new(email:email)
      subscriber.campaigns << Campaign.last
      subscriber.save!

      expect(WebMock).to have_requested(:get, url)
    end

    it "is invalid with an API score lowen than 0.7" do
      abstract_body = File.read('spec/support/fixtures/abstract_api_response_invalid.json')
      email = "mail@mail.com"
      url = "https://emailvalidation.abstractapi.com/v1/?api_key=33001481c5e54c679ab20d33c4f1f097&email=#{email}"


          stub_request(:get, url).
          with(
            headers: {
           'Accept'=>'*/*',
           'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
           'Host'=>'emailvalidation.abstractapi.com',
           'User-Agent'=>'Ruby'
            }).
          to_return(status: 200, body: abstract_body, headers: {})

      subscriber = Subscriber.new(email:email)
      subscriber.campaigns << Campaign.last
      subscriber.valid?

      expect(WebMock).to have_requested(:get, url)
      expect(subscriber.valid?).to eq(false)
    end
  end
end
