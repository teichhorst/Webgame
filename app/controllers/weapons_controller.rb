class WeaponsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def create
    @weapon = Weapon.create
    @weapon.user = current_user
    
    @weapon.save
    
    @user = current_user
    @user.stamina = @user.stamina - 1
    @user.save
    
    redirect_to weapon_path(:id => @weapon.id)
  end
  
  def show
    @weapons = Weapon.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').all
  end
  
  def destroy
    @weapon = Weapon.find(params[:id])
    @weapon.destroy
    Weapon.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
    
    redirect_to root_path
  end
  
  def buy
    @weapon = Weapon.find(params[:id])
    
    if current_user.gold >= @weapon.buy
      current_user.gold = current_user.gold - @weapon.buy
      @weapon.user = current_user
      @weapon.bought = true
      @weapon.save
      current_user.save
      
      Weapon.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
      redirect_to root_path
    else
      redirect_to weapon_path
      flash[:error] = 'You do not have enough gold to buy this'
    end
    
  end
  
  def index
    @user = current_user
    @weapons = @user.weapons
  end
  
  
  def equip
    Weapon.where('user_id LIKE ?', current_user.id ).update_all( :active => nil )
    
    @weapon = Weapon.find(params[:id])
    @weapon.active = true
    @weapon.save
    
    redirect_to root_path
  end
  
  def unequip
    @weapon = Weapon.find(params[:id])
    @weapon.active = nil
    @weapon.save
    
    redirect_to weapons_path
  end
  
  def sell
    @weapon = Weapon.find(params[:id])
    @user = current_user
    
    @user.gold = @user.gold + @weapon.sell
    @user.save
    
    @weapon.destroy
    
    redirect_to weapons_path
  end
  
end
