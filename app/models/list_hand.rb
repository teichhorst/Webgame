class ListHand < ActiveRecord::Base
  attr_accessible :description, :display_name, :min_block, :max_block, :level, :min_damage, :max_damage, :min_speed, :max_speed, :odds, :hand_image
  
  has_many :hands
  
  has_attached_file :hand_image,
    :styles => {
      :original => '120X80',
    }
    
  validates_attachment_size :hand_image, :less_than => 2.megabytes
end
