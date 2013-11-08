class ListChest < ActiveRecord::Base
  attr_accessible :description, :display_name, :min_block, :max_block, :level, :min_damage, :max_damage, :min_speed, :max_speed, :odds, :chest_image
  
  has_many :chests
  
  has_attached_file :chest_image,
    :styles => {
      :original => '250X115',
    }
    
  validates_attachment_size :chest_image, :less_than => 2.megabytes
end
