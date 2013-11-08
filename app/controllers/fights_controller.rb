class FightsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def create
    
    @fight = Fight.create
    
    @fight.room = Room.find(params[:room])
    @fight.user = current_user
        
    @user = @fight.user
    @guard = @fight.room.guard
    @pet = @fight.room.pet
    @trap = @fight.room.trap
    
    if @guard != nil
    @fight.guard_name = @guard.display_name
    end
    if @pet != nil
    @fight.pet_name = @pet.display_name
    end
    if @trap != nil
    @fight.trap_name = @trap.display_name
    end
    
    @move_count = Move.where('fight_id LIKE ?', @fight.id).count
    
    
    if @guard != nil
    @fight.guard_health = @guard.health
    @fight.guard_stamina = 100
    end
    if @pet != nil
    @fight.pet_health = @pet.health
    @fight.pet_stamina = 100
    end
    if @trap != nil
    @fight.trap_health = @trap.health
    @fight.trap_stamina = 100
    end
    
    @fight.user_health = 100
    @fight.user_stamina = 100
    
    @fight.room_user_name = @fight.room.user.display_name
    
    @fight.save
    
    redirect_to fight_path(:id => @fight.id)
    
    #end
    
  end
  
  
  
  
  
  
  
  def challenge
    
    @strategy = params[:strategy]
    
    
    @move = current_user.fights.find(params[:id]).moves.new
    
    
    if @strategy == 'defend'
      
      
      
     # @move = Move.create
      
      
      
      #@move.fight = Fight.find(params[:id])
      
      #@move.fight = current_user.fights.find(params[:id])
      
      
      
      @move.user = current_user
      
      @guard = @move.fight.room.guard
      @pet = @move.fight.room.pet
      @trap = @move.fight.room.trap
      
      # Find if there will be an attacker
      @attacker_find = rand(10)
      
      case @attacker_find
      when 0..3
        @attacker = @guard
        @attacker_stamina = @move.fight.guard_stamina
      when 4..6
        @attacker = @pet
        @attacker_stamina = @move.fight.pet_stamina
      when 7..9
        @attacker = @trap
        @attacker_stamina = @move.fight.trap_stamina
      when 10
        @attacker = nil
        @attacker_stamina = nil
      end
      
      if @attacker == nil
        
        @stamina = (5 + rand(8))
        @move.fight.user_stamina = @move.fight.user_stamina + @stamina
        @move.description = 'You were not attacked and gained ' + @stamina.to_s + ' stamina back.'
        
      else 
        @attacker_damage = @attacker.min_damage + rand(@attacker.max_damage - @attacker.min_damage)
        logger.info "Attacker Damage is: #{@attacker_damage}"
        logger.info @move.inspect
        @defend = @move.user.min_block + rand(@move.user.max_block - @move.user.min_block)
        
        @damage = @attacker_damage - @defend
        
        @attacker_stamina = @attacker_stamina - ( 10 + rand(5))
        
        if @damage <= 0
          @damage = 0
          
          @move.fight.user_health = @move.fight.user_health - @damage
          
          @move.description = @attacker.display_name + ' attacks you. You block it successfully, taking no damage and gaining a bit of stamina.'
          
        else
          @damage = @damage * ((35 + rand(45)) / 100) * @attacker
          
          @move.fight.user_health = @move.fight.user_health - @damage
          @move.fight.user_stamina = @move.fight.user_stamina + (4 + rand(6))
          
          @move.description = @attacker + ' attacks you. You block most of the attack but take ' + @damage + ' damage.  You gain a bit of stamina back.'
        end
      end
      
      #if @move.fight.user_stamina >= 100
      #  @move.fight.user_stamina = 100
      #end
      
      @move.fight.user_stamina = @move.fight.user_stamina > 100 ? 100 : @move.fight.user_stamina
      
      #if @attacker_stamina != nil
      #  if @attacker_stamina >= 100
      #  @attacker_stamina = 100
      #  end
      #end
      
      @attacker_stamina = @attacker_stamina > 100 ? 100 : @attacker_stamina unless @attacker_stamina.nil?
      
      
    end
    
    if @strategy == 'dodge'
      
      @move = Move.new
      
      @move.fight = Fight.find(params[:id])
      @move.user = current_user
      
      @guard = @move.fight.room.guard
      @pet = @move.fight.room.pet
      @trap = @move.fight.room.trap
      
      # Find if there will be an attacker
      @attacker_find = rand(10)
      
      case @attacker_find
      when 0..3
        @attacker = @guard
        @attacker_stamina = @move.fight.guard_stamina
      when 4..6
        @attacker = @pet
        @attacker_stamina = @move.fight.pet_stamina
      when 7..9
        @attacker = @trap
        @attacker_stamina = @move.fight.trap_stamina
      when 10
        @attacker = nil
        @attacker_stamina = nil
      end
      
      @stamina = rand(6)
      
      if @attacker == nil
        
        @move.fight.user_stamina = @move.fight.user_stamina + @stamina
        @move.description = 'You were not attacked and gained ' + @stamina.to_s + ' stamina back.'
        
      else 
        @attacker_speed = @attacker.min_speed + rand(@attacker.max_speed - @attacker.min_speed)
        
        @dodge = @move.user.min_speed + rand(@move.user.max_speed - @move.user.min_speed)
        
        @damage = @attacker_speed - @dodge
        
        if @damage <= 0
          @damage = 0
          
          @move.description = @attacker.display_name + ' attacks you. You dodge it with ease and gain some stamina back.'
        else
          @damage = @damage * (115 + rand(35)) / 100
          
          @move.fight.user_health = @move.fight.user_health - @damage
          
          @move.description = @attacker + ' attacks you. The attack hits you unexpectingly and you take ' + @damage + ' damage.  You gain some energy back out of anger.'
        end
      end
      
      if @move.fight.user_stamina >= 100
        @move.fight.user_stamina = 100
      end
    end
    
    if @strategy == 'rest'
      
      #@move = Move.new
      
      #@move.fight = Fight.find(params[:id])
      #@move.user = current_user
      
      @guard = @move.fight.room.guard
      @pet = @move.fight.room.pet
      @trap = @move.fight.room.trap
      
      # Find if there will be an attacker
      @attacker_find = rand(5)
      
      case @attacker_find
      when 0
        @attacker = @guard
        @attacker_stamina = @move.fight.guard_stamina
      when 1
        @attacker = @pet
        @attacker_stamina = @move.fight.pet_stamina
      when 2
        @attacker = @trap
        @attacker_stamina = @move.fight.trap_stamina
      when 3..5
        @attacker = nil
      end
      
      @stamina = rand(10) + 10
      
      if @attacker == nil
        
        @move.fight.user_stamina = @move.fight.user_stamina + @stamina
        
        @move.description = 'You got lucky and were not attacked.  You gain ' + @stamina.to_s + ' stamina back.'      
      else 
        @attacker_damage = @attacker.min_damage + rand(@attacker.max_damage - @attacker.min_damage)
        
        @move.fight.user_stamina = @move.fight.user_stamina + (@stamina * ((70 + rand(20)) / 100))
        
        @defend = @move.user.min_block + rand(@move.user.max_block - @move.user.min_block)
        @defend = @defend - (@defend * ((10 + rand(20)) / 100))
        
        @damage = @attacker_damage - @defend
        
        @attacker_stamina = @attacker_stamina - 15
        
        if @damage <= 0
          @damage = 0
          
          @move.description = @attacker.display_name + ' attacks you. You get lucky and take no damage.  You also gain ' + @stamina.to_s + ' stamina.'
        else
          @damage = @damage * (140 + rand(50)) / 100
          
          @move.fight.user_health = @move.fight.user_health - @damage
          
          @move.description = @attacker + ' attacks you. The attack hit you while you were off guard and you take ' + @damage + ' damage.  You gain some energy back out of anger.'
        end
      end
      
      if @move.fight.user_stamina >= 100
        @move.fight.user_stamina = 100
      end
    end
    
    if @strategy == 'weapon_attack'
      #@move = Move.new
      
      #@move.fight = Fight.find(params[:id])
      #@move.user = current_user
      
      @type = params[:type]
          
      
      if @type == 'guard'
      @defender = @move.fight.room.guard
      @defender_health = @move.fight.guard_health
      @defender_stamina = @move.fight.guard_stamina
      end
      
      if @type == 'pet'
      @defender = @move.fight.room.pet
      @defender_health = @move.fight.pet_health
      @defender_stamina = @move.fight.pet_stamina
      end
      
      if @type == 'trap'
      @defender = @move.fight.room.trap
      @defender_health = @move.fight.trap_health
      @defender_stamina = @move.fight.trap_stamina
      end
      
      if @defender == nil
        @move.description = 'You cannot attack what is not there.'      
      else 
        
        @attacker_speed = @move.user.min_speed + rand(@move.user.max_speed - @move.user.min_speed)
        @defender_speed = @defender.min_speed + rand(@defender.max_speed - @defender.min_speed)
        @total_speed = @attacker_speed + @defender_speed
        
        @stamina = (@attacker_speed + 10 + rand(60)) / @attacker_speed
        
        #find out if the enemy gets hit or not    
        @hit_find = rand(@total_speed)
        
        case @hit_find
        when 0..@attacker_speed
          @hit_find = true
        when (@attacker_speed + 1)..@total_speed
          @hit_find = false
          
          @move.fight.user_stamina = @move.fight.user_stamina - @stamina
          
          @move.description = 'You miss.'
        end
        
        if @hit_find == true
          
          @defender_block = @defender.min_block + rand(@defender.max_block - @defender.min_block)
          @attack = @move.user.weapon_min_damage + rand(@move.user.weapon_max_damage + @move.user.weapon_min_damage)
          
          @damage = (@attack - (@defender_block * ((20 + rand(60)) * 100))) * ((@stamina / @move.fight.user.stamina) * 100 )
          
          @move.fight.user_stamina = @move.fight.user_stamina - @stamina
          
          if @damage <= 0
            @damage = 0
            
            @move.description = 'You attack ' + @defender.display_name + '.  You do no damage'
          else
            @defender_health = @defender_health - @damage.to_i
            @defender_stamina = @defender_stamina - 10
            @move.description = 'You attack ' + @defender.display_name + '.  You do ' + @damage.to_s + ' damage'
            @move.fight.save!
          end
        end
      end
      
      if @move.fight.user_stamina >= 100
        @move.fight.user_stamina = 100
      end
    end
    
    if @strategy == 'sidearm_attack'
      
    end
    
    if @strategy == 'parry'
      
    end
    begin
      @move.save!
      @move.fight.save!
    rescue
      # do something!
      
    end
    
    redirect_to fight_path(@move.fight)    
    
  end
  
  def result
    @fight = Fight.find(params[:id])
  end
  
  
  def show
    @fight = Fight.find(params[:id])
    
      if @fight.guard_health != nil and @fight.guard_health <= 0
        @fight.guard_defeated = true
      end
      if @fight.guard_health == nil
        @fight.guard_defeated = true
      end
      if @fight.pet_health != nil and @fight.pet_health <= 0
        @fight.pet_defeated = true
      end
      if @fight.pet_health == nil
        @fight.pet_defeated = true
      end
      if @fight.trap_health != nil and @fight.trap_health <= 0
        @fight.trap_defeated = true
      end
      if @fight.trap_health == nil
        @fight.trap_defeated = true
      end
    
    if @fight.fought == nil 
      if @fight.user_health <= 0
        @fight.fought = true
        @fight.user_health = 0
        @box = Box.create( :loser => @fight.user, :loser_name => @fight.user.display_name, :user => @fight.room.user, :user_name => @fight.room.user.display_name, :fight => @fight)
        
        @fight.description = 'You lost the fight. During the fight you dropped a ' + @box.display_name + '.'
        @fight.save 
      end
      
      if @fight.guard_defeated == true and @fight.pet_defeated == true and @fight.trap_defeated == true
        @fight.won_by_thief = true
        @fight.fought = true
        
        @box = Box.create( :loser => @fight.room.user.id, :loser_name => @fight.room.user.display_name, :user => @fight.user, :user_name => @fight.user.display_name, :fight => @fight)
        
        @fight.description = 'You stole a ' + @box.display_name + '.' + ' Go check out your capsules to open it and see what it contains.'
        @fight.save 
      end      
    end
  end
 
  
  def fight
    
  end
  
end
