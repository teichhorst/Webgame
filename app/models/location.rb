class Location < ActiveRecord::Base
    has_many :complexes
    has_many :users
    
    attr_accessible :coordinate_x, :coordinate_y, :display_name
end
