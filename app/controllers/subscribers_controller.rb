class SubscribersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:typeform_webhook]
  def new
    @subscriber = Subscriber.new

    @campaigns = Campaign.all.order(name: :desc)
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      redirect_to survey_subscriber_path(@subscriber) #'https://f3acxl7a4jh.typeform.com/to/KRfXqzoM', allow_other_host: true #root_path, notice: 'Subscribed!'
    else
      @campaigns = Campaign.all
      render :new
    end
  end

  def thanks
    @subscriber = Subscriber.find(params[:id])
  end

  def typeform_webhook
    # Here instead of using the method subscriber.find, it was more practical to use subscriber.last because we
    # have limited amount of answers in the free plan of Typeform
    subscriber = Subscriber.last
    if params["form_response"]["answers"]
      params["form_response"]["answers"].each do |answer|
        SubscriberAnswer.create(description: answer["text"],
                                subscriber: subscriber,
                                typeform_question_reference: answer["field"]["ref"])
      end
    end
    subscriber.update(coupon: SecureRandom.alphanumeric(10))
    SubscriberMailer.coupon_email(subscriber).deliver_later
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email, preferences_attributes: [:id, :campaign_id])
  end
end
