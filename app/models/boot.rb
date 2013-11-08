class Boot < ActiveRecord::Base
  belongs_to :user
  belongs_to :list_boot
  belongs_to :color
  
  before_create :randomly_make_boot
  
  def randomly_make_boot
    #everything is figured during initialization
    #You can call instance.make_weapon to do it at any time.
    
    #chance calculation for which one it picks from the list
    @odds = rand(1000000)
    
    @boot = ListBoot.where('odds >= ?', @odds).order('RANDOM()').first
    
    self.list_boot = @boot
    
    self.display_name = @boot.display_name
    self.level = 1
    self.description = @boot.description
    
    self.base_min_speed = @boot.min_speed
    self.base_max_speed = @boot.max_speed
    self.base_min_block = @boot.min_block
    self.base_max_block = @boot.max_block
    
    self.min_speed = @boot.min_speed
    self.max_speed = @boot.max_speed
    self.min_block = @boot.min_block
    self.max_block = @boot.max_block
    
    #Chance Calculation for Quality
    random_quality = rand(1000)
    
    case random_quality
    when 0..500
      self.quality = 'Patched'
      self.min_speed = self.min_speed * 0.82
      self.max_speed = self.max_speed * 0.89
      self.min_block = self.min_block * 0.97
      self.max_block = self.max_block * 0.98
    when 501..800
      self.quality = 'Strong'
      self.min_speed = self.min_speed * 1.04
      self.max_speed = self.max_speed * 1.02
      self.min_block = self.min_block * 1.2
      self.max_block = self.max_block * 1.23
    when 801..1000
      self.quality = 'Painful'
      self.min_speed = self.min_speed * 0.75
      self.max_speed = self.max_speed * 0.78
      self.min_block = self.min_block * 1.25
      self.max_block = self.max_block * 1.27
    end
    
    #Chance to have a strength and weakness
    random_strength = rand(100)
    
    case random_strength
    when 0..68
      self.strength = nil
      self.weakness = nil
      self.strength_roll = nil
    when 69..76
      self.strength = 'Well Assembled'
      self.weakness = 'Strong'
      self.strength_roll = 2 + rand(3)
    when 77..84
      self.strength = 'Strong'
      self.weakness = 'Weak'
      self.strength_roll = 3 + rand(4)
    when 85..92
      self.strength = 'Weak'
      self.weakness = 'Disassembled'
      self.strength_roll = 2 + rand(2)
    when 93..100
      self.strength = 'Disassembled'
      self.weakness = 'Well Assembled'
      self.strength_roll = 2 + rand(2)
    end 
    
    
    
    # Generate display name
    if self.strength == nil
      self.display_name = quality + ' ' + display_name
    else
    self.display_name = strength + ' ' + quality + ' ' + display_name
    end
    # Generate Buy and Sell Value
    self.buy = ((self.min_speed * 4) + (self.max_speed * 3)) + ((self.min_block * 5) + (self.max_block * 3))
    self.sell = (self.buy * 0.8).to_f
    
    
    
  end
  
  attr_accessible :user, :active, :display_name, :description, :buy, :sell, :strength, :weakness, :strength_roll, :image, :min_speed, :max_speed, :min_block, :max_block
end
