class Users::UsersController < ApplicationController
  
  before_filter :authenticate_user!
  
  def show
    
    if params[:id].nil? 
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    
    @fight = Fight.where('user_id LIKE ?', @user.id).where('fought IS NULL').first
    
    if @fight != nil
      redirect_to fight_path(:id => @fight.id)
    end
    
    @ring = @user.rings.where('active LIKE ?', true).first
    @head = @user.heads.where('active LIKE ?', true).first
    @chest = @user.chests.where('active LIKE ?', true).first
    @weapon = @user.weapons.where('active LIKE ?', true).first
    @sidearm = @user.sidearms.where('active LIKE ?', true).first
    @leg = @user.legs.where('active LIKE ?', true).first
    @boot = @user.boots.where('active LIKE ?', true).first
    @hand = @user.hands.where('active LIKE ?', true).first
    
    #Sets values for users items, and 0 if they are nil
    if @head == nil
      @head_min_block = 0
      @head_max_block = 0
      @head_min_speed = 0
      @head_max_speed = 0
    else
      @head_min_block = @head.min_block
      @head_max_block = @head.max_block
      @head_min_speed = @head.min_speed
      @head_max_speed = @head.max_speed
    end
    
    if @chest == nil
      @chest_min_block = 0
      @chest_max_block = 0
      @chest_min_speed = 0
      @chest_max_speed = 0
    else
      @chest_min_block = @chest.min_block
      @chest_max_block = @chest.max_block
      @chest_min_speed = @chest.min_speed
      @chest_max_speed = @chest.max_speed
    end
    
    if @hand == nil
      @hand_min_block = 0
      @hand_max_block = 0
      @hand_min_speed = 0
      @hand_max_speed = 0
    else
      @hand_min_block = @hand.min_block
      @hand_max_block = @hand.max_block
      @hand_min_speed = @hand.min_speed
      @hand_max_speed = @hand.max_speed
    end
    
    if @leg == nil
      @leg_min_block = 0
      @leg_max_block = 0
      @leg_min_speed = 0
      @leg_max_speed = 0
    else
      @leg_min_block = @leg.min_block
      @leg_max_block = @leg.max_block
      @leg_min_speed = @leg.min_speed
      @leg_max_speed = @leg.max_speed
    end
    
    if @boot == nil
      @boot_min_block = 0
      @boot_max_block = 0
      @boot_min_speed = 0
      @boot_max_speed = 0
    else
      @boot_min_block = @boot.min_block
      @boot_max_block = @boot.max_block
      @boot_min_speed = @boot.min_speed
      @boot_max_speed = @boot.max_speed
    end
    
    if @ring == nil
      @ring_min_block = 0
      @ring_max_block = 0
      @ring_min_speed = 0
      @ring_max_speed = 0
      @ring_min_damage = 0
      @ring_max_damage = 0
    else
      @ring_min_block = @ring.min_block
      @ring_max_block = @ring.max_block
      @ring_min_speed = @ring.min_speed
      @ring_max_speed = @ring.max_speed
      @ring_min_damage = @ring.min_damage
      @ring_max_damage = @ring.max_damage
    end
    
    if @weapon == nil
      @weapon_min_block = 0
      @weapon_max_block = 0
      @weapon_min_speed = 0
      @weapon_max_speed = 0
      @weapon_min_damage = 1
      @weapon_max_damage = 1
    else
      @weapon_min_block = @weapon.min_block
      @weapon_max_block = @weapon.max_block
      @weapon_min_speed = @weapon.min_speed
      @weapon_max_speed = @weapon.max_speed
      @weapon_min_damage = @weapon.min_damage
      @weapon_max_damage = @weapon.max_damage
    end
    
    if @sidearm == nil
      @sidearm_min_block = 0
      @sidearm_max_block = 0
      @sidearm_min_speed = 0
      @sidearm_max_speed = 0
      @sidearm_min_damage = 1
      @sidearm_max_damage = 1
    else
      @sidearm_min_block = @sidearm.min_block
      @sidearm_max_block = @sidearm.max_block
      @sidearm_min_speed = @sidearm.min_speed
      @sidearm_max_speed = @sidearm.max_speed
      @sidearm_min_damage = @sidearm.min_damage
      @sidearm_max_damage = @sidearm.max_damage
    end
    
    #Find users speeds
    @user.min_speed = (@head_min_speed * -1) + (@chest_min_speed * -1) + (@weapon_min_speed * -1) + (@sidearm_min_speed * -1) + (@hand_min_speed) + (@ring_min_speed) + (@leg_min_speed * -1) + (@boot_min_speed)
    @user.max_speed = (@head_max_speed * -1) + (@chest_max_speed * -1) + (@weapon_max_speed * -1) + (@sidearm_max_speed * -1) + (@hand_max_speed) + (@ring_max_speed) + (@leg_max_speed * -1) + (@boot_max_speed)
    
    #Find users damages
    @user.weapon_min_damage = @weapon_min_damage + @ring_min_damage
    @user.weapon_max_damage = @weapon_max_damage + @ring_max_damage
    
    @user.sidearm_min_damage = @sidearm_min_damage + @ring_min_damage
    @user.sidearm_max_damage = @sidearm_max_damage + @ring_max_damage
    
    #Find users blocks
    @user.min_block = @head_min_block + @chest_min_block + @weapon_min_block + @sidearm_min_block + @hand_min_block + @ring_min_block + @leg_min_block + @boot_min_block
    @user.max_block = @head_max_block + @chest_max_block + @weapon_max_block + @sidearm_max_block + @hand_max_block + @ring_max_block + @leg_max_block + @boot_max_block
    
    @user.save
    
  end
  
end
