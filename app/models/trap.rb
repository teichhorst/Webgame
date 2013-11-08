class Trap < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  belongs_to :list_trap
  belongs_to :color
  
  has_many :moves
  
  before_create :randomly_make_trap
  
  def randomly_make_trap
    #everything is figured during initialization
    #You can call instance.randomly_make_pet to do it at any time.
    
    #chance calculation for which one it picks from the list
    @odds = rand(1000000)
    
    @trap = ListTrap.where('odds >= ?', @odds).order('RANDOM()').first
    
    self.list_trap = @trap
    
    self.display_name = @trap.display_name
    self.level = 1
    self.health = @trap.health
    self.description = @trap.description
    
    self.min_speed = @trap.min_speed
    self.max_speed = @trap.max_speed
    self.min_block = @trap.min_block
    self.max_block = @trap.max_block
    self.min_damage = @trap.min_damage
    self.max_damage = @trap.max_damage
    
    self.base_min_speed = @trap.min_speed
    self.base_max_speed = @trap.max_speed
    self.base_min_block = @trap.min_block
    self.base_max_block = @trap.max_block
    self.base_min_damage = @trap.min_damage
    self.base_max_damage = @trap.max_damage
    
    #Chance to have a strength and weakness
    random_strength = rand(3)
    
    case random_strength
    when 0
      self.strength = 'Well Assembled'
      self.weakness = 'Strong'
      self.strength_roll = 2 + rand(3)
    when 1
      self.strength = 'Strong'
      self.weakness = 'Weak'
      self.strength_roll = 3 + rand(4)
    when 2
      self.strength = 'Weak'
      self.weakness = 'Disassembled'
      self.strength_roll = 2 + rand(2)
    when 3
      self.strength = 'Disassembled'
      self.weakness = 'Well Assembled'
      self.strength_roll = 2 + rand(2)
    end 
    
    # Generate display name
    if self.strength == nil
      self.display_name = display_name
    else
    self.display_name = strength + ' ' + display_name
    end
    # Generate Buy and Sell Value
    self.buy = ((self.min_speed * 4) + (self.max_speed * 3)) + ((self.min_block * 5) + (self.max_block * 3)) + ((self.min_damage * 8) + (self.max_damage * 7)) + (self.health * 4)
    self.sell = (self.buy * 0.8).to_f
    
  end
  
  attr_accessible :user, :room, :display_name, :description, :buy, :sell, :strength, :weakness, :strength_roll, :image, :health, :min_speed, :max_speed, :min_damage, :max_damage, :min_block, :max_block
  
end
