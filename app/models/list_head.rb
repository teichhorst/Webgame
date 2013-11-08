class ListHead < ActiveRecord::Base
  attr_accessible :description, :display_name, :min_block, :max_block, :level, :min_damage, :max_damage, :min_speed, :max_speed, :odds, :head_image
  
  has_many :heads
  
  has_attached_file :head_image,
    :styles => {
      :original => '250X150',
    }
    
  validates_attachment_size :head_image, :less_than => 2.megabytes
end
