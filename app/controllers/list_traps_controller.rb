class ListTrapsController < ApplicationController

  def new
    @list_trap = ListTrap.new
  end
  
  def create
    @list_trap = ListTrap.create(params[:list_trap])
    
    redirect_to list_traps_path
  end
  
  def edit
    @list_trap = ListTrap.find(params[:id])
  end
  
  def update
    @list_trap = ListTrap.find(params[:id])
    
    @list_trap.update_attributes(params[:list_trap])
    
    redirect_to list_traps_path
  end
  
  def index
    @list_traps = ListTrap.all
  end
  
  def destroy
    @list_trap = ListTrap.find(params[:id])
    
    @list_trap.destroy
    
    redirect_to list_traps_path
  end

end
