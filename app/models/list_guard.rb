class ListGuard < ActiveRecord::Base
  attr_accessible :description, :display_name, :min_block, :max_block, :health, :level, :min_damage, :max_damage, :min_speed, :max_speed, :odds, :guard_image
  
  has_many :guards
  
  has_attached_file :guard_image,
    :styles => {
      :original => '200X300',
    }
    
  validates_attachment_size :guard_image, :less_than => 2.megabytes
end
