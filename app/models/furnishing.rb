class Furnishing < ActiveRecord::Base
  belongs_to :user
  belongs_to :room  
  belongs_to :color 
  
  before_create :randomly_make_furnishing
  
  # 1 - 10 dollars
  LEVEL_1 = ['Pencil', 'Coffee Cup', 'Needle', 'Lighter', 'Can of Soda']
  # 10 - 20 dollars
  LEVEL_2 = ['Computer Mouse', 'Shampoo', 'Whiskey']
  # 20 - 40 dollars
  LEVEL_3 = ['Mini Statue', 'Art Book', 'Wall Clock']
  # 40 - 60 dollars
  LEVEL_4 = ['Keyboard', 'Pot', 'Basket']
  # 60 - 80 dollars
  LEVEL_5 = ['Bochy Ball Set', 'Speaker', 'Table']
  # 80 - 100 dollars
  LEVEL_6 = ['Desk', 'Chair', 'Lamp']
  # 100 - 150 dollars
  LEVEL_7 = ['Wok', 'Juicer', 'Microwave']
  # 150 - 200 dollars
  LEVEL_8 = ['Box Spring', 'Cell Phone', 'Cat House']
  # 200 - 250 dollars
  LEVEL_9 = ['Lawn Mower', 'Weed Whacker', 'Statue']
  # 250 - 300 dollars
  LEVEL_10 = ['Pearl Necklace', 'Computer Desk', 'Meat Grinder']
  # 300 - 400 dollars
  LEVEL_11 = ['Love Seat']
  # 400 - 500 dollars
  LEVEL_12 = ['Garborator']
  # 500 - 600 dollars
  LEVEL_13 = ['Desktop Computer']
  # 600 - 700 dollars
  LEVEL_14 = ['Laptop']
  # 700 - 800 dollars
  LEVEL_15 = ['Small TV']
  # 800 - 1000 dollars
  LEVEL_16 = ['Exotic Artifact']
  # 1000 - 1500 dollars
  LEVEL_17 = ['Leather Couch']
  # 1500 - 2000 dollars
  LEVEL_18 = ['Electric Guitar', 'Guitar Amp']
  # 2000 - 2500 dollars
  LEVEL_19 = ['Electric Piano']
  # 2500 - 30000 dollars
  LEVEL_20 = ['Hi End Gaming Computer']
  # 3000 - 3500 dollars
  LEVEL_21 = ['Fridge']
  # 3500 - 4000 dollars
  LEVEL_22 = ['Riding Mower']
  # 4000 - 5000 dollars
  LEVEL_23 = ['Exotic Pet']
  # 5000 - 6000 dollars
  LEVEL_24 = ['Hot Tub']
  
  
  def randomly_make_furnishing
    #everything is figured during initialization
    #You can call instance.make_weapon to do it at any time.
    
    #chance calculation for description
    random_display_name = rand(1000)
    
    case random_display_name
    when 999..1000
      self.display_name = LEVEL_24.sample
      self.buy = 5000 + rand(1000)
      self.sell = self.buy * ((10 + rand(20)).to_f / (60 + rand(80)).to_f).to_f
      self.worth = self.buy * ((31 + rand(4)).to_f / (26 + rand(3)).to_f).to_f
      self.level = 24
    when 995..998
      self.display_name = LEVEL_23.sample
      self.buy = 4000 + rand(1000)
      self.sell = self.buy * ((10 + rand(20)).to_f / (58 + rand(75)).to_f).to_f
      self.worth = self.buy * ((31 + rand(4)).to_f / (26 + rand(3)).to_f).to_f
      self.level = 23
    when 990..994
      self.display_name = LEVEL_22.sample
      self.buy = 3500 + rand(500)
      self.sell = self.buy * ((10 + rand(20)).to_f / (56 + rand(72)).to_f).to_f
      self.worth = self.buy * ((31 + rand(4)).to_f / (26 + rand(3)).to_f).to_f
      self.level = 22
    when 980..989
      self.display_name = LEVEL_21.sample
      self.buy = 3000 + rand(500)
      self.sell = self.buy * ((10 + rand(20)).to_f / (55 + rand(70)).to_f).to_f
      self.worth = self.buy * ((31 + rand(4)).to_f / (26 + rand(3)).to_f).to_f
      self.level = 21
    when 965..979
      self.display_name = LEVEL_20.sample
      self.buy = 2500 + rand(500)
      self.sell = self.buy * ((10 + rand(20)).to_f / (52 + rand(68)).to_f).to_f
      self.worth = self.buy * ((31 + rand(4)).to_f / (26 + rand(3)).to_f).to_f
      self.level = 20
    when 945..964
      self.display_name = LEVEL_19.sample
      self.buy = 2000 + rand(500)
      self.sell = self.buy * ((10 + rand(20)).to_f / (50 + rand(65)).to_f).to_f
      self.worth = self.buy * ((31 + rand(3)).to_f / (27 + rand(2)).to_f).to_f
      self.level = 19
    when 920..944
      self.display_name = LEVEL_18.sample
      self.buy = 1500 + rand(500)
      self.sell = self.buy * ((10 + rand(20)).to_f / (48 + rand(63)).to_f).to_f
      self.worth = self.buy * ((31 + rand(3)).to_f / (27 + rand(2)).to_f).to_f
      self.level = 18
    when 893..919
      self.display_name = LEVEL_17.sample
      self.buy = 1000 + rand(500)
      self.sell = self.buy * ((10 + rand(20)).to_f / (46 + rand(61)).to_f).to_f
      self.worth = self.buy * ((31 + rand(3)).to_f / (27 + rand(2)).to_f).to_f
      self.level = 17
    when 863..892
      self.display_name = LEVEL_16.sample
      self.buy = 800 + rand(200)
      self.sell = self.buy * ((10 + rand(20)).to_f / (45 + rand(59)).to_f).to_f
      self.worth = self.buy * ((31 + rand(3)).to_f / (27 + rand(2)).to_f).to_f
      self.level = 16
    when 831..862
      self.display_name = LEVEL_15.sample
      self.buy = 700 + rand(100)
      self.sell = self.buy * ((10 + rand(20)).to_f / (44 + rand(56)).to_f).to_f
      self.worth = self.buy * ((31 + rand(3)).to_f / (27 + rand(2)).to_f).to_f
      self.level = 15
    when 796..830
      self.display_name = LEVEL_14.sample
      self.buy = 600 + rand(100)
      self.sell = self.buy * ((10 + rand(20)).to_f / (43 + rand(53)).to_f).to_f
      self.worth = self.buy * ((31 + rand(3)).to_f / (27 + rand(2)).to_f).to_f
      self.level = 14
    when 759..795
      self.display_name = LEVEL_13.sample
      self.buy = 500 + rand(100)
      self.sell = self.buy * ((10 + rand(20)).to_f / (42 + rand(50)).to_f).to_f
      self.worth = self.buy * ((31 + rand(3)).to_f / (27 + rand(2)).to_f).to_f
      self.level = 13
    when 719..758
      self.display_name = LEVEL_12.sample
      self.buy = 400 + rand(100)
      self.sell = self.buy * ((10 + rand(20)).to_f / (41 + rand(48)).to_f).to_f
      self.worth = self.buy * ((31 + rand(2)).to_f / (27 + rand(2)).to_f).to_f
      self.level = 12
    when 677..718
      self.display_name = LEVEL_11.sample
      self.buy = 300 + rand(100)
      self.sell = self.buy * ((10 + rand(20)).to_f / (39 + rand(45)).to_f).to_f
      self.worth = self.buy * ((31 + rand(2)).to_f / (27 + rand(2)).to_f).to_f
      self.level = 11
    when 632..676
      self.display_name = LEVEL_10.sample
      self.buy = 250 + rand(50)
      self.sell = self.buy * ((10 + rand(20)).to_f / (38 + rand(40)).to_f).to_f
      self.worth = self.buy * ((31 + rand(2)).to_f / (27 + rand(2)).to_f).to_f
      self.level = 10
    when 585..631
      self.display_name = LEVEL_9.sample
      self.buy = 200 + rand(50)
      self.sell = self.buy * ((10 + rand(20)).to_f / (37 + rand(37)).to_f).to_f
      self.worth = self.buy * ((31 + rand(2)).to_f / (27 + rand(2)).to_f).to_f
      self.level = 9
    when 535..584
      self.display_name = LEVEL_8.sample
      self.buy = 150 + rand(50)
      self.sell = self.buy * ((10 + rand(20)).to_f / (36 + rand(35)).to_f).to_f
      self.worth = self.buy * ((31 + rand(2)).to_f / (28 + rand(1)).to_f).to_f
      self.level = 8
    when 483..534
      self.display_name = LEVEL_7.sample
      self.buy = 100 + rand(50)
      self.sell = self.buy * ((10 + rand(20)).to_f / (35 + rand(33)).to_f).to_f
      self.worth = self.buy * ((31 + rand(2)).to_f / (28 + rand(1)).to_f).to_f
      self.level = 7
    when 429..482
      self.display_name = LEVEL_6.sample
      self.buy = 80 + rand(20)
      self.sell = self.buy * ((10 + rand(20)).to_f / (34 + rand(31)).to_f).to_f
      self.worth = self.buy * ((31 + rand(2)).to_f / (28 + rand(1)).to_f).to_f
      self.level = 6
    when 369..428
      self.display_name = LEVEL_5.sample
      self.buy = 60 + rand(20)
      self.sell = self.buy * ((10 + rand(20)).to_f / (33 + rand(30)).to_f).to_f
      self.worth = self.buy * ((31 + rand(2)).to_f / (28 + rand(1)).to_f).to_f
      self.level = 5
    when 299..368
      self.display_name = LEVEL_4.sample
      self.buy = 40 + rand(20)
      self.sell = self.buy * ((10 + rand(20)).to_f / (33 + rand(28)).to_f).to_f
      self.worth = self.buy * ((31 + rand(1)).to_f / (28 + rand(1)).to_f).to_f
      self.level = 4
    when 214..298
      self.display_name = LEVEL_3.sample
      self.buy = 20 + rand(20)
      self.sell = self.buy * ((10 + rand(20)).to_f / (32 + rand(25)).to_f).to_f
      self.worth = self.buy * ((31 + rand(1)).to_f / (28 + rand(1)).to_f).to_f
      self.level = 3
    when 114..213
      self.display_name = LEVEL_2.sample
      self.buy = 10 + rand(10)
      self.sell = self.buy * ((10 + rand(20)).to_f / (32 + rand(23)).to_f).to_f
      self.worth = self.buy * ((31 + rand(1)).to_f / (28 + rand(1)).to_f).to_f
      self.level = 2
    when 0..113
      self.display_name = LEVEL_1.sample
      self.buy = 1 + rand(10)
      self.sell = self.buy * ((10 + rand(20)).to_f / (31 + rand(20)).to_f).to_f
      self.worth = self.buy * ((31 + rand(1)).to_f / (28 + rand(1)).to_f).to_f
      self.level = 1
    end
    
  end
  
  
  
  attr_accessible :user, :room, :display_name, :buy, :sell, :worth, :image, :level
end
