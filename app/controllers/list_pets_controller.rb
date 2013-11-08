class ListPetsController < ApplicationController

  def new
    @list_pet = ListPet.new
  end
  
  def create
    @list_pet = ListPet.create(params[:list_pet])
    
    redirect_to list_pets_path
  end
  
  def edit
    @list_pet = ListPet.find(params[:id])
  end
  
  def update
    @list_pet = ListPet.find(params[:id])
    
    @list_pet.update_attributes(params[:list_pet])
    
    redirect_to list_pets_path
  end
  
  def index
    @list_pets = ListPet.all
  end
  
  def destroy
    @list_pet = ListPet.find(params[:id])
    
    @list_pet.destroy
    
    redirect_to list_pets_path
  end

end
