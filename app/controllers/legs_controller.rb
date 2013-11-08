class LegsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @leg = Leg.create
    @leg.user = current_user
    
    @leg.save
    
    @user = current_user
    @user.stamina = @user.stamina - 1
    @user.save
    
    redirect_to leg_path(:id => @leg.id)
  end
  
  def show
    @legs = Leg.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').all
  end
  
  def destroy
    @leg = Leg.find(params[:id])
    @leg.destroy
    Leg.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
    
    redirect_to root_path
  end
  
  def buy
    @leg = Leg.find(params[:id])
    
    if current_user.gold >= @leg.buy
      current_user.gold = current_user.gold - @leg.buy
      @leg.user = current_user
      @leg.bought = true
      @leg.save
      current_user.save
      
      Leg.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
      redirect_to root_path
    else
      redirect_to leg_path
      flash[:error] = 'You do not have enough gold to buy this'
    end
    
  end
  
  def index
    @user = current_user
    @legs = @user.legs
  end
  
  
  def equip
    Leg.where('user_id LIKE ?', current_user.id ).update_all( :active => nil )
    
    @leg = Leg.find(params[:id])
    @leg.active = true
    @leg.save
    
    redirect_to root_path
  end
  
  def unequip
    @leg = Leg.find(params[:id])
    @leg.active = nil
    @leg.save
    
    redirect_to legs_path
  end
  
  def sell
    @leg = Leg.find(params[:id])
    @user = current_user
    
    @user.gold = @user.gold + @leg.sell
    @user.save
    
    @leg.destroy
    
    redirect_to legs_path
  end

end
