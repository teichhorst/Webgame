class ListGuardsController < ApplicationController
  
  def new
    @list_guard = ListGuard.new
  end
  
  def create
    @list_guard = ListGuard.create(params[:list_guard])
    
    redirect_to list_guards_path
  end
  
  def edit
    @list_guard = ListGuard.find(params[:id])
  end
  
  def update
    @list_guard = ListGuard.find(params[:id])
    
    @list_guard.update_attributes(params[:list_guard])
    
    redirect_to list_guards_path
  end
  
  def index
    @list_guards = ListGuard.all
  end
  
  def destroy
    @list_guard = ListGuard.find(params[:id])
    
    @list_guard.destroy
    
    redirect_to list_guards_path
  end
end
