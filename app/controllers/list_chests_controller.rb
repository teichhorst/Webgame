class ListChestsController < ApplicationController

  def new
    @list_chest = ListChest.new
  end
  
  def create
    @list_chest = ListChest.create(params[:list_chest])
    
    redirect_to list_chests_path
  end
  
  def edit
    @list_chest = ListChest.find(params[:id])
  end
  
  def update
    @list_chest = ListChest.find(params[:id])
    
    @list_chest.update_attributes(params[:list_chest])
    
    redirect_to list_chests_path
  end
  
  def index
    @list_chests = ListChest.all
  end
  
  def destroy
    @list_chest = ListChest.find(params[:id])
    
    @list_chest.destroy
    
    redirect_to list_chests_path
  end

end
