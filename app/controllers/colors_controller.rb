class ColorsController < ApplicationController

  def new
    @color = Color.new
  end
  
  def create
    @color = Color.create(params[:color])
    
    redirect_to colors_path
  end
  
  def edit
    @color = Color.find(params[:id])
  end
  
  def update
    @color = Color.find(params[:id])
    
    @color.update_attributes(params[:color])
    
    redirect_to colors_path
  end
  
  def index
    @colors = Color.all
  end
  
  def destroy
    @color = Color.find(params[:id])
    
    @color.destroy
    
    redirect_to colors_path
  end

end
