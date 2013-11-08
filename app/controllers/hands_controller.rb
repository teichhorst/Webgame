class HandsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def create
    @hand = Hand.create
    @hand.user = current_user
    
    @hand.save
    
    @user = current_user
    @user.stamina = @user.stamina - 1 
    @user.save
    
    redirect_to hand_path(:id => @hand.id)
  end
  
  def show
    @hands = Hand.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').all
  end
  
  def destroy
    @hand = Hand.find(params[:id])
    @hand.destroy
    Hand.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
    
    redirect_to root_path
  end
  
  def buy
    @hand = Hand.find(params[:id])
    
    if current_user.gold >= @hand.buy
      current_user.gold = current_user.gold - @hand.buy
      @hand.user = current_user
      @hand.bought = true
      @hand.save
      current_user.save
      
      Hand.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
      redirect_to root_path
    else
      redirect_to hand_path
      flash[:error] = 'You do not have enough gold to buy this'
    end
    
  end
  
  def index
    @user = current_user
    @hands = @user.hands
  end
  
  
  def equip
    Hand.where('user_id LIKE ?', current_user.id ).update_all( :active => nil )
    
    @hand = Hand.find(params[:id])
    @hand.active = true
    @hand.save
    
    redirect_to root_path
  end
  
  def unequip
    @hand = Hand.find(params[:id])
    @hand.active = nil
    @hand.save
    
    redirect_to hands_path
  end
  
  def sell
    @hand = Hand.find(params[:id])
    @user = current_user
    
    @user.gold = @user.gold + @hand.sell
    @user.save
    
    @hand.destroy
    
    redirect_to hands_path
  end
  
end
