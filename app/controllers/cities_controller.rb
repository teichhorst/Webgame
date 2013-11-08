class CitiesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @cities = City.all
    
    @user = current_user
  end
  
  def show
    @city = City.find(params[:id])
  end

  def travel
    @user = User.find(params[:id])
    @current_city = @user.city
    @travel_destination = City.find(params[:travel])
    @travel_cost = ((@current_city.coordinate_x - @travel_destination.coordinate_x).abs + (@current_city.coordinate_y - @travel_destination.coordinate_y).abs) * 7
    
    if @user.gold >= @travel_cost
    @user.city = @travel_destination
    @user.gold = @user.gold - @travel_cost
    @user.save
    
    redirect_to cities_path
    
    else 
    redicret_to cities_path
    end
    
  end
end
