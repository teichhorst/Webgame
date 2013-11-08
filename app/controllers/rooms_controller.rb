class RoomsController < ApplicationController
  
   before_filter :authenticate_user!
  
  def index   
    @rooms = Room.where('user_id LIKE ?', current_user.id).all
  end
  
  def buy
    @room = Room.find(params[:id])
    @user = current_user
    
    if @user.gold >= @room.buy and @room.user == nil
      
      if @room.guard != nil
        @room.guard.room = nil
        @room.guard = nil
      end
      if @room.pet != nil
        @room.pet.room = nil
        @room.pet = nil
      end
      if @room.trap != nil
        @room.trap.room = nil
        @room.trap = nil
      end
      
      @room.user = current_user
      @user.gold = @user.gold - @room.buy
      
      @room.save
      @user.save
      
      @rooms_left = Room.where('user_id IS NULL').all
      
      if @rooms_left.count < 15 
        Complex.create
      end
      
      redirect_to complex_path(@room.complex)
      
      
    else
      redirect_to complex_path(@room.complex)
      flash[:error] = 'You do not have enough gold to buy this room'
    end
  end
  
  def sell
    @room = Room.find(params[:id])
    @user = current_user
    
    if @user == @room.user
      
      if @room.guard != nil
        @room.guard.room = nil
        @room.guard = nil
      end
      if @room.pet != nil
        @room.pet.room = nil
        @room.pet = nil
      end
      if @room.trap != nil
        @room.trap.room = nil
        @room.trap = nil
      end
      
      
      
      @room.user = nil
      @user.gold = @user.gold + @room.sell
      
      Furnishing.where('room_id LIKE ?', @room.id).destroy_all
      
      @room.buy = 5000
      @room.sell = 5000
      
      @room.save
      @user.save
      
      redirect_to complex_path(@room.complex)
      flash[:success] = 'Congratulations on your sale!'
    else
      redirect_to complex_path(@room.complex)
      flash[:error] = 'You do not have enough gold to buy this room'
    end
  end
  
  def create
    
  end
  
  def guard
    @user = current_user
    @room = Room.find(params[:id])
    
    @guards = Guard.where('user_id LIKE ?', @user.id).all
  end
  
  def change_guard
    @user = current_user
    @guard = Guard.find(params[:id])
    @room = Room.find(params[:room_to_equip])
    
    if @room.guard != nil or @guard.room != nil
      redirect_to view_room_guard_path(@room)
      
      flash[:error] = 'A room may only have one guard and a guard may only be assigned to one room.'
    else
    @guard.room = @room
    @room.guard = @guard
    
    
    @room.save
    @guard.save
    
    redirect_to view_room_guard_path(@room)
    end
  end
  
  def discard_guard
    @user = current_user
    @guard = Guard.find(params[:id])
    @room = Room.find(params[:room_to_equip])
    
    if @guard.room == @room
      @guard.room = nil
      @room.guard = nil
      
      @room.save
      @guard.save
      
      redirect_to view_room_guard_path(@room)
    else
      redirect_to view_room_guard_path(@room)
      flash[:error] = 'Sorry, the request could not be completed'
    end
  end
  
  def pet
    @user = current_user
    @room = Room.find(params[:id])
    
    @pets = Pet.where('user_id LIKE ?', @user.id).all
  end
  
  def change_pet
    @user = current_user
    @pet = Pet.find(params[:id])
    @room = Room.find(params[:room_to_equip])
    
    if @room.pet != nil or @pet.room != nil
      redirect_to view_room_pet_path(@room)
      
      flash[:error] = 'A room may only have one pet and a pet may only be assigned to one room.'
    else
    @pet.room = @room
    @room.pet = @pet
    
    
    @room.save
    @pet.save
    
    redirect_to view_room_pet_path(@room)
    end
  end
  
  def discard_pet
    @user = current_user
    @pet = Pet.find(params[:id])
    @room = Room.find(params[:room_to_equip])
    
    if @pet.room == @room
      @pet.room = nil
      @room.pet = nil
      
      @room.save
      @pet.save
      
      redirect_to view_room_pet_path(@room)
    else
      redirect_to view_room_pet_path(@room)
      flash[:error] = 'Sorry, the request could not be completed'
    end
  end
  
  def trap
    @user = current_user
    @room = Room.find(params[:id])
    
    @traps = Trap.where('user_id LIKE ?', @user.id).all
  end
  
  def change_trap
    @user = current_user
    @trap = Trap.find(params[:id])
    @room = Room.find(params[:room_to_equip])
    
    if @room.trap != nil or @trap.room != nil
      redirect_to view_room_trap_path(@room)
      
      flash[:error] = 'A room may only have one trap and a trap may only be assigned to one room.'
    else
    @trap.room = @room
    @room.trap = @trap
    
    
    @room.save
    @trap.save
    
    redirect_to view_room_trap_path(@room)
    end
  end
  
  def discard_trap
    @user = current_user
    @trap = Trap.find(params[:id])
    @room = Room.find(params[:room_to_equip])
    
    if @trap.room == @room
      @trap.room = nil
      @room.trap = nil
      
      @room.save
      @trap.save
      
      redirect_to view_room_trap_path(@room)
    else
      redirect_to view_room_trap_path(@room)
      flash[:error] = 'Sorry, the request could not be completed'
    end
  end
  
  def furnishing
    @user = current_user
    @room = Room.find(params[:id])
    
    @furnishings = Furnishing.where('user_id LIKE ?', @user.id).all
  end
  
  def add_furnishing
    @user = current_user
    @furnishing = Furnishing.find(params[:id])
    @room = Room.find(params[:room_to_equip])
    
    
    @furnishing.room = @room
    @room.buy = @room.buy + @furnishing.worth
    @room.sell = @room.sell + @furnishing.worth
    
    @room.save
    @furnishing.save
    
    redirect_to view_room_furnishing_path(@room)
    
  end
  
  def discard_furnishing
    @user = current_user
    @furnishing = Furnishing.find(params[:id])
    @room = Room.find(params[:room_to_equip])
    
    if @furnishing.room == @room
      @furnishing.room = nil
      
      @room.buy = @room.buy - @furnishing.worth
      @room.sell = @room.sell - @furnishing.worth
      
      @room.save
      @furnishing.save
      
      redirect_to view_room_furnishing_path(@room)
    else
      redirect_to view_room_furnishing_path(@room)
      flash[:error] = 'Sorry, the request could not be completed'
    end
  end
  
end
