class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
      if @user.save
       redirect_to boats_url
      else
        redirect_to :back
      end
  end

  def show
    @user = User.find(params[:id])
    @boats = @user.boats

      respond_to do |format|
        format.html
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  # def destroy
  # end

  private 
    def user_params
      params.require(:user).permit(:username, :password, :name)
    end 
end
