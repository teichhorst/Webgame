class Ring < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :list_ring
  belongs_to :color
  
  before_create :randomly_make_ring
  
  def randomly_make_ring
    #everything is figured during initialization
    #You can call instance.make_ring to do it at any time.
    
    #chance calculation for which one it picks from the list
    @odds = rand(1000000)
    
    @ring = ListRing.where('odds >= ?', @odds).order('RANDOM()').first
    
    self.list_ring = @ring
    
    self.display_name = @ring.display_name
    self.level = 1
    self.description = @ring.description
    
    self.min_speed = @ring.min_speed
    self.max_speed = @ring.max_speed
    self.min_block = @ring.min_block
    self.max_block = @ring.max_block
    self.min_damage = @ring.min_damage
    self.max_damage = @ring.max_damage
    
    self.base_min_speed = @ring.min_speed
    self.base_max_speed = @ring.max_speed
    self.base_min_block = @ring.min_block
    self.base_max_block = @ring.max_block
    self.base_min_damage = @ring.min_damage
    self.base_max_damage = @ring.max_damage
    
    #Chance Calculation for Quality
    random_quality = rand(800)
    
    case random_quality
    when 0..500
      self.quality = 'Sturdy'
    when 501..800
      self.quality = 'Elegant'
    end
    
    
    # Generate display name
    
    self.display_name = quality + ' ' + display_name
    
    # Generate Buy and Sell Value
    self.buy = ((self.min_speed * 4) + (self.max_speed * 3)) + ((self.min_block * 5) + (self.max_block * 3)) + ((self.min_damage * 8) + (self.max_damage * 7))
    self.sell = (self.buy * 0.8).to_f
    
    
    
  end
  
  attr_accessible :user, :active, :display_name, :description, :buy, :sell, :image, :min_speed, :max_speed, :min_block, :max_block, :min_damage, :max_damage
  
  
end
