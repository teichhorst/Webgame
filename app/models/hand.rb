class Hand < ActiveRecord::Base
  belongs_to :user
  belongs_to :list_hand
  belongs_to :color
  
  before_create :randomly_make_hand
  
  def randomly_make_hand
    #everything is figured during initialization
    #You can call instance.make_weapon to do it at any time.
    
    #chance calculation for which one it picks from the list
    @odds = rand(1000000)
    
    @hand = ListHand.where('odds >= ?', @odds).order('RANDOM()').first
    
    self.list_hand = @hand
    
    self.display_name = @hand.display_name
    self.level = 1
    self.description = @hand.description
    
    self.base_min_speed = @hand.min_speed
    self.base_max_speed = @hand.max_speed
    self.base_min_block = @hand.min_block
    self.base_max_block = @hand.max_block
    
    self.min_speed = @hand.min_speed
    self.max_speed = @hand.max_speed
    self.min_block = @hand.min_block
    self.max_block = @hand.max_block
    
    #Chance Calculation for Quality
    random_quality = rand(1000)
    
    case random_quality
    when 0..500
      self.quality = 'Weak'
      self.min_block = self.min_block * 0.45
    when 501..800
      self.quality = 'Strong'
      self.min_block = self.min_block * 1.33
      self.max_block = self.max_block * 1.4
    when 801..1000
      self.quality = 'Painful'
      self.min_speed = self.min_speed * 0.45
      self.max_speed = self.max_speed * 0.55
      self.min_block = self.min_block * 1.11
      self.max_block = self.max_block * 1.15
    end
    
    #Chance to have a strength and weakness
    random_strength = rand(100)
    
    case random_strength
    when 0..73
      self.strength = nil
      self.weakness = nil
      self.strength_roll = 0
    when 74..76
      self.strength = 'Rabid'
      self.weakness = 'Calm'
      self.strength_roll = 2 + rand(3)
    when 77..79
      self.strength = 'Calm'
      self.weakness = 'Ecstatic'
      self.strength_roll = 3 + rand(4)
    when 80..82
      self.strength = 'Ecstatic'
      self.weakness = 'Lathargic'
      self.strength_roll = 2 + rand(2)
    when 83..85
      self.strength = 'Lathargic'
      self.weakness = 'Energetic'
      self.strength_roll = 2 + rand(2)
    when 86..88
      self.strength = 'Energetic'
      self.weakness = 'Drugged'
      self.strength_roll = 2 + rand(2)
    when 89..91
      self.strength = 'Drugged'
      self.weakness = 'Sober'
      self.strength_roll = 2 + rand(2)
    when 92..94
      self.strength = 'Sober'
      self.weakness = 'Angry'
      self.strength_roll = 2 + rand(2)
    when 95..97
      self.strength = 'Angry'
      self.weakness = 'Controlled'
      self.strength_roll = 2 + rand(2)
    when 98..100
      self.strength = 'Controlled'
      self.weakness = 'Rabid'
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
