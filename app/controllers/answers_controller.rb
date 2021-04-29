class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :update, :delete]

  def index
    answers = Answer.all.includes(:user, :question)

    render json: answers, include: [:user, :question], status: 200
  end

  def create
    questions_ids = params[:questions].map do |v|
      v[:id]
    end

    user = User.find_by!(email: params[:email])

    Question.find(questions_ids)

    params[:questions].each do |v|
      Answer.create!(user_id: user[:id], question_id: v[:id], content: v[:answer])
    end

    render json: {} , status: 200

    rescue ActiveRecord::RecordNotFound => e
      render json: {
        error: e.to_s,
      }, status: :bad_request
  end

  def show
    render json: @answer, include: [:user, :question] , status: 200
  end

  def delete
    @answer.destroy!()

    render json: {}, status: 200

    rescue Exception => e
      return render json: {
        error: e.to_s,
      }, status: :unprocessable_entity
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])

    rescue ActiveRecord::RecordNotFound => e
      render json: {
        error: e.to_s,
      }, status: :bad_request
  end
end
