class SidearmsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @sidearm = Sidearm.create
    @sidearm.user = current_user
    
    @sidearm.save
    
    @user = current_user
    @user.stamina = @user.stamina - 1
    @user.save
    
    redirect_to sidearm_path(:id => @sidearm.id)
  end
  
  def show
    @sidearms = Sidearm.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').all
  end
  
  def destroy
    @sidearm = Sidearm.find(params[:id])
    @sidearm.destroy
    Sidearm.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
    
    redirect_to root_path
  end
  
  def buy
    @sidearm = Sidearm.find(params[:id])
    
    if current_user.gold >= @sidearm.buy
      current_user.gold = current_user.gold - @sidearm.buy
      @sidearm.user = current_user
      @sidearm.bought = true
      @sidearm.save
      current_user.save
      
      Sidearm.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
      redirect_to root_path
    else
      redirect_to sidearm_path
      flash[:error] = 'You do not have enough gold to buy this'
    end
    
  end
  
  def index
    @user = current_user
    @sidearms = @user.sidearms
  end
  
  
  def equip
    Sidearm.where('user_id LIKE ?', current_user.id ).update_all( :active => nil )
    
    @sidearm = Sidearm.find(params[:id])
    @sidearm.active = true
    @sidearm.save
    
    redirect_to root_path
  end
  
  def unequip
    @sidearm = Sidearm.find(params[:id])
    @sidearm.active = nil
    @sidearm.save
    
    redirect_to sidearms_path
  end
  
  def sell
    @sidearm = Sidearm.find(params[:id])
    @user = current_user
    
    @user.gold = @user.gold + @sidearm.sell
    @user.save
    
    @sidearm.destroy
    
    redirect_to sidearms_path
  end

end
