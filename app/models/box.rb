class Box < ActiveRecord::Base
  attr_accessible :display_name, :user, :item_quantity, :description, :gold, :fight, :odds, :size, :loser, :user_name, :loser_name, :bought_at_shop, :opened
  
  belongs_to :user
  belongs_to :fight
  
  before_create :make_random_box
  
  
  def make_random_box
    
    if self.bought_at_shop == nil 
      
    @display_name_roll = rand(630)
    
    case @display_name_roll
    when 0..300
      self.size = 'Tiny'
      self.item_quantity = 0 + rand(1)
    when 301..550 
      self.size = 'Small'
      self.item_quantity = 0 + rand(2)
    when 551..600
      self.size = 'Normal'
      self.item_quantity = 0 + rand(3)
    when 601..625
      self.size = 'Big'
      self.item_quantity = 1 + rand(3)
    when 626..630
      self.size = 'Huge'
      self.item_quantity = 1 + rand(4)
    end 
      
    if self.odds == nil
      self.odds = 0
    end
      
    @item_type_roll = (rand(400) + self.odds)
    
    if @item_type_roll < 0
      @item_type_roll = 0
    end
    
    if @item_type_roll > 400
      @item_type_roll = 400
    end
    
    case @item_type_roll
    when 0..249
      self.description = 'Copper'
      if self.gold == nil
      self.gold = 25 + rand(25)
      end
    when 250..349
      self.description = 'Silver'
      if self.gold == nil
      self.gold = 40 + rand(60)
      end
    when 350..383
      self.description = 'Gold'
      if self.gold == nil
      self.gold = (80 + rand(80)) * (1 + rand(2))
      end
    when 384..391
      self.description = 'Ruby'
      if self.gold == nil
      self.gold = (120 + rand(110)) * (1 + rand(3))
      end
    when 392..398
      self.description = 'Onyx'
      if self.gold == nil
      self.gold = (150 + rand(200)) * (1 + rand(3))
      end
    when 399..400
      self.description = 'Sun'
      if self.gold == nil
      self.gold = (200 + rand(325)) * (1 + rand(4))
      end
    end
    
    end
    
    self.opened = false
    
    self.display_name = self.size + ' ' + self.description + ' Capsule'
    
  end
end
