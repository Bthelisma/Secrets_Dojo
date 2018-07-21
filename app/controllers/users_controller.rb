class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(email: params[:email], name: params[:name], password: params[:password], password_confirmation: params[:pwd_confirmation])

    if user.valid?
      redirect_to '/show'
    else
      render json: user.errors
    end
  end

  def show
  end
end
