class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable         
  
  has_many :rooms
  has_many :rings, :dependent => :destroy
  has_many :heads, :dependent => :destroy
  has_many :chests, :dependent => :destroy
  has_many :hands, :dependent => :destroy
  has_many :legs, :dependent => :destroy
  has_many :sidearms, :dependent => :destroy
  has_many :weapons, :dependent => :destroy
  has_many :boots, :dependent => :destroy
  has_many :traps, :dependent => :destroy
  has_many :guards, :dependent => :destroy
  has_many :traps, :dependent => :destroy
  has_many :pets, :dependent => :destroy
  has_many :fights
  has_many :furnishings, :dependent => :destroy
  has_many :boxes, :order => 'created_at DESC'
  has_many :moves
  
  belongs_to :city

  
  after_create :set_up_user
  
  def set_up_user
    @find_room = Room.order('RANDOM()').first
    
    @find_room.user = self
    self.city = @find_room.complex.city
    
    self.gold = 6000
    
    Box.create(:user => self, :user_name => self.display_name, :gold => (10 + rand(20)))
    Box.create(:user => self, :user_name => self.display_name, :gold => (10 + rand(20)))
    Box.create(:user => self, :user_name => self.display_name, :gold => (10 + rand(20)))
    
    @guard = Guard.create(:user => self, :room => @find_room)
    @find_room.guard = @guard
    @pet = Pet.create(:user => self, :room => @find_room)
    @find_room.pet = @pet
    @trap = Trap.create(:user => self, :room => @find_room)
    @find_room.trap = @trap
    
    self.base_health = 100
    self.health = 100
    
    self.save
    @find_room.save
  end
  
  
  

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :gold, :display_name, :city, :admin
end
