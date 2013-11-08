class ListBootsController < ApplicationController

  def new
    @list_boot = ListBoot.new
  end
  
  def create
    @list_boot = ListBoot.create(params[:list_boot])
    
    redirect_to list_boots_path
  end
  
  def edit
    @list_boot = ListBoot.find(params[:id])
  end
  
  def update
    @list_boot = ListBoot.find(params[:id])
    
    @list_boot.update_attributes(params[:list_boot])
    
    redirect_to list_boots_path
  end
  
  def index
    @list_boots = ListBoot.all
  end
  
  def destroy
    @list_boot = ListBoot.find(params[:id])
    
    @list_boot.destroy
    
    redirect_to list_boots_path
  end

end
