class TrapsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @trap = Trap.create
    @trap.user = current_user
    
    @trap.save
    
    @user = current_user
    @user.stamina = @user.stamina - 1
    @user.save
    
    redirect_to trap_path(:id => @trap.id)
  end
  
  def show
    @traps = Trap.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').all
  end
  
  def destroy
    @trap = Trap.find(params[:id])
    @trap.destroy
    
    redirect_to root_path
  end
  
  def buy
    @trap = Trap.find(params[:id])
    
    if current_user.gold >= @trap.buy
      current_user.gold = current_user.gold - @trap.buy
      @trap.user = current_user
      @trap.bought = true
      @trap.save
      current_user.save
      
      Trap.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
      redirect_to root_path
    else
      redirect_to trap_path
      flash[:error] = 'You do not have enough gold to buy this'
    end
    
  end
  
  def index
    @user = current_user
    @traps = Trap.where('user_Id LIKE ?', current_user.id).all
  end
  
  
  def equip
    Trap.where('user_id LIKE ?', current_user.id ).update_all( :active => nil )
    
    @trap = Trap.find(params[:id])
    @trap.active = true
    @trap.save
    
    redirect_to traps_path
  end
  
  def unequip
    @trap = Trap.find(params[:id])
    @trap.active = nil
    @trap.save
    
    redirect_to traps_path
  end
  
  def sell
    @trap = Trap.find(params[:id])
    @user = current_user
    
    @user.gold = @user.gold + @trap.sell
    @user.save
    
    @trap.destroy
    
    redirect_to traps_path
  end

end
