class ShoppingListsController < ApplicationController

  def index
    @lists = current_user.shopping_lists
  end
end
