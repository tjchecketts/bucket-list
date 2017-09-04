class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def show
    #don't need anything in here because the before_action happens
  end

  def new
    @destination = Destination.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end 

  def update
    if @destination.update(destination_params)
      redirect_to destination_path(@destination)
    else
      render partial: "form"
    end 
  end 

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      redirect_to destination_path(@destination)
    else 
      render partial: "form"
    end 
  end 

  def destroy
    @destination.destroy
    redirect_to destinations_path
  end 

  private 
    def destination_sub
      @destination = Destination.find(params[:id])
    end 
    #put encryption stuff here if necessary

    def destination_params
      params.require(:destination).permit(:name)
    end
end
