class SessionsController < ApplicationController
  def new
  end

  def login
    @users = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if User.find_by_email(params[:email]) == true
      if errors?
        flash[:error] = "you are not registered yet! Please do so!"
        redirect_to '/users/new' #pathing will be explained later
      else
        flash[:success] = "You did it!"
        redirect_to '/users/:id'
      end
    end
  end
end
