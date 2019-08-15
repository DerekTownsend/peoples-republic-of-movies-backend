class Api::V1::UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def profile
    user = current_user
    render json: UserSerializer.new(user).to_serialized_json, status: :accepted
  end

  def create
    # user = User.new(user_params)
    # puts user
    user = User.create(user_params)

    if user.valid?
      token = encode_token(user_id: user.id)
      render json: UserSerializer.new(user, token).to_serialized_json, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :email, :password, :admin)
  end

end
