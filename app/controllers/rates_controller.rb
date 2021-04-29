class RatesController < ApplicationController
  before_action :set_rate, only: [:update]

  def index
    rates = Rate.all.includes(:user)

    render json: rates, include: [:user], status: 200
  end

  def add_rate
    rate = Rate.create!(point: params[:point])
    
    render json: rate, status: 200

    rescue ActiveRecord::RecordInvalid => e
      return render json: {
        error: e.to_s
      }, status: 422
  end

  def report
    rates = Rate.all.group(:point).count

    [1,2,3,4,5].each do |value|
      unless rates[value]
        rates[value] = 0
      end
    end

    render json: rates, status: 200
  end

  def update
    user = User.find_by(email: params[:email])

    if !user
      @newUser = User.new(email: params[:email])
      @newUser.save
    else 
      @newUser = user
    end
    
    @rate.update!(user_id: @newUser[:id])

    render json: @rate, status: 200

    rescue ActiveRecord::RecordNotFound => e
      render json: {
        error: e.to_s,
      }, status: :bad_request
  end

  private

  def set_rate
    @rate = Rate.find(params[:id])

    rescue ActiveRecord::RecordNotFound => e
      render json: {
        error: e.to_s,
      }, status: :bad_request
  end
end
