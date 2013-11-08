class HeadsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def create
    @head = Head.create
    @head.user = current_user
    
    @head.save
    
    @user = current_user
    @user.stamina = @user.stamina - 1
    @user.save
    
    redirect_to head_path(:id => @head.id)
  end
  
  def show
    @heads = Head.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').all
  end
  
  def destroy
    @head = Head.find(params[:id])
    @head.destroy
    Head.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
    
    redirect_to root_path
  end
  
  def buy
    @head = Head.find(params[:id])
    
    if current_user.gold >= @head.buy
      current_user.gold = current_user.gold - @head.buy
      @head.user = current_user
      @head.bought = true
      @head.save
      current_user.save
      
      Head.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
      redirect_to root_path
    else
      redirect_to head_path
      flash[:error] = 'You do not have enough gold to buy this'
    end
    
  end
  
  def index
    @user = current_user
    @heads = @user.heads
  end
  
  
  def equip
    Head.where('user_id LIKE ?', current_user.id ).update_all( :active => nil )
    
    @head = Head.find(params[:id])
    @head.active = true
    @head.save
    
    redirect_to root_path
  end
  
  def unequip
    @head = Head.find(params[:id])
    @head.active = nil
    @head.save
    
    redirect_to heads_path
  end
  
  def sell
    @head = Head.find(params[:id])
    @user = current_user
    
    @user.gold = @user.gold + @head.sell
    @user.save
    
    @head.destroy
    
    redirect_to heads_path
  end
  
end
