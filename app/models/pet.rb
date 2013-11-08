class Pet < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  belongs_to :list_pet
  belongs_to :color
  
  has_many :moves
  
  before_create :randomly_make_pet
  
  def randomly_make_pet
    #everything is figured during initialization
    #You can call instance.randomly_make_pet to do it at any time.
    
    #chance calculation for which one it picks from the list
    @odds = rand(1000000)
    
    @pet = ListPet.where('odds >= ?', @odds).order('RANDOM()').first
    
    self.list_pet = @pet
    
    self.display_name = @pet.display_name
    self.level = 1
    self.health = @pet.health
    self.description = @pet.description
    
    self.min_speed = @pet.min_speed
    self.max_speed = @pet.max_speed
    self.min_block = @pet.min_block
    self.max_block = @pet.max_block
    self.min_damage = @pet.min_damage
    self.max_damage = @pet.max_damage
    
    self.base_min_speed = @pet.min_speed
    self.base_max_speed = @pet.max_speed
    self.base_min_block = @pet.min_block
    self.base_max_block = @pet.max_block
    self.base_min_damage = @pet.min_damage
    self.base_max_damage = @pet.max_damage
    
    #Chance to have a strength and weakness
    random_strength = rand(8)
    
    
    case random_strength
    when 0
      self.strength = 'Rabid'
      self.weakness = 'Calm'
      self.strength_roll = 2 + rand(3)
    when 1
      self.strength = 'Calm'
      self.weakness = 'Ecstatic'
      self.strength_roll = 3 + rand(4)
    when 2
      self.strength = 'Ecstatic'
      self.weakness = 'Lathargic'
      self.strength_roll = 2 + rand(2)
    when 3
      self.strength = 'Lathargic'
      self.weakness = 'Energetic'
      self.strength_roll = 2 + rand(2)
    when 4
      self.strength = 'Energetic'
      self.weakness = 'Drugged'
      self.strength_roll = 2 + rand(2)
    when 5
      self.strength = 'Drugged'
      self.weakness = 'Sober'
      self.strength_roll = 2 + rand(2)
    when 6
      self.strength = 'Sober'
      self.weakness = 'Angry'
      self.strength_roll = 2 + rand(2)
    when 7
      self.strength = 'Angry'
      self.weakness = 'Controlled'
      self.strength_roll = 2 + rand(2)
    when 8
      self.strength = 'Controlled'
      self.weakness = 'Rabid'
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
