require 'test_helper'

class ShoppingListsControllerTest < ActionController::TestCase

  context "GET :index" do
    setup do
      get :index
    end

    should render_template :index
  end
end
