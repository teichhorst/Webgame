class GuardsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @guard = Guard.create
    @guard.user = current_user
    
    @guard.save
    
    @user = current_user
    @user.stamina = @user.stamina - 1
    @user.save
    
    redirect_to guard_path(:id => @guard.id)
  end
  
  def show
    @guards = Guard.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').all
  end
  
  def destroy
    @guard = Guard.find(params[:id])
    @guard.destroy
    
    redirect_to root_path
  end
  
  def buy
    @guard = Guard.find(params[:id])
    
    if current_user.gold >= @guard.buy
      current_user.gold = current_user.gold - @guard.buy
      @guard.user = current_user
      @guard.bought = true
      @guard.save
      current_user.save
      
      Guard.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
      redirect_to root_path
    else
      redirect_to guard_path
      flash[:error] = 'You do not have enough gold to buy this'
    end
    
  end
  
  def index
    @user = current_user
    @guards = Guard.where('user_Id LIKE ?', current_user.id).all
  end
  
  
  def equip
    Guard.where('user_id LIKE ?', current_user.id ).update_all( :active => nil )
    
    @guard = Guard.find(params[:id])
    @guard.active = true
    @guard.save
    
    redirect_to guards_path
  end
  
  def unequip
    @guard = Guard.find(params[:id])
    @guard.active = nil
    @guard.save
    
    redirect_to guards_path
  end
  
  def sell
    @guard = Guard.find(params[:id])
    @user = current_user
    
    @user.gold = @user.gold + @guard.sell
    @user.save
    
    @guard.destroy
    
    redirect_to guards_path
  end

end
