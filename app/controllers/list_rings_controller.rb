class ListRingsController < ApplicationController

  def new
    @list_ring = ListRing.new
  end
  
  def create
    @list_ring = ListRing.create(params[:list_ring])
    
    redirect_to list_rings_path
  end
  
  def edit
    @list_ring = ListRing.find(params[:id])
  end
  
  def update
    @list_ring = ListRing.find(params[:id])
    
    @list_ring.update_attributes(params[:list_ring])
    
    redirect_to list_rings_path
  end
  
  def index
    @list_rings = ListRing.all
  end
  
  def destroy
    @list_ring = ListRing.find(params[:id])
    
    @list_ring.destroy
    
    redirect_to list_rings_path
  end

end
