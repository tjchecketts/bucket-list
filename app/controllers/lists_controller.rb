class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    #don't need anything in here because the before_action happens
  end

  def new
    @list = List.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end 

  def update
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render partial: "form"
    end 
  end 

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else 
      render partial: "form"
    end 
  end 

  def destroy
    List.find(params[:id]).destroy
    redirect_to lists_path
  end 

  private 
    def set_list
      @list = List.find(params[:id])
    end 
    #put encryption stuff here if necessary

    def list_params
      params.require(:list).permit(:name)
    end
end
