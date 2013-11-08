class ListLeg < ActiveRecord::Base
  attr_accessible :description, :display_name, :min_block, :max_block, :level, :min_damage, :max_damage, :min_speed, :max_speed, :odds, :leg_image
  
  has_many :legs, :dependent => :destroy
  
  has_attached_file :leg_image,
    :styles => {
      :original => '250X145',
    }
    
  validates_attachment_size :leg_image, :less_than => 2.megabytes
end
