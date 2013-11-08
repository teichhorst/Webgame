class ListHeadsController < ApplicationController

  def new
    @list_head = ListHead.new
  end
  
  def create
    @list_head = ListHead.create(params[:list_head])
    
    redirect_to list_heads_path
  end
  
  def edit
    @list_head = ListHead.find(params[:id])
  end
  
  def update
    @list_head = ListHead.find(params[:id])
    
    @list_head.update_attributes(params[:list_head])
    
    redirect_to list_heads_path
  end
  
  def index
    @list_heads = ListHead.all
  end
  
  def destroy
    @list_head = ListHead.find(params[:id])
    
    @list_head.destroy
    
    redirect_to list_heads_path
  end

end
