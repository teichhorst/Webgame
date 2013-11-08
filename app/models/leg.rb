class Leg < ActiveRecord::Base
  belongs_to :user
  belongs_to :list_leg
  belongs_to :color
  
  before_create :randomly_make_leg
  
  def randomly_make_leg
    #everything is figured during initialization
    #You can call instance.make_weapon to do it at any time.
    
    #chance calculation for which one it picks from the list
    @odds = rand(1000000)
    
    @leg = ListLeg.where('odds >= ?', @odds).order('RANDOM()').first
    
    @color_odds = rand(1000000)
    
    @color = Color.where('odds >= ?', @color_odds).order('Random()').first
    
    self.color = @color
    
    self.list_leg = @leg
    
    self.display_name = @leg.display_name
    self.level = 1
    self.description = @leg.description
    
    self.base_min_speed = @leg.min_speed
    self.base_max_speed = @leg.max_speed
    self.base_min_block = @leg.min_block
    self.base_max_block = @leg.max_block
    
    self.min_speed = @leg.min_speed
    self.max_speed = @leg.max_speed
    self.min_block = @leg.min_block
    self.max_block = @leg.max_block
    
    #Chance Calculation for Quality
    random_quality = rand(1000)
    
    case random_quality
    when 0..500
      self.quality = 'Torn'
      self.min_speed = self.min_speed * 0.97
      self.max_speed = self.max_speed * 0.95
      self.min_block = self.min_block * 0.94
      self.max_block = self.max_block * 0.96
    when 501..800
      self.quality = 'Stained'
    when 801..1000
      self.quality = 'Magnificent'
      self.min_speed = self.min_speed * 0.68
      self.max_speed = self.max_speed * 0.65
      self.min_block = self.min_block * 1.25
      self.max_block = self.max_block * 1.35
    end
    
    # Generate display name
    self.display_name = quality + ' ' + display_name
    
    # Generate Buy and Sell Value
    self.buy = ((self.min_speed * 4) + (self.max_speed * 3)) + ((self.min_block * 5) + (self.max_block * 3))
    self.sell = (self.buy * 0.8).to_f
    
    
  end
  
  attr_accessible :user, :active, :display_name, :description, :buy, :sell, :image, :min_speed, :max_speed, :min_block, :max_block
end
