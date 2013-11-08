class RingsController < ApplicationController
 
  before_filter :authenticate_user!
 
  def create
    @ring = Ring.create
    @ring.user = current_user
    
    @ring.save
    
    @user = current_user
    @user.stamina = @user.stamina - 1
    @user.save
    
    redirect_to ring_path(:id => @ring.id)
  end
  
  def show
    @rings = Ring.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').all
  end
  
  def destroy
    @ring = Ring.find(params[:id])
    @ring.destroy
    Ring.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
    
    redirect_to root_path
  end
  
  def buy
    @ring = Ring.find(params[:id])
    
    if current_user.gold >= @ring.buy
      current_user.gold = current_user.gold - @ring.buy
      @ring.user = current_user
      @ring.bought = true
      @ring.save
      current_user.save
      
      Ring.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
      redirect_to root_path
    else
      redirect_to ring_path
      flash[:error] = 'You do not have enough gold to buy this'
    end
    
  end
  
  def index
    @user = current_user
    @rings = @user.rings
  end
  
  
  def equip
    Ring.where('user_id LIKE ?', current_user.id ).update_all( :active => nil )
    
    @ring = Ring.find(params[:id])
    @ring.active = true
    @ring.save
    
    redirect_to root_path
  end
  
  def unequip
    @ring = Ring.find(params[:id])
    @ring.active = nil
    @ring.save
    
    redirect_to rings_path
  end
  
  def sell
    @ring = Ring.find(params[:id])
    @user = current_user
    
    @user.gold = @user.gold + @ring.sell
    @user.save
    
    @ring.destroy
    
    redirect_to rings_path
  end
  
end
