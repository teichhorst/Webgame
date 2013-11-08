class PetsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @pet = Pet.create
    @pet.user = current_user
    
    @pet.save
    
    @user = current_user
    @user.stamina = @user.stamina - 1
    @user.save
    
    redirect_to pet_path(:id => @pet.id)
  end
  
  def show
    @pets = Pet.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').all
  end
  
  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    
    redirect_to root_path
  end
  
  def buy
    @pet = Pet.find(params[:id])
    
    if current_user.gold >= @pet.buy
      current_user.gold = current_user.gold - @pet.buy
      @pet.user = current_user
      @pet.bought = true
      @pet.save
      current_user.save
      
      Pet.where('user_id LIKE ?', current_user.id ).where('bought IS NULL').destroy_all
      redirect_to root_path
    else
      redirect_to pet_path
      flash[:error] = 'You do not have enough gold to buy this'
    end
    
  end
  
  def index
    @user = current_user
    @pets = Pet.where('user_Id LIKE ?', current_user.id).all
  end
  
  
  def equip
    Pet.where('user_id LIKE ?', current_user.id ).update_all( :active => nil )
    
    @pet = Pet.find(params[:id])
    @pet.active = true
    @pet.save
    
    redirect_to pets_path
  end
  
  def unequip
    @pet = Pet.find(params[:id])
    @pet.active = nil
    @pet.save
    
    redirect_to pets_path
  end
  
  def sell
    @pet = Pet.find(params[:id])
    @user = current_user
    
    @user.gold = @user.gold + @pet.sell
    @user.save
    
    @pet.destroy
    
    redirect_to pets_path
  end

end
