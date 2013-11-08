class ComplexesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @complexes = Complex.all
    
    @user = current_user
  end
  
  def show
    @complex = Complex.find(params[:id])
  end

end
