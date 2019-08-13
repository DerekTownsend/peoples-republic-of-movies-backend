class Api::V1::UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def profile
    render json: { user: current_user }, status: :accepted
  end

  def create
    # user = User.new(user_params)
    # puts user
    user = User.create(user_params)

    if user.valid?
      token = encode_token(user_id: user.id)
      render json: { user: user, jwt: token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :email, :password, :admin)
  end

end
