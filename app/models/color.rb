class Color < ActiveRecord::Base
  attr_accessible :hex_code, :display_name, :odds
  
  has_many :boots
  has_many :chests
  has_many :guards
  has_many :hands
  has_many :heads
  has_many :legs
  has_many :pets
  has_many :rings
  has_many :sidearms
  has_many :weapons
  has_many :traps
  has_many :furnishings
   
end
