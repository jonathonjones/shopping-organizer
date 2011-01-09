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

  def create
    @list = current_user.shopping_lists.new(params[:shopping_list])
    if @list.save
      flash[:notice] = 'Shopping list was successfully created.'
    end
    respond_with @list
  end

  def consolidate
    @list = current_user.shopping_lists.find_by_id(params[:id])
    @list.consolidate
    flash[:notice] = 'Shopping list has been consolidated.'
    redirect_to @list
  end

  private#####################

  def require_user
    unless current_user
      redirect_to new_sessions_path
    end
  end
end
