class Guard < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  belongs_to :list_guard
  belongs_to :color
  
  has_many :moves
  
  before_create :randomly_make_guard
  
  def randomly_make_guard
    #everything is figured during initialization
    #You can call instance.randomly_make_guard to do it at any time.
    
    #chance calculation for which one it picks from the list
    @odds = rand(1000000)
    
    @guard = ListGuard.where('odds >= ?', @odds).order('RANDOM()').first
    
    self.list_guard = @guard
    
    self.display_name = @guard.display_name
    self.level = 1
    self.health = @guard.health
    self.description = @guard.description
    
    self.min_speed = @guard.min_speed
    self.max_speed = @guard.max_speed
    self.min_block = @guard.min_block
    self.max_block = @guard.max_block
    self.min_damage = @guard.min_damage
    self.max_damage = @guard.max_damage
    
    self.base_min_speed = @guard.min_speed
    self.base_max_speed = @guard.max_speed
    self.base_min_block = @guard.min_block
    self.base_max_block = @guard.max_block
    self.base_min_damage = @guard.min_damage
    self.base_max_damage = @guard.max_damage
    
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
    
    
        # Generate Size
    random_size = rand(100)
    
    case random_size
    when 0..7
      self.size = 'Tiny'
      self.max_speed = self.max_speed * 1.8
      self.min_damage = self.min_damage * 0.5
      self.max_damage = self.max_damage * 0.55
      self.min_block = self.min_block * 0.57
      self.max_block = self.max_block * 0.59
    when 8..29
      self.size = 'Small'
      self.max_speed = self.max_speed * 1.4
      self.min_damage = self.min_damage * 0.7
      self.max_damage = self.max_damage * 0.73
      self.min_block = self.min_block * 0.71
      self.max_block = self.max_block * 0.78
      
    when 30..59 
      self.size = ''
    when 60..79
      self.size = 'Big'
      self.max_speed = self.max_speed * 0.92
      self.min_damage = self.min_damage * 1.12
      self.max_damage = self.max_damage * 1.15
      self.min_block = self.min_block * 1.08
      self.max_block = self.max_block * 1.11
    when 80..90 
      self.size = 'Large'
      self.max_speed = self.max_speed * 0.85
      self.min_damage = self.min_damage * 1.18
      self.max_damage = self.max_damage * 1.21
      self.min_block = self.min_block * 1.18
      self.max_block = self.max_block * 1.19
    when 91..97
      self.size = 'Giant'
      self.max_speed = self.max_speed * 0.79
      self.min_damage = self.min_damage * 1.65
      self.max_damage = self.max_damage * 1.89
      self.min_block = self.min_block * 1.48
      self.max_block = self.max_block * 1.52
    when 98..100
      self.size = 'Gargantuan'
      self.max_speed = self.max_speed * 0.56
      self.min_damage = self.min_damage * 1.92
      self.max_damage = self.max_damage * 2
      self.min_block = self.min_block * 1.78
      self.max_block = self.max_block * 1.85
    end
    
    # Generate display name
    if self.strength == nil
      self.display_name = size + ' ' + display_name
    else
    self.display_name = strength + ' ' + size + ' ' + display_name
    end
    # Generate Buy and Sell Value
    self.buy = ((self.min_speed * 4) + (self.max_speed * 3)) + ((self.min_block * 5) + (self.max_block * 3)) + ((self.min_damage * 8) + (self.max_damage * 7)) + (self.health * 4)
    self.sell = (self.buy * 0.8).to_f
    
  end  
  
  attr_accessible :user, :room, :display_name, :description, :buy, :sell, :size, :size_roll, :strength, :weakness, :strength_roll, :image, :health, :min_speed, :max_speed, :min_damage, :max_damage, :min_block, :max_block
end
