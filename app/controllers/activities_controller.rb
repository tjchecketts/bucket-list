class ActivitiesController < ApplicationController
  def index
    @activites = Activity.all
  end

  def show
    #don't need anything in here because the before_action happens
  end

  def new
    @activity = Activity.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end 

  def update
    if @activity.update(activities_params)
      redirect_to activity_path(@activity)
    else
      render partial: "form"
    end 
  end 

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to sub_path(@activity)
    else 
      render partial: "form"
    end 
  end 

  def destroy
    @activity.destroy
    redirect_to activities_path
  end 

  private 
    def set_activity
      @activity = Activity.find(params[:id])
    end 
    #put encryption stuff here if necessary

    def activity_params
      params.require(:activity).permit(:name)
    end
end
