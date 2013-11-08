class Fight < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  
  has_many :fights  
  has_many :moves, :order => 'created_at DESC', :dependent => :destroy

  
  before_create :randomly_make_fight_story
  
  OPENING = [ 'You crash through the door, destroying the lock with haste.', 'You kick down the door and stand ready for what is on the other side.', 
                'You pick the lock and swing open the door, ready to steal.']
                
  def randomly_make_fight_story
    self.opening = OPENING.sample
  end
  
  attr_accessible :user, :room, :fight_total, :odds, :fought, :won_by_thief, :room_user_name, :opening, :pet_health, :guard_health, :trap_health, :user_health, :guard_stamina, :user_stamina, :pet_stamina, :trap_stamina
end
