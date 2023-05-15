class SubscriberMailer < ApplicationMailer
  def welcome_email(subscriber)
    @subscriber = subscriber
    mail(to: @subscriber.email, subject: "Welcome to our Newsletter")
  end

  def coupon_email(subscriber)
    @subscriber = subscriber
    mail(to: @subscriber.email, subject: "Here is your Coupon!")
  end
end
