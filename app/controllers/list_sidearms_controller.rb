class ListSidearmsController < ApplicationController

  def new
    @list_sidearm = ListSidearm.new
  end
  
  def create
    @list_sidearm = ListSidearm.create(params[:list_sidearm])
    
    redirect_to list_sidearms_path
  end
  
  def edit
    @list_sidearm = ListSidearm.find(params[:id])
  end
  
  def update
    @list_sidearm = ListSidearm.find(params[:id])
    
    @list_sidearm.update_attributes(params[:list_sidearm])
    
    redirect_to list_sidearms_path
  end
  
  def index
    @list_sidearms = ListSidearm.all
  end
  
  def destroy
    @list_sidearm = ListSidearm.find(params[:id])
    
    @list_sidearm.destroy
    
    redirect_to list_sidearms_path
  end

end
