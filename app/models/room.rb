class Room < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :complex
  belongs_to :pet
  belongs_to :guard
  belongs_to :trap
  
  has_many :furnishings
  has_many :fights  
  has_many :guards
  has_many :pets
  has_many :traps

  before_create :set_room_price
  
  def set_room_price
    self.buy = 5000
    self.sell = 5000
  end
  
  attr_accessible :fight, :display_name, :description, :image, :user, :complex, :worth, :buy, :sell, :guard, :pet, :trap
end
