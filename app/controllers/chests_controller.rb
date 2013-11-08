class ChestsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def create
    @chest = Chest.create
    @chest.user = current_user
    
    @chest.save
    
    @user = current_user
    @user.stamina = @user.stamina - 1
    @user.save
    
    redirect_to chest_path(:id => @chest.id)
  end
  
  def show
    @chests = Chest.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').all
  end
  
  def destroy
    @chest = Chest.find(params[:id])
    @chest.destroy
    Chest.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
    
    redirect_to root_path
  end
  
  def buy
    @chest = Chest.find(params[:id])
    
    if current_user.gold >= @chest.buy
      current_user.gold = current_user.gold - @chest.buy
      @chest.user = current_user
      @chest.bought = true
      @chest.save
      current_user.save
      
      Chest.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
      redirect_to root_path
    else
      redirect_to chest_path
      flash[:error] = 'You do not have enough gold to buy this'
    end
    
  end
  
  def index
    @user = current_user
    @chests = @user.chests
  end
  
  
  def equip
    Chest.where('user_id LIKE ?', current_user.id ).update_all( :active => nil )
    
    @chest = Chest.find(params[:id])
    @chest.active = true
    @chest.save
    
    redirect_to root_path
  end
  
  def unequip
    @chest = Chest.find(params[:id])
    @chest.active = nil
    @chest.save
    
    redirect_to chests_path
  end
  
  def sell
    @chest = Chest.find(params[:id])
    @user = current_user
    
    @user.gold = @user.gold + @chest.sell
    @user.save
    
    @chest.destroy
    
    redirect_to chests_path
  end
  
end
