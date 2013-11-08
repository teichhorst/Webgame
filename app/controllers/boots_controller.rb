class BootsController < ApplicationController
  
  before_filter :authenticate_user!
  
    def create
    @boot = Boot.create
    @boot.user = current_user
    
    @boot.save
    
    @user = current_user
    @user.stamina = @user.stamina - 1 
    @user.save
    
    redirect_to boot_path(:id => @boot.id)
  end
  
  def show
    @boots = Boot.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').all
  end
  
  def destroy
    @boot = Boot.find(params[:id])
    @boot.destroy
    Boot.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
    
    redirect_to root_path
  end
  
  def buy
    @boot = Boot.find(params[:id])
    
    if current_user.gold >= @boot.buy
      current_user.gold = current_user.gold - @boot.buy
      @boot.user = current_user
      @boot.bought = true
      @boot.save
      current_user.save
      
      Boot.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
      redirect_to root_path
    else
      redirect_to boot_path
      flash[:error] = 'You do not have enough gold to buy this'
    end
    
  end
  
  def index
    @user = current_user
    @boots = @user.boots
  end
  
  
  def equip
    Boot.where('user_id LIKE ?', current_user.id ).update_all( :active => nil )
    
    @boot = Boot.find(params[:id])
    @boot.active = true
    @boot.save
    
    redirect_to root_path
  end
  
  def unequip
    @boot = Boot.find(params[:id])
    @boot.active = nil
    @boot.save
    
    redirect_to boots_path
  end
  
  def sell
    @boot = Boot.find(params[:id])
    @user = current_user
    
    @user.gold = @user.gold + @boot.sell
    @user.save
    
    @boot.destroy
    
    redirect_to boots_path
  end
  
end
