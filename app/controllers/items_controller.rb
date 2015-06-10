class ItemsController < ApplicationController

  def index
    @user = current_user
    @items = Item.all
  end

  def show
    @user = current_user
    @lists = @user.lists
    @item=Item.new
  end

  def create
     @user=current_user
     @item = current_user.items.build(item_params)
     @new_item=Item.new

    if @item.save
       flash[:notice] = "Item was saved."
     else
       flash[:error] = "There was an error saving the item. Please try again."
     end

     respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "To-do was destroyed"
      redirect_to items_path
    else
      flash[:notice] = "There was a problem destroying the to-do"
      redirect_to items_path
    end
  end


  private

  def item_params
    params.require(:item).permit(:name)
  end
end


