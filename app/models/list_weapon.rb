class ListWeapon < ActiveRecord::Base
  attr_accessible :description, :display_name, :min_block, :max_block, :level, :min_damage, :max_damage, :min_speed, :max_speed, :odds, :weapon_image
  
  has_many :weapons
  
  has_attached_file :weapon_image,
    :styles => {
      :original => '120X250',
    }
    
  validates_attachment_size :weapon_image, :less_than => 2.megabytes
end
