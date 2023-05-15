class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new

    @campaigns = Campaign.all.order(name: :desc)
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      redirect_to 'https://f3acxl7a4jh.typeform.com/to/KRfXqzoM', allow_other_host: true #root_path, notice: 'Subscribed!'
    else
      @campaigns = Campaign.all
      render :new
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email, preferences_attributes: [:id, :campaign_id])
  end
end
