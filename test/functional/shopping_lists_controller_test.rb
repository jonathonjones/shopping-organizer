require 'test_helper'

class ShoppingListsControllerTest < ActionController::TestCase

  context "Signed in as normal user. " do
    setup do
      sign_in_as_normal_user
    end

    context "GET :index" do
      setup do
        get :index
      end

      should render_template 'index'
    end
    
    context 'A shopping list exists' do
      setup do
        @list = Factory.create(:shopping_list, :user => @user)
        assert @list
      end
      
      context "GET :show the list" do
        setup do
          get :show, :id => @list.id
        end
        
        should render_template 'show'
      end
    end

    context "GET :new" do
      setup do
        get :new
      end

      should render_template 'new'
    end

    context "POST :create" do
      setup do
        post :create, :shopping_list => {:user_id => @user.id, :name => "New List"}
      end

      should "create a list" do
        assert @user.shopping_lists.find_by_name("New List")
      end
    end
  end
end
