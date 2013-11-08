class ListTrap < ActiveRecord::Base
  attr_accessible :description, :display_name, :min_block, :max_block, :health, :level, :min_damage, :max_damage, :min_speed, :max_speed, :odds, :trap_image
  
  has_many :traps
  
  has_attached_file :trap_image,
    :styles => {
      :original => '200X300',
    }
    
  validates_attachment_size :trap_image, :less_than => 2.megabytes
end
