class ListSidearm < ActiveRecord::Base
  attr_accessible :description, :display_name, :min_block, :max_block, :level, :min_damage, :max_damage, :min_speed, :max_speed, :odds, :sidearm_image
  
  has_many :sidearms
  
  has_attached_file :sidearm_image,
    :styles => {
      :original => '120X250',
    }
    
  validates_attachment_size :sidearm_image, :less_than => 2.megabytes
end
