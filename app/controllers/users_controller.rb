class UsersController < ApplicationController
  def show
    @user = current_user
    @lists = @user.lists
    @item=Item.new
  end
end
