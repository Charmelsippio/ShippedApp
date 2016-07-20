class JobsController < ApplicationController
  def index
    @boat = Boat.find(params[:boat_id])
  end

  def new
    @boat = Boat.find(params[:boat_id])
    @job = Job.new
  end

  def create
    @boat = Boat.find(params[:boat_id])
    @job = Job.new(job_params)
      if @job.save
        redirect_to boat_job_path(@boat, @job)
      else
        redirect_to 'new'
      end
  end

  def edit
    @job = Job.find(params[:id]) 
    
  end

  def show
    @boat = Boat.find(params[:boat_id])

    @job = Job.find(params[:id])
    @jobs = Job.all
  end

  def update
    @job = Job.find(params[:id])
      if @job.update(job_params.permit(:name, :cost, :description, :origin, :destination))
        redirect_to @job
      else
        render 'edit'
      end
  end

  def destroy
    @job = Job.find(params[:boat_id])
    @job.destroy

    redirect_to user_path(current_user)
  end


  private 
    def job_params
      params.require(:job).permit(:name, :cost, :description, :origin, :destination, :boat_id)
    end
end
