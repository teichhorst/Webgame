class BoxesController < ApplicationController
  
  def index
    @user = current_user
    @boxes = @user.boxes.where('opened LIKE ?', false).all
  end
  
  def buy
    @user = current_user
    
    @description = params[:description]
    
    case @description
    when 'Copper'
      @price = 350
    when 'Silver'
      @price = 800
    when 'Gold'
      @price = 1500
    when 'Ruby'
      @price = 3000
    when 'Onyx'
      @price = 8000
    when 'Sun'
      @price = 15000
    end
    
    if @user.gold >= @price    
      @box = Box.create(:user => @user, :opened => false, :size => 'Tiny', :description => @description, :bought_at_shop => true)
      
      @user.gold = @user.gold - @price
      
      @user.save
      
      redirect_to root_path
      
    else
      
      redirect_to root_path
      
      flash[:error] = 'You do not have enough gold to buy this'
      
    end
      
  end
  
  def open
    @box = Box.find(params[:id])
    
    if @box.bought_at_shop == nil
    
      if @box.loser == nil
        @loser = nil
      else 
        @loser = User.where('id LIKE ?', @box.loser).first
      end
      
      @winner = User.find(@box.user)
      
      
      
      if @loser != nil
        if @loser.gold >= @box.gold
          @loser.gold = @loser.gold - @box.gold
        else
          @box.gold = 0
        end
      end
      
      @winner.gold = @winner.gold + @box.gold
      
      @winner.save
      
      if @loser != nil
      @loser.save
      end
  
      if @loser != nil    
  
        if @box.item_quantity >= 1
                  
            @item_1_roll = rand(11)
            
            case @item_1_roll
            when 0
            @box_item_1 = Ring.where('user_id LIKE ?', @loser.id).where('active LIKE ?', false).order('RANDOM()').first
            when 1
            @box_item_1 = Head.where('user_id LIKE ?', @loser.id).where('active LIKE ?', false).order('RANDOM()').first
            when 2
            @box_item_1 = Hand.where('user_id LIKE ?', @loser.id).where('active LIKE ?', false).order('RANDOM()').first
            when 3
            @box_item_1 = Weapon.where('user_id LIKE ?', @loser.id).where('active LIKE ?', false).order('RANDOM()').first
            when 4
            @box_item_1 = Sidearm.where('user_id LIKE ?', @loser.id).where('active LIKE ?', false).order('RANDOM()').first
            when 5
            @box_item_1 = Leg.where('user_id LIKE ?', @loser.id).where('active LIKE ?', false).order('RANDOM()').first
            when 6
            @box_item_1 = Chest.where('user_id LIKE ?', @loser.id).where('active LIKE ?', false).order('RANDOM()').first
            when 7
            @box_item_1 = Boot.where('user_id LIKE ?', @loser.id).where('active LIKE ?', false).order('RANDOM()').first
            when 8
            @box_item_1 = Furnishing.where('user_id LIKE ?', @loser.id).where('room_id LIKE ?', @box.fight.room.id).order('RANDOM()').first
            when 9
            @box_item_1 = Guard.where('user_id LIKE ?', @loser.id).where('active LIKE ?', false).order('RANDOM()').first
            when 10
            @box_item_1 = Pet.where('user_id LIKE ?', @loser.id).where('active LIKE ?', false).order('RANDOM()').first
            when 11
            @box_item_1 = Trap.where('user_id LIKE ?', @loser.id).where('active LIKE ?', false).order('RANDOM()').first
            end
            
            if @box_item_1 == nil
              @item_1_roll = nil
              @box_item_1 = nil
            else
              @box_item_1.user = @winner
              @box_item_1.save
            end
          end
        end
        
        if @box.item_quantity >= 2
          
            @item_2_roll = rand(11)
            
            case @item_2_roll
            when 0
            @box_item_2 = Ring.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 1
            @box_item_2 = Head.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 2
            @box_item_2 = Hand.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 3
            @box_item_2 = Weapon.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 4
            @box_item_2 = Sidearm.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 5
            @box_item_2 = Leg.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 6
            @box_item_2 = Chest.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 7
            @box_item_2 = Boot.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 8
            @box_item_2 = Furnishing.where('user_id LIKE ?', @loser.id).where('room_id LIKE ?', @box.fight.room.id).order('RANDOM()').first
            when 9
            @box_item_2 = Guard.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 10
            @box_item_2 = Pet.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 11
            @box_item_2 = Trap.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            end
            
          if @box_item_2 == nil
            @item_2_roll = nil
            @box_item_2 = nil
          else
            @box_item_2.user = @winner
            @box_item_2.save
          end
            
          
        end
        
        if @box.item_quantity >= 3
          
            @item_3_roll = rand(11)
            
            case @item_3_roll
            when 0
            @box_item_3 = Ring.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 1
            @box_item_3 = Head.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 2
            @box_item_3 = Hand.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 3
            @box_item_3 = Weapon.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 4
            @box_item_3 = Sidearm.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 5
            @box_item_3 = Leg.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 6
            @box_item_3 = Chest.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 7
            @box_item_3 = Boot.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 8
            @box_item_3 = Furnishing.where('user_id LIKE ?', @loser.id).where('room_id LIKE ?', @box.fight.room.id).order('RANDOM()').first
            when 9
            @box_item_3 = Guard.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 10
            @box_item_3 = Pet.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 11
            @box_item_3 = Trap.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            end
            
          if @box_item_3 == nil
            @item_3_roll = nil
            @box_item_3 = nil
          else
            @box_item_3.user = @winner
            @box_item_3.save
          end
            
          
        end
        
        if @box.item_quantity >= 4
          @box_item_4_roll = rand(2)
          
          if @box_item_4_roll == 2
            
            @item_4_roll = rand(11)
            
            case @item_4_roll
            when 0
            @box_item_4 = Ring.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 1
            @box_item_4 = Head.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 2
            @box_item_4 = Hand.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 3
            @box_item_4 = Weapon.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 4
            @box_item_4 = Sidearm.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 5
            @box_item_4 = Leg.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 6
            @box_item_4 = Chest.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 7
            @box_item_4 = Boot.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 8
            @box_item_4 = Furnishing.where('user_id LIKE ?', @loser.id).where('room_id LIKE ?', @box.fight.room.id).order('RANDOM()').first
            when 9
            @box_item_4 = Guard.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 10
            @box_item_4 = Pet.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 11
            @box_item_4 = Trap.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            end
            
            if @box_item_4 == nil
              @item_4_roll = nil
              @box_item_4 = nil
            else
              @box_item_4.user = @winner
              @box_item_4.save
            end          
          end
        end
        
        if @box.item_quantity == 5
            @box_item_5_roll = rand(2)
          
          if @box_item_5_roll == 2
            
            @item_5_roll = rand(11)
            
            case @item_5_roll
            when 0
            @box_item_5 = Ring.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 1
            @box_item_5 = Head.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 2
            @box_item_5 = Hand.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 3
            @box_item_5 = Weapon.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 4
            @box_item_5 = Sidearm.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 5
            @box_item_5 = Leg.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 6
            @box_item_5 = Chest.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 7
            @box_item_5 = Boot.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 8
            @box_item_5 = Furnishing.where('user_id LIKE ?', @loser.id).where('room_id LIKE ?', @box.fight.room.id).order('RANDOM()').first
            when 9
            @box_item_5 = Guard.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 10
            @box_item_5 = Pet.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            when 11
            @box_item_5 = Trap.where('user_id LIKE ?', @loser.id).where('active is FALSE').order('RANDOM()').first
            end
            
            if @box_item_5 == nil
              @item_5_roll = nil
              @box_item_5 = nil
            else
              @box_item_5.user = @winner
              @box_item_5.save
            end          
          end
        end
        
      
      if @box.item_quantity == 0 or @box_item_1 == nil and @box_item_2 == nil and @box_item_3 == nil and @box_item_4 == nil and @box_item_5 == nil
        @box.summary = 'The box contained no items '
      else
        @box.summary = 'The box contained a '
      end
      
      if @box_item_1 != nil
        @box.summary = @box.summary + @box_item_1.display_name + ', '
      end
      
      if @box_item_2 != nil
        @box.summary = @box.summary + @box_item_1.display_name + ', '
      end
      
      if @box_item_3 != nil
        @box.summary = @box.summary + @box_item_1.display_name + ', '
      end
      
      if @box_item_4 != nil
        @box.summary = @box.summary + @box_item_1.display_name + ', '
      end
      
      if @box_item_5 != nil
        @box.summary = @box.summary + @box_item_1.display_name + ', '
      end
      
      if @loser != nil
        @box.summary = @box.summary + 'and ' + @box.gold.to_s + ' gold. The contents of this storage box now belongs to ' + @winner.display_name + '. The contents have been stolen from ' + @loser.display_name + '.'
      else
        @box.summary = @box.summary + 'and ' + @box.gold.to_s + ' gold. The contents of this storage box now belongs to ' + @winner.display_name + '.'
      end
      @box.opened = true
      
      @winner.save
      
      if @loser != nil
      @loser.save
      end
      
      @box.save
      
    
    else
        
        if @box.description == 'Copper'
            
            @item_roll = rand(10000)
            
            case @item_roll
            when 12..39
            @box_item_1 = Ring.create(:user => @box.user)
            when 501..1500
            @box_item_1 = Head.create(:user => @box.user)
            when 1501..2500
            @box_item_1 = Hand.create(:user => @box.user)
            when 40..75
            @box_item_1 = Weapon.create(:user => @box.user)
            when 76..100
            @box_item_1 = Sidearm.create(:user => @box.user)
            when 2501..4000
            @box_item_1 = Leg.create(:user => @box.user)
            when 101..500
            @box_item_1 = Chest.create(:user => @box.user)
            when 4001..6000
            @box_item_1 = Boot.create(:user => @box.user)
            when 6001..10000
            @box_item_1 = Furnishing.create(:user => @box.user)
            when 0..3
            @box_item_1 = Guard.create(:user => @box.user)
            when 4..7
            @box_item_1 = Pet.create(:user => @box.user)
            when 8..11
            @box_item_1 = Trap.create(:user => @box.user)
            end
            
        end
        
        if @box.description == 'Silver'
            
            @item_roll = rand(10000)
            
            case @item_roll
            when 12..39
            @box_item_1 = Ring.create(:user => @box.user)
            when 501..1500
            @box_item_1 = Head.create(:user => @box.user)
            when 1501..2500
            @box_item_1 = Hand.create(:user => @box.user)
            when 40..75
            @box_item_1 = Weapon.create(:user => @box.user)
            when 76..100
            @box_item_1 = Sidearm.create(:user => @box.user)
            when 2501..4000
            @box_item_1 = Leg.create(:user => @box.user)
            when 101..500
            @box_item_1 = Chest.create(:user => @box.user)
            when 4001..6000
            @box_item_1 = Boot.create(:user => @box.user)
            when 6001..10000
            @box_item_1 = Furnishing.create(:user => @box.user)
            when 0..3
            @box_item_1 = Guard.create(:user => @box.user)
            when 4..7
            @box_item_1 = Pet.create(:user => @box.user)
            when 8..11
            @box_item_1 = Trap.create(:user => @box.user)
            end
            
        end
        
        if @box.description == 'Gold'
            
            @item_roll = rand(10000)
            
            case @item_roll
            when 12..39
            @box_item_1 = Ring.create(:user => @box.user)
            when 501..1500
            @box_item_1 = Head.create(:user => @box.user)
            when 1501..2500
            @box_item_1 = Hand.create(:user => @box.user)
            when 40..75
            @box_item_1 = Weapon.create(:user => @box.user)
            when 76..100
            @box_item_1 = Sidearm.create(:user => @box.user)
            when 2501..4000
            @box_item_1 = Leg.create(:user => @box.user)
            when 101..500
            @box_item_1 = Chest.create(:user => @box.user)
            when 4001..6000
            @box_item_1 = Boot.create(:user => @box.user)
            when 6001..10000
            @box_item_1 = Furnishing.create(:user => @box.user)
            when 0..3
            @box_item_1 = Guard.create(:user => @box.user)
            when 4..7
            @box_item_1 = Pet.create(:user => @box.user)
            when 8..11
            @box_item_1 = Trap.create(:user => @box.user)
            end
            
        end
        
        if @box.description == 'Ruby'
            
            @item_roll = rand(10000)
            
            case @item_roll
            when 12..39
            @box_item_1 = Ring.create(:user => @box.user)
            when 501..1500
            @box_item_1 = Head.create(:user => @box.user)
            when 1501..2500
            @box_item_1 = Hand.create(:user => @box.user)
            when 40..75
            @box_item_1 = Weapon.create(:user => @box.user)
            when 76..100
            @box_item_1 = Sidearm.create(:user => @box.user)
            when 2501..4000
            @box_item_1 = Leg.create(:user => @box.user)
            when 101..500
            @box_item_1 = Chest.create(:user => @box.user)
            when 4001..6000
            @box_item_1 = Boot.create(:user => @box.user)
            when 6001..10000
            @box_item_1 = Furnishing.create(:user => @box.user)
            when 0..3
            @box_item_1 = Guard.create(:user => @box.user)
            when 4..7
            @box_item_1 = Pet.create(:user => @box.user)
            when 8..11
            @box_item_1 = Trap.create(:user => @box.user)
            end
            
        end
        
        if @box.description == 'Onyx'
            
            @item_roll = rand(10000)
            
            case @item_roll
            when 12..39
            @box_item_1 = Ring.create(:user => @box.user)
            when 501..1500
            @box_item_1 = Head.create(:user => @box.user)
            when 1501..2500
            @box_item_1 = Hand.create(:user => @box.user)
            when 40..75
            @box_item_1 = Weapon.create(:user => @box.user)
            when 76..100
            @box_item_1 = Sidearm.create(:user => @box.user)
            when 2501..4000
            @box_item_1 = Leg.create(:user => @box.user)
            when 101..500
            @box_item_1 = Chest.create(:user => @box.user)
            when 4001..6000
            @box_item_1 = Boot.create(:user => @box.user)
            when 6001..10000
            @box_item_1 = Furnishing.create(:user => @box.user)
            when 0..3
            @box_item_1 = Guard.create(:user => @box.user)
            when 4..7
            @box_item_1 = Pet.create(:user => @box.user)
            when 8..11
            @box_item_1 = Trap.create(:user => @box.user)
            end
            
        end
        
        if @box.description == 'Sun'
            
            @item_roll = rand(10000)
            
            case @item_roll
            when 12..39
            @box_item_1 = Ring.create(:user => @box.user)
            when 501..1500
            @box_item_1 = Head.create(:user => @box.user)
            when 1501..2500
            @box_item_1 = Hand.create(:user => @box.user)
            when 40..75
            @box_item_1 = Weapon.create(:user => @box.user)
            when 76..100
            @box_item_1 = Sidearm.create(:user => @box.user)
            when 2501..4000
            @box_item_1 = Leg.create(:user => @box.user)
            when 101..500
            @box_item_1 = Chest.create(:user => @box.user)
            when 4001..6000
            @box_item_1 = Boot.create(:user => @box.user)
            when 6001..10000
            @box_item_1 = Furnishing.create(:user => @box.user)
            when 0..3
            @box_item_1 = Guard.create(:user => @box.user)
            when 4..7
            @box_item_1 = Pet.create(:user => @box.user)
            when 8..11
            @box_item_1 = Trap.create(:user => @box.user)
            end
            
        end
        
      
      @box.summary = 'This capsule was bought at the shop and contained a ' + @box_item_1.display_name + ', which is now in your inventory.'
      
      
      
      
      @box.opened = true
      
      @box.save
        
        
    end
    
  end
      
      
      
    
  
  def show
    @box = Box.find(params[:id])
  end
  
end
