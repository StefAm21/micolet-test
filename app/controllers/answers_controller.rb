class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    subscriber = @answer.subscriber
    current_question = @answer.question
    next_question = Question.next(current_question)
    if @answer.save
      if next_question
        redirect_to subscriber_question_path(subscriber, next_question)
      else
        subscriber.update(coupon: SecureRandom.alphanumeric(10))
        redirect_to thanks_subscriber_path(subscriber)
        SubscriberMailer.coupon_email(subscriber).deliver_later
      end
    else
      render 'questions/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id, :subscriber_id)
  end
end
