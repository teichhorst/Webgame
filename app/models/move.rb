class Move < ActiveRecord::Base
  belongs_to :fight
  belongs_to :user
  belongs_to :guard
  belongs_to :pet
  belongs_to :trap
  
  
  
  attr_accessible :user, :fight, :user_roll, :opponent, :opponent_roll, :opponent_stamina_loss, :opponent_stamina_before, :opponent_stamina_after, :stamina_loss, :stamina_before, :stamina_after

end
