class ListWeaponsController < ApplicationController

  def new
    @list_weapon = ListWeapon.new
  end
  
  def create
    @list_weapon = ListWeapon.create(params[:list_weapon])
    
    redirect_to list_weapons_path
  end
  
  def edit
    @list_weapon = ListWeapon.find(params[:id])
  end
  
  def update
    @list_weapon = ListWeapon.find(params[:id])
    
    @list_weapon.update_attributes(params[:list_weapon])
    
    redirect_to list_weapons_path
  end
  
  def index
    @list_weapons = ListWeapon.all
  end
  
  def destroy
    @list_weapon = ListWeapon.find(params[:id])
    
    @list_weapon.destroy
    
    redirect_to list_weapons_path
  end

end
