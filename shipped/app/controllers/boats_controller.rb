class BoatsController < ApplicationController
  
  before_action :require_user

  def index
    @boats = Boat.where(:user_id => current_user) 
    @boat = Boat.new
  end

  def show
    @boat = Boat.find(params[:id])

  end

  def new
    @boat = Boat.new
    
  end

  def create
      
       @boat = Boat.new(boat_params)
       
       if @boat.save
       redirect_to @boat
      else
        render 'new'
      end
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
      if @boat.update(boat_params.permit(:name, :containers, :location))
        redirect_to @boat
      else 
        render 'edit'
      end
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy

    redirect_to user_path(current_user) 
  end



  private 
    def require_user
      if current_user
        true 
      else
        false
      end
    end

    def boat_params
      params.require(:boat).permit(:name, :user_id, :containers, :location).merge(user: current_user)
    end
end

