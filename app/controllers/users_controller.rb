class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :delete]

  def index
    users = User.all
    render json: users, status: 200
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: 200
    else
      render json: { error: user.errors }, status: 422
    end
  end

  def show
    render json: @user, status: 200
  end

  def update
    @user.update!(user_params)

    render json: @user, status: 200

    rescue Exception => e
      return render json: {
        error: e.to_s,
        user: nil
      }, status: :unprocessable_entity
  end

  def delete
    @user.destroy!()

    render json: {}, status: 200

    rescue Exception => e
      return render json: {
        error: e.to_s,
        user: nil
      }, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end

  def set_user
    @user = User.find(params[:id])

    rescue ActiveRecord::RecordNotFound => e
      render json: {
        error: e.to_s,
        user: nil
      }, status: :bad_request
  end
end
