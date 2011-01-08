class ShoppingListsController < ApplicationController
  before_filter :require_user

  def index
    @lists = current_user.shopping_lists
  end

  def show
    @list = current_user.shopping_lists.find_by_id(params[:id])
  end

  def new
    @list = current_user.shopping_lists.new
  end

  private#####################

  def require_user
    unless current_user
      redirect_to new_sessions_path
    end
  end
end
