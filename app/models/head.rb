class Head < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :list_head
  belongs_to :color
  
  before_create :randomly_make_head
  
  def randomly_make_head
    #everything is figured during initialization
    #You can call instance.make_weapon to do it at any time.
    
    #chance calculation for which one it picks from the list
    @odds = rand(1000000)
    
    @color_odds = rand(1000000)
    
    @head = ListHead.where('odds >= ?', @odds).order('RANDOM()').first
    
    self.list_head = @head
    
    @color = Color.where('odds >= ?', @color_odds).order('Random()').first
    
    self.color = @color
    
    self.display_name = @head.display_name
    self.level = 1
    self.description = @head.description
    
    self.base_min_speed = @head.min_speed
    self.base_max_speed = @head.max_speed
    self.base_min_block = @head.min_block
    self.base_max_block = @head.max_block
    
    self.min_speed = @head.min_speed
    self.max_speed = @head.max_speed
    self.min_block = @head.min_block
    self.max_block = @head.max_block
    
    #Chance Calculation for Quality
    random_quality = rand(1000)
    
    case random_quality
    when 0..500
      self.quality = 'Soft'
      self.min_speed = self.min_speed * 0.89
      self.max_speed = self.max_speed * 0.88
      self.min_block = self.min_block * 0.8
      self.max_block = self.max_block * 0.82
    when 501..800
      self.quality = 'Hard'
      self.min_speed = self.min_speed * 1.22
      self.max_speed = self.max_speed * 1.2
      self.min_block = self.min_block * 1.15
      self.max_block = self.max_block * 1.18
    when 801..1000
      self.quality = 'Protective'
      self.min_speed = self.min_speed * 1.45
      self.max_speed = self.max_speed * 1.35
      self.min_block = self.min_block * 1.22
      self.max_block = self.max_block * 1.25
    end
    
    # Generate display name
    self.display_name = quality + ' ' + display_name
    
    # Generate Buy and Sell Value
    self.buy = ((self.min_speed * 4) + (self.max_speed * 3)) + ((self.min_block * 5) + (self.max_block * 3))
    self.sell = (self.buy * 0.8).to_f
    
    
    
  end
  
  attr_accessible :user, :active, :display_name, :description, :buy, :sell, :image, :min_speed, :max_speed, :min_block, :max_block
  

end
