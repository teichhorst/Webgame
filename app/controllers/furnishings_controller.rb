class FurnishingsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @furnishing = Furnishing.create
    @furnishing.user = current_user
    
    @furnishing.save
    
    @user = current_user
    @user.stamina = @user.stamina - 1
    @user.save
    
    redirect_to furnishing_path(:id => @furnishing.id)
  end
  
  def show
    @furnishings = Furnishing.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').all
  end
  
  def destroy
    @furnishing = Furnishing.find(params[:id])
    @furnishing.destroy
    Furnishing.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
    
    redirect_to root_path
  end
  
  def buy
    @furnishing = Furnishing.find(params[:id])
    
    if current_user.gold >= @furnishing.buy
      current_user.gold = current_user.gold - @furnishing.buy
      @furnishing.user = current_user
      @furnishing.bought = true
      @furnishing.save
      current_user.save
      
      Furnishing.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
      redirect_to root_path
    else
      redirect_to furnishing_path
      flash[:error] = 'You do not have enough gold to buy this'
    end
    
  end
  
  def index
    @user = current_user
    @furnishings = @user.furnishings
  end
  
  
  def equip
    Furnishing.where('user_id LIKE ?', current_user.id ).update_all( :active => nil )
    
    @furnishing = Furnishing.find(params[:id])
    @furnishing.active = true
    @furnishing.save
    
    redirect_to furnishings_path
  end
  
  def unequip
    @furnishing = Furnishing.find(params[:id])
    @furnishing.active = nil
    @furnishing.save
    
    redirect_to furnishings_path
  end
  
  def sell
    @furnishing = Furnishing.find(params[:id])
    @user = current_user
    
    @user.gold = @user.gold + @furnishing.sell
    @user.save
    
    @furnishing.destroy
    
    redirect_to furnishings_path
  end

end
