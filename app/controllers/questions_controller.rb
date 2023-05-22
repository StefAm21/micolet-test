class QuestionsController < ApplicationController
  def show
    @subscriber = Subscriber.find(params[:subscriber_id])
    @question = Question.find(params[:id])
    @answer = Answer.new
  end
end
