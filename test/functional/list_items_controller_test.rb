require 'test_helper'

class ListItemsControllerTest < ActionController::TestCase

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

    context 'A shopping list exists. ' do
      setup do
        @list = Factory.create(:shopping_list, :user => @user)
        assert @list
      end

      context "A list item exists for the shopping list. " do
        setup do
          @item = Factory.create(:list_item, :shopping_list_id => @list.id)
        end

        context "GET :show the list item" do
          setup do
            get :show, :id => @item.id
          end

          should render_template 'show'
        end

        context "GET :edit the list item" do
          setup do
            get :edit, :id => @item.id
          end

          should render_template 'edit'
        end

        context "PUT :update the list item" do
          setup do
            put :update, :id => @item.id, :list_item => { :name => "New Name" }
          end

          should "change the item" do
            @item.reload
            assert_equal "New Name", @item.name
          end
        end
      end

      context "GET :new" do
        setup do
          get :new, :shopping_list_id => @list.id
        end

        should render_template 'new'
      end

      context "POST :create" do
        setup do
          post :create, :list_item => { :shopping_list_id => @list.id, :name => "Apples" }
        end

        should "create a list item" do
          assert @list.list_items.find_by_name("Apples")
        end
      end
    end
  end
end
