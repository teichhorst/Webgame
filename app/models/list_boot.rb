class ListBoot < ActiveRecord::Base
  attr_accessible :description, :display_name, :min_block, :max_block, :level, :min_damage, :max_damage, :min_speed, :max_speed, :odds, :boot_image
  
  has_many :boots
  
  has_attached_file :boot_image,
    :styles => {
      :original => '250X170',
    }
    
  validates_attachment_size :boot_image, :less_than => 2.megabytes
end
