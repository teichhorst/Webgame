class ListLegsController < ApplicationController
  
  def new
    @list_leg = ListLeg.new
  end
  
  def create
    @list_leg = ListLeg.create(params[:list_leg])
    
    redirect_to list_legs_path
  end
  
  def edit
    @list_leg = ListLeg.find(params[:id])
  end
  
  def update
    @list_leg = ListLeg.find(params[:id])
    
    @list_leg.update_attributes(params[:list_leg])
    
    redirect_to list_legs_path
  end
  
  def index
    @list_legs = ListLeg.all
  end
  
  def destroy
    @list_leg = ListLeg.find(params[:id])
    
    @list_leg.destroy
    
    redirect_to list_legs_path
  end


end
