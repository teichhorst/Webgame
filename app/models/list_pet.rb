class ListPet < ActiveRecord::Base
  attr_accessible :description, :display_name, :min_block, :max_block, :health, :level, :min_damage, :max_damage, :min_speed, :max_speed, :odds, :pet_image
  
  has_many :pets
  
  has_attached_file :pet_image,
    :styles => {
      :original => '200X300',
    }
    
  validates_attachment_size :pet_image, :less_than => 2.megabytes
end
