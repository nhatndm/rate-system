class QuestionController < ApplicationController
  before_action :set_question, only: [:show, :update, :delete]

  def index
    questions = Question.all
    render json: questions, status: 200
  end

  def create
    question = Question.new(question_params)

    if question.save
      render json: question, status: 200
    else
      render json: { error: question.errors }, status: 422
    end
  end

  def show
    render json: @question, status: 200
  end

  def update
    @question.update!(question_params)

    render json: @question, status: 200

    rescue Exception => e
      return render json: {
        error: e.to_s,
      }, status: :unprocessable_entity
  end

  def delete
    @question.destroy!()

    render json: {}, status: 200

    rescue Exception => e
      return render json: {
        error: e.to_s,
      }, status: :unprocessable_entity
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end

  def set_question
    @question = Question.find(params[:id])

    rescue ActiveRecord::RecordNotFound => e
      render json: {
        error: e.to_s,
      }, status: :bad_request
  end
end
