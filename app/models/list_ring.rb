class ListRing < ActiveRecord::Base
  attr_accessible :description, :display_name, :min_block, :max_block, :level, :min_damage, :max_damage, :min_speed, :max_speed, :odds, :ring_image
  
  has_many :rings
  
  has_attached_file :ring_image,
    :styles => {
      :original => '120X80',
    }
    
  validates_attachment_size :ring_image, :less_than => 2.megabytes
end
