class ListHandsController < ApplicationController
  
  def new
    @list_hand = ListHand.new
  end
  
  def create
    @list_hand = ListHand.create(params[:list_hand])
    
    redirect_to list_hands_path
  end
  
  def edit
    @list_hand = ListHand.find(params[:id])
  end
  
  def update
    @list_hand = ListHand.find(params[:id])
    
    @list_hand.update_attributes(params[:list_hand])
    
    redirect_to list_hands_path
  end
  
  def index
    @list_hands = ListHand.all
  end
  
  def destroy
    @list_hand = ListHand.find(params[:id])
    
    @list_hand.destroy
    
    redirect_to list_hands_path
  end

end
