class Sidearm < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :list_sidearm
  belongs_to :color
  
  before_create :randomly_make_sidearm
  
  def randomly_make_sidearm
    #everything is figured during initialization
    #You can call instance.make_weapon to do it at any time.
    
    #chance calculation for which one it picks from the list
    @odds = rand(1000000)
    
    @sidearm = ListSidearm.where('odds >= ?', @odds).order('RANDOM()').first
    
    self.list_sidearm = @sidearm
    
    self.display_name = @sidearm.display_name
    self.level = 1
    self.description = @sidearm.description
    
    self.min_speed = @sidearm.min_speed
    self.max_speed = @sidearm.max_speed
    self.min_block = @sidearm.min_block
    self.max_block = @sidearm.max_block
    self.min_damage = @sidearm.min_damage
    self.max_damage = @sidearm.max_damage
    
    self.base_min_speed = @sidearm.min_speed
    self.base_max_speed = @sidearm.max_speed
    self.base_min_block = @sidearm.min_block
    self.base_max_block = @sidearm.max_block
    self.base_min_damage = @sidearm.min_damage
    self.base_max_damage = @sidearm.max_damage
    
    #Chance Calculation for Quality
    random_quality = rand(1000)
    
    case random_quality
    when 0..500
      self.quality = 'Weak'
    when 501..800
      self.quality = 'Strong'
    when 801..1000
      self.quality = 'Painful' 
    end
    
    #Chance to have a strength and weakness
    random_strength = rand(100)
    
    case random_strength
    when 0..89
      self.strength = nil
      self.weakness = nil
      self.strength_roll = nil
    when 90
      self.strength = 'Clean'
      self.weakness = 'Dirty'
      self.strength_roll = 2 + rand(3)
    when 91
      self.strength = 'Dirty'
      self.weakness = 'Well Groomed'
      self.strength_roll = 3 + rand(4)
    when 92
      self.strength = 'Well Groomed'
      self.weakness = 'Sloppy'
      self.strength_roll = 2 + rand(2)
    when 93
      self.strength = 'Sloppy'
      self.weakness = 'Diseased'
      self.strength_roll = 2 + rand(2)
    when 94
      self.strength = 'Diseased'
      self.weakness = 'Clean'
      self.strength_roll = 2 + rand(2)
    when 95
      self.strength = 'Enraged'
      self.weakness = 'Calm'
      self.strength_roll = 2 + rand(2)
    when 96
      self.strength = 'Calm'
      self.weakness = 'Chaotic'
      self.strength_roll = 2 + rand(2)
    when 97
      self.strength = 'Chaotic'
      self.weakness = 'Orderly'
      self.strength_roll = 2 + rand(2)
    when 98
      self.strength = 'Orderly'
      self.weakness = 'Rowdy'
      self.strength_roll = 2 + rand(2)
    when 99
      self.strength = 'Rowdy'
      self.weakness = 'Restrained'
      self.strength_roll = 2 + rand(2)
    when 100
      self.strength = 'Restrained'
      self.weakness = 'Enraged'
      self.strength_roll = 2 + rand(2)
    end 
    
    
    
    # Generate display name
    if self.strength == nil
      self.display_name = quality + ' ' + display_name
    else
    self.display_name = strength + ' ' + quality + ' ' + display_name
    end
    # Generate Buy and Sell Value
    self.buy = ((self.min_speed * 4) + (self.max_speed * 3)) + ((self.min_block * 5) + (self.max_block * 3)) + ((self.min_damage * 8) + (self.max_damage * 7))
    self.sell = (self.buy * 0.8).to_f
    
    
    
  end  
  
  attr_accessible :user, :active, :display_name, :description, :buy, :sell, :strength, :weakness, :strength_roll, :image, :min_speed, :max_speed, :min_block, :max_block, :min_damage, :max_damage
end
