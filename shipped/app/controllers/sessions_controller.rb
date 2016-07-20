class SessionsController < ApplicationController
  
  def index
  end

  def new
  end

  def create
    @user = User.authenticate(params[:username], params[:password])
      if @user 
        session[:user_id] = @user.id
        redirect_to @user
      else
        redirect_to :back
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
