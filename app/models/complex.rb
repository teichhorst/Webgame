class Complex < ActiveRecord::Base
  has_many :rooms, :dependent => :destroy
  belongs_to :city
  
  before_create :make_random_complex
  
  after_create :make_rooms_for_complex
  
  FIRST_WORD = ['Comforting', 'Cheering', 'Cozy', 'Poised', 'Quiet', 'Restful', 'Content', 'Happy', 'Blissful', 'Chipper',
                 'Jolly', 'Light', 'West', 'East', 'South', 'North', 'Sparkling', 'Pleasant', 'Merry', 'Gleeful', 
                 'Glad', 'Thrilled', 'Captivated', 'Light', 'Heavy', 'Tired', 'Pleased', 'Upbeat', 'High', 'Low', 
                 'Trusted', 'Sleepy', 'Standing', 'Toppled', 'Warped']
  SECOND_WORD = ['Robin', 'Pheasant', 'Tiger', 'Barter', 'Squire', 'Dragon', 'Carp', 'Rooster', 'Dimer', 'Planter',
                 'Climber', 'Seeker', 'Sin', 'Rock', 'Piano', 'Whisper', 'Buyer', 'Seller', 'Pond', 'Lake',
                 'Ocean', 'Waterfall', 'Brick', 'Stone', 'Wood', 'Marble', 'Mineral', 'Lion', 'Elephant', 'Giraffe',
                 'Monkey', 'Deer', 'Bear', 'Beaver', 'Cougar', 'Lamb', 'Sheep', 'Frog', 'Trout', 'Octopus',
                 'Horse' ]
  THIRD_WORD = ['Hotel', 'Inn', 'Keep', 'Burrow', 'Dwelling', 'House', 'Abode', 'Cave', 'Castle', 'Digs',
                 'Roof', 'Flat', 'Homestead', 'Residence', 'Den', 'Mansion', 'Roost']
  
  def self.make_name
    
  end
  
  
  def make_random_complex
    @first_word = FIRST_WORD.sample
    @second_word = SECOND_WORD.sample
    @third_word = THIRD_WORD.sample
    self.display_name  = @first_word + ' ' + @second_word + ' ' + @third_word
    
    self.city = City.order("RANDOM()").first
  end
  
  def make_rooms_for_complex
  
  Room.create(:complex => self)
  Room.create(:complex => self)
  Room.create(:complex => self)
  Room.create(:complex => self)
  Room.create(:complex => self)
  Room.create(:complex => self)
  Room.create(:complex => self)
  Room.create(:complex => self)
  Room.create(:complex => self)
  Room.create(:complex => self)
  Room.create(:complex => self)
  Room.create(:complex => self)
  Room.create(:complex => self)
  Room.create(:complex => self)
  Room.create(:complex => self)
  Room.create(:complex => self)
  Room.create(:complex => self)
  Room.create(:complex => self)
  Room.create(:complex => self)
  Room.create(:complex => self)
  
  
  end
  
  attr_accessible :display_name, :buy, :sell, :worth, :user, :city
end
